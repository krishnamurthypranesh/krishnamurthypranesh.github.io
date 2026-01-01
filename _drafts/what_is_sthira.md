---
layout: post
title: What I'm building to track my training

excerpt_separator: <---!>
permalink: /tracking-my-training
---

# Tl:dr
<---!>
Sthira (what I'm calling it right now) is a side-project I'm building to track my training.

Its a traditional workout log with 2 key differences:
1. Its digital
2. It writes itself (almost)
<---!>

I do have other features in mind: Basically correlating nutrition and mental health information to predict training performance. But, that's a long way off.


# Context
I've got an obsession with tracking numbers. I attribute this to one line from House M.D when House tells Foreman that "Numbers don't lie".

But, I'm also lazy and don't want to spend hours every week inputting data into excel sheets/forms. Simply put: I want all the cool charts without putting in any of the work.

<insert pic of excel sheet I used to have>

About 6 months ago, I noticed that I generally write a program and stick to it. I occasionally do deviate from it. But 90% of the time, I do what's on the plan. And, I take copious amounts of notes: about how I'm feeling or about how the 5th rep of the 8th set felt off, etc.

# The Solution
The idea is simple: If I already know what I'm doing and I capture subtle information about these things in my notes that anyone who reads can extract, why can't I use LLMs to automate the entire pipeline?

So, the entire idea is simple:
- Get the entire plan as natural language
- Extract structure from it
- And, then there's data to run analyses upon

# What about existing solutions?
Whoop, Garmin and other existing solutions are great. But, they:
- Cost a fortune
- Rely on manual entry of activities
- They provide a great base for the numbers


I believe that what I "feel" (yes emotions and the things that go on in my head) during training is just as important as the numbers from their gadgets.

# The Stack
I went with a pretty stable, battle tested stack:
- Postgres for the database
- Python (django+django ninja)
- React and Mantine for the UI (I'm using inertia.js for SSR)
- LLMs for processing text data

I'm using firebase for authentication. The reason I chose this stack is because I had a template repo on github with all of the backend components laid out.

I chose inertia.js for the frontend because it was easy. I didn't want spend time setting up a full frontend stack. I just went with what got me started very quickly.

# What I've built so far
Right now, all of this code is deployed on a single VPS (I'm the only user right now)

So, far I've gotten the structured data extraction from unstructured data in place => numbers and charts from notes that I take when I'm training.

## Next is What?
I'm planning on adding more automation:
- Extracting more quantified info from exercise notes as possible
- Auto analytics on these numbers
- And maybe some recommendations and optimizations too

I'm still figuring this out. 

I'll keep posting more about what I'm building here.
