//PUT ALL YOUR EVIDENCE VARIABLES HERE.

//LOCATIONS
VAR subway = true
VAR policeStation = false
VAR victimOffice = false
VAR prison = false
VAR morgue = false
VAR apartment = false
VAR concert = false

//CHARACTERS
VAR victim = false
VAR serialKiller = false
VAR businessPartner = false
VAR currentBoyfriend = false
VAR exBoyfriend = false
VAR policeOfficer = false

===Intro===
Officer Borsch - “Wow, what are the odds of you showing up like this, our rising detective star. I was about to call HQ to request you on this case, but to be frank it seems pretty direct. Check it out.” #Borsch
->Subway



===Subway===
A woman’s body lies mutilated by dozens of small infected bites. She’s sitting against the wall, eyes glazed over, with the signs of a quick painful death on her face. She’s dressed professionally, and a briefcase sits beside her body.
~ victim = true
+   Investigate Briefcase
    ->Subway.briefcase
+   Investigate Body
    ->Subway.body
+   Question Officer Borsch
    ~ policeOfficer = true
    ->Subway.borsch
+   {policeStation} Return To The Station
    ->Station


=briefcase
A few legal documents, business card holder, and laptop occupy most of the case. Aside from that, there's also a concert ticket.
(You have discovered the Concert Venue.)
~ concert = true
+   Go Back
    ->Subway


