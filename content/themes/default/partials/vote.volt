{% if votes is defined %}

<span class="single-question-vote-result vote-result">{{ votes['positive'] - votes['negative'] }}</span>
<ul class="single-question-vote">
    <li>
        <a href="#" class="voter single-question-vote-down" title="Dislike" data-way="negative" data-object-id="{{ objectId }}" data-object="{{ object }}">
            <i class="icon-thumbs-down"></i>
        </a>
    </li>
    <li>
    <a href="#" class="voter single-question-vote-up" title="Like" data-way="positive" data-object-id="{{ objectId }}" data-object="{{ object }}">
        <i class="icon-thumbs-up"></i>
    </a>
    </li>
</ul>
{% endif %}
