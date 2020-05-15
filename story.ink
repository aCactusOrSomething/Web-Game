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
(The Police Station has been added to your investigative corkboard - a conspiracy wall, of sorts, listing everywhere,and everyone, important to the case. You can use it for navigation by closing out of this textbox.
Just remember to come back here when you think you've solved the case.) 
+   Read Emails
    ->Station.emails
+   {victim && serialKiller && businessPartner && currentBoyfriend && exBoyfriend && policeOfficer} Make your accusation (End the game.)
    You head over to Borsch's office to get things settled.
    ->Ending
    
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
The 51st story of a high-rise holds a music agency. Terise’s office is large and pristine, with walls covered in platinum records and pictures with the who’s who of popular music. An adjacent office is home to her assistant, Robert. He stands leaning against her desk waiting for you to enter. As you walk in, directed by an assistant, Robert reaches out his hand to shake yours, “Robert, Terise’s partner. I ran all the smaller contracts. Let’s sit down and get to it?”
(Robert has been added to your board.)
~   businessPartner = true
-> Office.robert

=robert
+   “What do you gain from Terise’s death?”
    Robert looks at you incredulously. “What!? Terise gave me this job. I owe everything to her. You know who this was right? Everyone has been acting like it was just a freak accident, but I know who Leora is. It was her.”
    ->Office.robert
+   “What did you think of the contract with Clay?”
    Robert clenches his jaw. “I’ll be transparent with you; I didn’t like it. It just felt like a sop story to me – manager’s ex comes back with a new album all about her. But I don’t care about that now, something bigger happened. I don’t think this had to do with Clay, it was all Leora. You know Leora right?"
    ->Office.robert
+   “Where were you last night?”
    Robert -  “I was here at the office, working on another contract.”
    ->Office.robert
+   “What do you know about a woman named Leora?”
    Robert nods his head. “Of course I know Leora. I know you guys have tried to keep her case quiet but I read between the lines. Funnel-web spiders. You know the background, right?"
    You – “Tell me what you know.”
    Robert – “Leora got 4 different record deals from 4 companies. Every single one of them tanked. She spiraled out of control, deciding that the failures were the company's faults. She took them out one by one.”
    You – “Why the spiders though?”
    Robert – “That’s the worst part. She found out they were all part of this corporate industry club that called themselves the arachnids. She found the most deadly species she could and locked them in rooms with them one by one. The problem is up to this point they’ve all been men from the club. Terise had nothing to do with the arachnids. She was killed by spider bites right?
+   +   "Yes, she was covered in them."
        Robert – “I’d look into it if I was you. Let me know if I can do anything else for you.”
        ->Office.robert
+   +   "I haven’t been to the Morgue to investigate yet."
        Robert – “I’d bet anything they’ll be funnel-web bites. Let me know when you get the results, I’d like an assessment.”
        ->Office.robert
+   +   "It’s none of your business."
        Robert – “Of course, of course, I’d never want to intrude. I think I’m just having a hard time dealing with the loss of Terise. Let me know if you need anything else.”
        ->Office.robert
+   Go back to the station.
    ->Station





===Prison===
The visiting room in a high-security prison about 45 minutes outside of the metro is where you find yourself. On the other side of the glass is a disheveled woman who looks at you with tired eyes, holding the phone to her ear.
(Lenora has been added to your board.)
~ serialKiller = true
->Prison.lenora
    
=lenora
+   "Hello Leora."
    Leora sighs, shakes her head, and looks up at you. “Hello Officer. I thought I was done with these talks, I confessed, I’ve been locked up here for a week. What else could you possibly want from me?”
    You - “We found another body a couple nights ago, covered in bites just like the ones you were responsible for. Can you assure me this wasn’t you?”
    Leora - “I can assure you I didn’t do anything. I’ve been here, locked up, like I just said. Can we be done now?”
    ->Prison.lenora
+   "Who did the dirty work for you?"
    Leora - “Come on Officer. Look, I got what I wanted - those men deserved to die for what they did to me and so many other artists. What I did was start a movement for the artist. If people decide to act out of self-interest for their art, that’s their decision, not mine. Maybe I just inspired them. I’m pretty sure you can’t blame too much of that on me. So what happened?”
    You - “Terise Kelly, you know her?”
    Leora - “Uh oh. Yeah I know her. I never worked for her, or under her that is, but I heard about how she can be sometimes. Controlling, quick to write off a new project. She is just like the dirt-bags I took out. So what about her?”
    You - “She was found covered in spider bites in a subway. From what you know about her, who had the most against her, who had she hurt the most?”
    Leora - “I didn’t know her well enough. I only know Clay Cross worshiped the ground she walked on, her giving him that deal made his whole decade."
    ->Prison.lenora
+   "Do you know Clay Cross?"
    Leora - “Yeah I know the jerk, I co-wrote the track for Back in Blue, you know, his claim to fame. We were wasted in someone’s apartment with a couple of guitars and in the morning he swore to God he wrote it on his own. I couldn’t afford a legal battle with him. That’s the kind of culture these corporates force artists into, kill or be killed.”
    You - “What do you know about his relationship with Terise?”
    Leora - “He loves her. I know that much. I think he saw the record deal as a double win, get back his career and the girl. I don’t know if he could ever hurt her though, if that’s what you’re implying.”
    ->Prison.lenora
+   "Did you ever have a contract with Terise Kelly?"
    Leora - “No, I didn’t. Thank God. She could be a monster. The cop that took my confession came back in to ask me about her yesterday. I told him what I’m telling you, she was nasty.”
    ->Prison.lenora





===Morgue===
A lab lined with florescent bulbs, this dull room holds the victim’s corpse and samples of her poisoned blood. Funnel-web spiders were found in the purse of the victims, and investigation can lead to connecting these spiders to the victim’s death.
+   Talk to Forensics Officer
    With one eye attached to a microscope, Alan blurts out a greeting and an indication to wait a moment. He attacks a notepad, glancing back and forth between his writing and the sample he’s investigating. After adding a dramatic period, he looks up at you and asks, “Alrighty, you here for the Kelly case results?”
    You - “Yes.”
    ->Morgue.forensicsOfficer
+   Investigate File for Yourself
    You flash your badge at the entrance to the lab and go straight to a files cabinet. While sifting through the Js working towards Terise Kelly’s file, a voice shouts out to you from the back corner. “Hey, I’ve got your file over here, still working out some kinks!”
+   +   Approach the Forensics Worker
        Alan - “Good to see you again, I apologize for not being at the door waiting for you, I had no idea when you were coming… let me know next time. Anyways, on to the Kelly file. What do you need to know?”
        ->Morgue.forensicsOfficer

=forensicsOfficer
+   “What was the cause of death?”
    Alan looks up at you surprised, “Circulatory Collapse. I’ve examined four different bodies with the exact same results, the others had less bites though.
    You - “So its for certain that death was from those small bites?”
    Alan - “Yep, and I’ve got some of the nasty little genius monsters right over here, wanna take a look?”
    You - “Sure.”
    ->Morgue.atraxRobustus
    
+   “What kind of bites were on her skin?”
    ->Morgue.atraxRobustus
    
+   “Actually, can you pull me up the Leora String files? I want to compare…”
    Alan - “Of course, they’re pretty much the exact same though. I thought about going ahead and merging the files all together, but thought again since that’s kind of your job.”
    Alan hands you a file titled Leora String.
    ...
    Atrax Robustus, 10 specimens found in Leora’s apartment. Venom tested from bloodstream and found comparable to each of the specimens respectively. Each body shows overwhelming signs of death from venom. 
    ...
    You - “So either Terise stumbled into a nest of Atrax Robustus in the middle of a metro subway, or someone planted them on her.”
    Alan - “Atrax Robustus aren’t on this continent, they’re only in Australia. So no, she didn’t stumble into a nest. That’s all the analytical proof I can give you.”
    ->Morgue.forensicsOfficer
+   Return to your office in the station.
    ->Station


=atraxRobustus
Alan - “Atrax Robustus,” He says with some flair as he opens a drawer. The drawer is empty. Alan scrambles around in the drawer looking for a container. “Nope, nope, nope, nope, this isn’t happening!” He grabs the edge of the cabinet and breathes deeply. “The spiders that you guys found in Leora’s apartment from last week were right in here. I haven’t checked in a few days, but they were all right in here. 10 male Sydney funnel-web spiders. All of them have been given some kind of supplement that cranked up their aggressiveness. They can kill a human target in 15 minutes.”
You - “And they just got out on their own? Maybe another worker moved them?”
Alan - “Nope. Officer Borsch dropped them off in here and locked the drawer about a week ago after he got back from investigating Leora’s place. He gave me the only key.”
    ->Morgue.forensicsOfficer
    


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

    

===Ending===
+   "Let’s debrief what I’ve learned."
    Officer Borsch - “I look forward to hearing what you’ve learned.”
    You - “I’ve talked to a long list of people, Clay Cross (her ex), Terrell (her boyfriend), Robert (coworker), the Forensic team, and your hunch, Leora. I’ve learned alot about them, and their connections to each other and Terise. Clay thinks Terise tanked his last chance at success. Terrell think Terise was going to leave him for Clay. Robert seems convinced that Leora did it through someone else, and off wrote any questions I had about his personal gains from the death. the Forensic team helped me finalize that it couldn’t have been an accident, there were too many of too rare a spider attacking too specific of an individual. Leora assured me that she didn’t have any personal reason to take out Terise, but that it was an extension of the “ideas” that she championed."
    ->Ending
+   "What do you think about this whole Terise case?"
    Officer Borsch - “I think its clear it was an extension of Leora’s work. Some fanatic that Leora was in contact with decided they wanted to get back like she did. Clay would fit that description.”
    You - “But Leora told me that Clay could never hurt a hair on Terise’s head. He loves her too much.”
    Officer Borsch - “Well, who else has such a relationship with Leora?”
    ->Ending
+   "I need to ask you a question."
    Borsch furrows his brow. “Yeah whatever you need to make this case more clear.”
+   +   "Did you work a security job at Clay’s Concert?"
        Borsch - “Um yeah I did. They assigned it to me last minute. They didn’t need me the whole time though so I got out early.”
        You - “Did you meet Terise there?”
        Borsch - “Why would I have met Terise?”
        You - “Clay said she got in a verbal fight with a security officer at the back. One that the police force sent. He said the officer left out of frustration and seemed worked up.”
        Borsch - “Alright, alright, she did get upset at me but I kept my cool and just left when they asked me to. Lets get to the suspect room and get Clay!”
        ->Ending
+   +   "Did you take down Leora’s confession?"
        Borsch - “Yes I did, it was terrifying. You could see the hatred in her eyes.”
        You - “Did you see the same hatred when you went back to the prison to talk to her about Terise - the day that she was murdered?”
        Borsch - “Look, I don’t know where you’re going with this, but its obvious Leora wanted Clay to kill Terise so that she could get back at him for the whole Back in Blue fiasco.”
        You - “You know that makes sense. Lets go ahead and pick out the suspect.”
        ->Ending
+   Make your accusation.
    You think that the murder was committed by...
+   +   Terell
        ->Ending.badEnd
+   +   Clay
        ->Ending.badEnd
+   +   Robert
        ->Ending.badEnd
+   +   Leora
        ->Ending.badEnd
+   +   Borsch
        ->Ending.goodEnd

=badEnd
    You cuff the suspect you chose and lead them to a jail cell. You come out confident in your decision, ready to go finalize some paperwork with Borsch. He is nowhere to be found. In fact, no-one ever hears from him again.
    ->END
    
=goodEnd
    You spin around and throw Borsch to the ground. “You got caught in your own web.”
    ->END


    








