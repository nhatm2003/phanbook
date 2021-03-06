{% extends 'layouts/layout.volt' %}
{% block title %}{{ post is defined ? post.getTitle() : 'Phanbook'}}{% endblock %}
{% block content %}
    <div class="row">
            <div class="col-md-12">
                <div class="page-content ask-question">
                    <div class="boxedtitle page-title"><h2>Ask Question</h2></div>

                    <p>
                        {{ name }} is an open source project and a volunteer effort.
                        Help us make this a great place for discussion and collaboration. Please spend some time browsing the
                        topics here
                        before replying or starting your own, and you'll have a better chance of meeting others who share
                        your interests or have had similar problems. If you want to report any bug related to {{ this.config.application.name }} or
                        suggest a new feature, please post it on <a href="{{ this.config.application.repo }}">Github</a> issues.
                    </p>

                    <div class="form-style form-style-3" id="question-submit">
                        {{ form( this.view.getControllerName() | lower ~ '/save') }}
                            {% if post is defined %}
                                {{ form.render('id') }}
                            {% endif %}
                            <div class="form-inputs clearfix">
                                <p>
                                    <label class="required">Question Title<span>*</span></label>
                                     {{ form.render('title', ['id' : 'question-title']) }}
                                    <span class="form-description">Please choose an appropriate title for the question to answer it even easier .</span>
                                </p>
                                {% set value = null %}
                                {% if post.tag is defined %}
                                    <!-- set value tag to tag-input when to edit post -->
                                    {% for key, tag in post.tag %}
                                        {% set value = tag.getSlug() ~ "," ~ value %}
                                    {% endfor %}
                                {% endif %}
                                <p>
                                    <label class="required">Tags<span>*</span></label>
                                    <input type="text" id="tag-input" value="" name="tag-input" class="tag-editor">
                                    {{ form.render('tags',['value' : value])}}
                                    <span class="form-description">Please choose  suitable Keywords Ex : <span class="color">question , poll</span> .</span>
                                </p>
                                <div class="tag-suggestion-wrapper tag-suggestions"></div>
                            </div>
                            <div id="form-textarea">
                                <p>
                                    <label class="required">Details<span>*</span></label>
                                     {{ form.render('content')}}
                                    <span class="form-description">Type the description thoroughly and in detail .</span>
                                </p>
                            </div>
                            <p class="form-submit">
                                 {{form.render('save')}}
                            </p>
                            {{ form.render('object', ['value': 'posts']) }}
                            {{ form.render('type', ['value': type]) }}
                        </form>
                    </div>
                </div><!-- End page-content -->
            </div><!-- End main -->
        </div><!-- End row -->
{% endblock %}
