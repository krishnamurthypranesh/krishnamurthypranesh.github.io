---
layout: post
title: What I'm building to track my training

excerpt_separator: <---!>
permalink: /posts/tracking-training/
---

# Tl:dr
Sthira (what I'm calling it right now) is a side-project I'm building to track my training.

It's a traditional workout log with 2 key differences:
1. It's digital
2. It (almost) writes itself (magic by LLMs)

# Context
I've got an obsession with tracking numbers. I attribute this to one line from House M.D when House tells Foreman that "Numbers don't lie".

{% include image.html url="/images/tracking_training/plan_excel.png" alt="Exhibit A: A training plan in excel" caption="Exhibit A: A training plan in excel" %}

{% include image.html url="/images/tracking_training/session.png" alt="Exhibit B: A training week in the plan above" caption="Exhibit B: A training week in the plan above" %}

But, I'm also lazy and don't want to spend hours every week inputting data into excel sheets/forms. Simply put: I want all the cool charts without putting in any of the work.

About 6 months ago, I noticed that I generally write a program and stick to it. I occasionally do deviate from it. But 90% of the time, I do what's on the plan. And, I take copious amounts of notes: about how I'm feeling or about how the 5th rep of the 8th set felt off, etc.

# The Solution
The idea is simple: If I already know what I'm doing and I capture the subtleties of training in my notes - and, anyone who reads can extract meaning - why can't I use LLMs to automate the entire pipeline?

So, the entire idea is simple:
- Write the training plan in plain English
- Extract structure from it
- Analyse this data to find patterns in your training that are holding you back

All this while keeping the amount of forms I fill to a minimum.


# What about existing solutions?
Existing solutions (Whoop, Garmin) are great but I see two fundamental constraints: 
- They require repeated structured input before I can get any insights. This is not much different from the excel sheets I had.
- They provide interesting numbers but without the context (5th rep of the 8th set feeling heavy)
- I've found that they don't do a great job when it comes to tracking load across different activities (for e.g. squats vs long distance runs)

Now, I do use gadgets to get more information about my training (I have a Garmin HRM that I use religiously), but these numbers lack context and I think this context has a lot of useful information.

The problem that's interesting to me is quantifying context. And, this is the technical challenge that motivated me to build this.

# The Stack
I went with a pretty stable, battle tested stack:
- Postgres for the database
- Python (django+django ninja): 
    - Django because its batteries included 
    - Django ninja because I like using pydantic. I think it offers better readability than DRF serializers
- React and Mantine for the UI (I'm using inertia.js for SSR)
    - Mantine because it gets me started very very quickly
- LLMs for processing text data
- dokku for deployments

I'm using firebase for authentication simply because I don't want to store passwords in my db. And I chose inertia.js because I don't want to run another container in my already resource constrained environment.

The reason I chose this stack is because I had a template repo on github with all of the backend components laid out. I knew it worked and I didn't want to fight the framework (figuring out what to build is hard enough already).

# What I've built so far
Right now, all of this code is deployed on a single VPS (I'm the only user right now)

So far I've gotten the structured data extraction from unstructured data in place => numbers and charts from notes that I take when I'm training.

{% include image.html url="/images/tracking_training/sthira_draft_plan_review.png" alt="A plan written in plain English" caption="A plan written in plain English" %}
{% include image.html url="/images/tracking_training/sthira_processed_plan.png" alt="The plan structured as items in a list by an LLM" caption="A plan structured as items in a list by an LLM" %}
{% include image.html url="/images/tracking_training/sthira_converted_plan_overview.png" alt="The same plan after its fully processed" caption="The same plan after its fully processed" %}
{% include image.html url="/images/tracking_training/sthira_training_day_details.png" alt="An individual day of training in the same plan" caption="An individual day of training in the same plan" %}


# Next is What?
I'm not close to being finished yet. Here's what I have in the pipeline for Sthira:
## More Numbers
- Extracting more quantified info from exercise notes (what I'm working on right now): 
    - Load, rest intervals, etc 
- Analytics on these numbers: The nice charts
- Inferring plan specific information based on context:
    - The same term might have different implications in different types of programs/cycles of training ("going hard" in the pure strength phase vs the consolidation phase)
    - This will be interesting because this involves combining sport/program specific knowledge while still keeping things general

## More Intelligence
- Recommendations and optimizations: The holy grail of building an intelligent application
- Making the LLM interpretations more reliable (avoiding hallucinations, reducing wrong interpretations, etc)
- Using numbers from gadgets to augment the contextual data extracted to improve inferences made

## Data Model Refinements
- I'm not able to track multiple sessions in the same day. The original data model had this. I chucked it because I wanted to get the core concept working. Now its time to add it back in.
- Adding training cycles (macro, meso, micro and anything in between)

## More Pretty
- The UI could definitely be better. I'll pick this up along the way.


# Follow Along...?
Right now, this isn't open to the public. And a lot of this is new to me. I'll be posting regularly about my learnings as I build this out.

I'm trying to build it as though I had users other than myself (just to train that product muscle).

If you found this brief intro interesting, then stick around for updates and future posts. 

The next post I'm planning is about extracting structured data from any notes I take while I'm training.