=body
Phone case / identification cards, personal business cards.
(You have discovered the Victim's Apartment.) 
~ apartment = true
(You have discovered the Victim's Office Building.)
~ victimOffice = true
+   Go Back
    ->Subway

=borsch
It's Office Borsch, a fellow from the force. What will you ask him?
+   “When did you get the call?” #Investigator
    Officer Borsch - “About 15 minutes ago, I was walking a patrol up top when I got a call from a couple witnesses, they’re standing right over there waiting to give me an official report. I’ll write it up and send it to you at the station.” #Borsch
    ->Subway.borsch
+   “Why do you think this is an easy one?" #Investigator
    Officer Borsch - “You saw the bites right? Just like the ones that Leora lady confessed to. This one’s a music corporate too. Maybe she got someone else to finish up her work. I’ll send you a summary of that case when we get back to the station.”
    ->Subway.borsch
+   “A music corporate? Did you look through her briefcase already?”
    Officer Borsch - “Yeah. You know I have some natural talent here. The connection was easy to verify once I saw the bites. Just didn’t want to wait for you.”
    ->Subway.borsch
+   “Don’t forget, this case is mine. Anything else I should know before I get back to the station to start research?" #Investigator
    Officer Borsch - “No, I’ll get the Forensics team to overlook all her affects, and you’ll get a full report with access to the morgue if you need it.” #Borsch
    ->Subway.borsch
+   Go Back
    (When you're done in the subway, you might want to head back to the Station.)
    ~ policeStation = true
    ->Subway
    
    
    
    
    
    
    
===Station===
A metro high-energy police department sprawls before you. Multiple high-profile cases create a buzz that stays active at all hours. Your office holds a full wall covered in corkboard to make connections. You have two unread emails waiting on your work desktop computer. 
(The Police Station has been added to your investigative corkboard - a conspiracy wall, of sorts, listing everywhere (and everyone) important to the case. You can use it for navigation by closing out of this textbox.) 
+   Read Emails
    ->Station.emails
    
=emails
You have two emails, it seems.
+   From: Officer Borsch
    ->Station.borschEmail
+   From: Forensics Department
    ->Station.forensicsEmail
+   Go Back
    ->Station

=borschEmail
To: Detective, From: Officer Borsch. Detective, Here’s the summaries of the witness testimonies, and the undisclosed information on the Leora string of kills earlier this month, they might be connected.
+   Witness Testimonies
    ->Station.testimonies
+   Leora String summary
    ->Station.leoraReport
+   Go Back
    ->Station.emails
    
=testimonies
There are two witness testimonies.
+   Read Testimony A
    Paula Heda, “I was the first person from the last train that arrived, and I turned that corner right there and here she was. Not a breath left in her. I called right away.”
    ->Station.testimonies
+   Read Testimony B
    Lance Foley, “I was pretty close behind this other lady, I helped comfort her - she was pretty shook up at the sight of a dead body. We both we agreed we should call 911 right away.”
    ->Station.testimonies
+   Go Back
    ->Station.borschEmail

=leoraReport
Leora Fulton, confessed killer of 4 men of great influence in the music industry. Every victim was found with multiple Funnel-Web Spider bites, and having been isolated from access to emergency services, they died from the venom.
(The Prison has been added to your corkboard. You can interact with Leora there.)
~ prison = true
+   Go Back
    ->Station.borschEmail
    
=forensicsEmail
To: Detective, From: Forensics Team. Detective, here’s the overview of the findings from the victim’s body, name verified as “Terise Kelly.” Body of the deceased is available for further investigation in the Morgue, cause of death verified as Funnel Web Spider Bite.
(The Morgue has been added to your corkboard.)
~ morgue = true
+   Go Back
    ->Station.emails






===Office===
The 51st story of a high-rise holds a music agency. Terise’s office is large and pristine, with walls covered in platinum records and pictures with the who’s who of popular music. An adjacent office is home to her assistant, Robert.
+   Do Nothing.
    You do nothing, because the content here isn't written yet. Maybe check somewhere else instead?
    ->Office





===Prison===
The visiting room in a high-security prison about 45 minutes outside of the metro is where you find yourself. On the other side of the glass is a disheveled woman who looks at you with tired eyes, holding the phone to her ear.
+   Do Nothing.
    You do nothing, because the content here isn't written yet. Maybe check somewhere else instead?
    ->Prison




===Morgue===
A lab lined with florescent bulbs, this dull room holds the victim’s corpse and samples of her poisoned blood. Funnel-web spiders were found in the purse of the victims, and investigation can lead to connecting these spiders to the victim’s death.
+   Do Nothing.
    You do nothing, because the content here isn't written yet. Maybe check somewhere else instead?
    ->Morgue


===Apartment===
A surprisingly comfortable apartment, home to the victim and her significant other Terrell, sits in a more residential part of town. A small dog cuddles with the home-body Terrell, who always seems to be holding a book or a laptop for typing.
+   “I’m here to ask you some questions about Terise, is that all right?”
    Terrell, “Yes, I’ve been expecting you Officer. It’s just been a tough morning for me. What questions do you have?”
    (Terell has been added to your bulletin board.)
    ~ currentBoyfriend = true
    ->Apartment.terell
+   Walk in and sit down in an armchair
    Terrell, “I’ve been expecting you Officer, I hope we can get through all these questions quick; I have some arrangements to make for Terise’s funeral. Could I grab you some water?”
+   +   "Yes, water would be great."
        Terrell pours you a glass of chilled water, placing it on a coaster on the side table. “So how can I help?”
        ->Apartment.terell
+   +   "No, I’m fine thanks."
        Terell shrugs, and leans back in his chair. "So how can I help?"
        ->Apartment.terell
+   “Now doesn’t seem like a good time, could I come back later today?”
    Terrell looks at you appreciatively, and says: “No, no of course we need to do this as soon as possible. Thank you for your concern. Let me pour you a glass of water and we can get right to your questions.” He pours a glass of chilled water and sets it on a side table adjacent to an armchair he gestures towards. “So how can I help?"
    ->Apartment.terell

VAR askedAboutLastTime = false
=terell
+   “Tell me about your relationship with Terise.”
    Terrell crosses his legs. “She met me right after getting out of a really negative relationship. I thought I was just a rebound, and I was okay with that. But she stuck around. We had a good relationship, over 9 years. She scared me sometimes though, she had this animal attraction to bad boys and they’d pop up and try to steal her away. I’m above that kind of nonsense though, it never phased me."
    ->Apartment.terell
+   “When was the last time you talked to Terise?”
    Terrell – He glances at the ground, “It was right before she left for that concert, Clay asked her to come and she decided to go. She never goes to shows. I was really confused, but it made sense.”
       	You – “Why were you confused; it seems natural to go to a client’s concert?”
    	Terrell – “No, that’s the whole thing. She had made it her trademark to not go to concerts. She was strictly the business and numbers side. Of course, she made an exception for him though. It doesn’t matter though.”
    	~askedAboutLastTime = true
    	->Apartment.terell
+   {askedAboutLastTime}“Do you know Clay?”
        Terrell clenches his jaw when you mention Clay’s name. “Yeah of course I know Clay. He dated Terise before I did. He went down a deep hole after she broke up with him. He wrote that one song for Back in Blue when he was wasted and thought for years that he could only write another hit if he kept up that lifestyle. She never really mentioned him through our relationship until a few months ago, when he showed up at her office with a new album.” Terrell shakes his head.
        ->Apartment.terell
+   {askedAboutLastTime}“Why didn’t you go to the concert with her?”
    “I think it’s pretty obvious. I didn’t want to listen to a song he wrote about my long-term girlfriend. I didn’t understand why she would want to go listen to a song that her drunk ex wrote about her just to get a record deal. I was mad so I went and spent the night at my parents. I was planning on talking to Terise about it last night when I got back from work; but of course all of this happened. They told me it was an accident. It was right?"
    ->Apartment.terell
+   Go back to the police station
    You – “I’ll keep you filled in, thanks for all your help. Stay in town.”
    ->Station


===Concert===
VAR askedAbtMusician = false
A standing-only theater made for concerts sits in a dark corner of the metro, and it’s alley leads you to a back entrance. It feels wrong to go to a place like this in the middle of the day. 
+   Walk Into Alley Door
    You run into a stagehand who’s running some cables around a corner. He looks up confused. ->Concert.alley
+   Knock on Front Entrance
    ->concert.front
+   {askedAbtMusician} Go Look for Clay
    ->Concert.clay

=alley
He blurts out, “Can I help you?”
+   “Do you know Terise Kelly?”
    Stagehand - “Name sounds familiar… did she come backstage the other night?”
    You - “I’m pretty sure she came as a VIP night before last.”
    Stagehand - “Oh yeah, for Clay’s first night here. I remember her, and it seemed like she knew him pretty well. He’s just up on the stage doing a soundcheck if you want to talk to him.”
    ->Concert.alley
+   “Who performed here last night?”
    Stagehand - “Clay Cross, you know the guy who wrote that love song for the movie Back in Blue about 10 years ago? He came out with some new stuff and got some producer to fund a new go at it.”
    You - “Is he here? I’d like to talk to him.”
    Stagehand - “He’s just up on the stage doing a soundcheck if you want to talk to him.”
    ~ askedAbtMusician = true
    ->Concert.alley
+   {askedAbtMusician} Go Look for Clay
    ->Concert.clay
+   Go Back
    ->Concert

=clay
    You walk onto the stage and find yourself alone in a room with a middle-aged man holding a guitar. He’s hooked up to the sound system, playing himself a soppy love song. You stand for a minute or two to listen. When he finishes the song he looks up at you. “You like what you hear?”
+   “Sounds like every other love song to me.”
    Clay - “I’ve always had that problem. It’s not that I don’t feel it, it’s just that everyone else has felt the same things so the output is all uniform. You know I’m just now getting back into the game? I took a long hiatus, honestly a rough hiatus, but I’m fighting to make it one more time.”
    ->Concert.oneMore
+   “You’ve got a nice voice.”
    Clay - “Thanks. It used to make me a lot of money. I’m trying to get back into it one more time, see what I can make of my talent as it ages.”
    ->Concert.oneMore
+   “Don’t care how you sound, I need to talk to you.”
    Clay - “A man with a mission? You know usually it's not a great idea to try to get a musician’s attention by saying you don’t care how they sound. Just a tip for the future. What’s on your mind?”
    You - “Do you know Terise Kelly?”
    ->Concert.teriseIs

=oneMore
    You - “One more time? Are you talking about Back in Blue?” 
    Clay - “How’d you know that was me? Why didn’t you come to my concert a couple nights ago? This is just what she said - ‘everyone knows your song, everyone will come’ - but nobody did.”
    You - “Who said that to you?”
    ->Concert.teriseIs

=teriseIs
Clay - “Terise is my manager. She believed in me when I said I had good new stuff, and she gave me a studio deal and a few concert dates. The album tanked, and the crowd was thin the other night. She bombed it and she knew it too. She sank my last chance right down the drain. She came to the first concert a couple nights ago and just got up and left halfway through.”
You - “You heard from Terise since then?”
Clay - “What? Who are you? Why do you care about Terise? Look if you want an interview talk with the guy backstage with the headset, he’s doing press for now.”
You - “I’m with the Police Department. Terise’s body was found in a subway station and I’m trying to find out what happened. So I’ll ask you again, when was the last time you talked to Terise?”
Clay - Clay nervously shuffles his feet, obviously weighing his next words in his head. “I had no idea, Officer. No, I haven’t talked to her since my first concert a couple nights ago. Have you talked to Terrell yet? He’s definitely seen her since then.” Clay drops his head into his hands, resting on his guitar. “What do I do now?”
You - “Don’t leave town, be honest with me, we can get all this cleared up and make sure Terise gets justice.”
(Clay Cross has been added to your investigative bulletin. You can question him further there.)
~ exBoyfriend = true
+   Go back
    ->Concert


===QuestionClay===
You decide to ask Clay a little bit more.
+   “Did you see anything else odd with Terise that would make you think someone would want to kill her?”
    Clay - “No, she was a wonderful person. First off, she never comes to concerts, you’ve got to know that, so her showing up to my opening night was amazing. I felt on top of the world. But this jerk Security Officer your Police Department sent us had some massive stick up his butt about not letting her in without a pass. I came back as soon as I heard the ruckus and tried to clear it up, but Terise went off on him. His face turned purple and he just left. It was all for nothing though, the concert was a disaster and she left halfway through.”
    ->QuestionClay

    









