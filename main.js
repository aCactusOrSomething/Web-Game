//this is the story variable.
var story = new inkjs.Story(storyContent);

//these are the bulletin board items. clicking on each one opens the right story.
var subwayBulletin = document.querySelectorAll('#subway')[0];
var policeStationBulletin = document.querySelectorAll('#policeStation')[0];
var victimOfficeBulletin = document.querySelectorAll('#victimOffice')[0];
var prisonBulletin = document.querySelectorAll('#prison')[0];
var morgueBulletin = document.querySelectorAll('#morgue')[0];
var apartmentBulletin = document.querySelectorAll('#apartment')[0];
var concertBulletin = document.querySelectorAll('#concert')[0];
var victimBulletin = document.querySelectorAll('#victim')[0];
var serialKillerBulletin = document.querySelectorAll('#serialKiller')[0];
var businessPartnerBulletin = document.querySelectorAll('#businessPartner')[0];
var currentBoyfriendBulletin = document.querySelectorAll('#currentBoyfriend')[0];
var exBoyfriendBulletin = document.querySelectorAll('#exBoyfriend')[0];
var policeOfficerBulletin = document.querySelectorAll('#policeOfficer')[0];

//these are the audio files
var subwayAudio = document.querySelectorAll('#subwayAudio')[0];
var morgueAudio = document.querySelectorAll('#morgueAudio')[0];
var policeStationAudio = document.querySelectorAll('#policeStationAudio')[0];
var apartmentAudio = document.querySelectorAll('#apartmentAudio')[0];
var prisonAudio = document.querySelectorAll('#prisonAudio')[0];
var concertAudio = document.querySelectorAll('#concertAudio')[0];

function displayScene(knotName) {
    story.ChoosePathString(knotName);
    var storyContainer = document.querySelectorAll('#textbox')[0];
    function showAfter(delay, el) {
        setTimeout(function() { el.classList.add("show") }, delay);
    }

    function scrollToBottom() {
        var progress = 0.0;
        var start = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
        var dist = document.body.scrollHeight - window.innerHeight - start;
        if( dist < 0 ) return;

        var duration = 300 + 300*dist/100;
        var startTime = null;
        function step(time) {
            if( startTime == null ) startTime = time;
            var t = (time-startTime) / duration;
            var lerp = 3*t*t - 2*t*t*t;
            window.scrollTo(0, start + lerp*dist);
            if( t < 1 ) requestAnimationFrame(step);
        }
        requestAnimationFrame(step);
    }

    function continueStory() {
        var paragraphIndex = 0;
        var delay = 0.0;
        updateBoard();
        // Generate story text - loop through available content
        while(story.canContinue) {

            // Get ink to generate the next paragraph
            var paragraphText = story.Continue();

            // Create paragraph element
            var paragraphElement = document.createElement('p');
            paragraphElement.innerHTML = paragraphText;
            storyContainer.appendChild(paragraphElement);

            // Fade in paragraph after a short delay
            showAfter(delay, paragraphElement);

            delay += 200.0;
        }

        // Create HTML choices from ink choices
        story.currentChoices.forEach(function(choice) {

            // Create paragraph with anchor element
            var choiceParagraphElement = document.createElement('p');
            choiceParagraphElement.classList.add("choice");
            choiceParagraphElement.innerHTML = `<a href='#'>${choice.text}</a>`
            storyContainer.appendChild(choiceParagraphElement);

            // Fade choice in after a short delay
            showAfter(delay, choiceParagraphElement);
            delay += 200.0;

            // Click on choice
            var choiceAnchorEl = choiceParagraphElement.querySelectorAll("a")[0];
            choiceAnchorEl.addEventListener("click", function(event) {

                // Don't follow <a> link
                event.preventDefault();

                // Remove all existing choices
                var existingChoices = storyContainer.querySelectorAll('p.choice');
                for(var i=0; i<existingChoices.length; i++) {
                    var c = existingChoices[i];
                    c.parentNode.removeChild(c);
                }

                // Tell the story where to go next
                story.ChooseChoiceIndex(choice.index);
                // Aaand loop
                updateBoard();
                continueStory();
            });
        });

        scrollToBottom();
    }

    function updateBoard() {
        console.log("checking game variables!");
        //ohhh boy its time for me to check each individual variable in the game
        //one at a time
        //without using a loop
        //because i hate myself
        if(story.variablesState.$("subway")) {
            subwayBulletin.style.display = "block";
        }
        if(story.variablesState.$("policeStation")) {
            policeStationBulletin.style.display = "block";
        }
        if(story.variablesState.$("victimOffice")) {
            victimOfficeBulletin.style.display = "block";
        }
        if(story.variablesState.$("prison")) {
            prisonBulletin.style.display = "block";
        }
        if(story.variablesState.$("morgue")) {
            morgueBulletin.style.display = "block";
        }
        if(story.variablesState.$("apartment")) {
            apartmentBulletin.style.display = "block";
        }
        if(story.variablesState.$("concert")) {
            concertBulletin.style.display = "block";
        }

        if(story.variablesState.$("victim")) {
            victimBulletin.style.display = "block";
        }
        if(story.variablesState.$("serialKiller")) {
            serialKillerBulletin.style.display = "block";
        }
        if(story.variablesState.$("businessPartner")) {
            businessPartnerBulletin.style.display = "block";
        }
        if(story.variablesState.$("currentBoyfriend")) {
            currentBoyfriendBulletin.style.display = "block";
        }
        if(story.variablesState.$("exBoyfriend")) {
            exBoyfriendBulletin.style.display = "block";
        }
        if(story.variablesState.$("policeOfficer")) {
            policeOfficerBulletin.style.display = "block";
        }
    }
    updateBoard();
    continueStory();

}

//these are for displaying the current storylet
var storyWrapper = document.querySelectorAll('#story')[0];
var storyContainer = document.querySelectorAll('#textbox')[0];
var closeButton = document.getElementsByClassName('close')[0];
//this is for the closing button
closeButton.onclick = function() {
    storyWrapper.style.display = "none";
}

//bulletin onclicks
subwayBulletin.onclick = function() {
    storyWrapper.style.display = "block";
    storyContainer.textContent = "";
    subwayAudio.play();
    displayScene("Subway");
}
policeStationBulletin.onclick = function() {
    storyWrapper.style.display = "block";
    storyContainer.textContent = "";
    policeStationAudio.play();
    displayScene("Station");
}
victimOfficeBulletin.onclick = function() {
    storyWrapper.style.display = "block";
    storyContainer.textContent = "";
    //no audio it looks like?
    displayScene("Office");
}
prisonBulletin.onclick = function() {
    storyWrapper.style.display = "block";
    storyContainer.textContent = "";
    prisonAudio.play();
    displayScene("Prison");
}
morgueBulletin.onclick = function() {
    storyWrapper.style.display = "block";
    storyContainer.textContent = "";
    morgueAudio.play();
    displayScene("Morgue");
}
apartmentBulletin.onclick = function() {
    storyWrapper.style.display = "block";
    storyContainer.textContent = "";
    apartmentAudio.play();
    displayScene("Apartment");
}
concertBulletin.onclick = function() {
    storyWrapper.style.display = "block";
    storyContainer.textContent = "";
    concertAudio.play();
    displayScene("Concert");
}

//AND SO IT BEGINS
displayScene("Intro");

//it is the last hour. i am copying this code from stackoverflow. fight me
//https://stackoverflow.com/questions/2368784/draw-on-html5-canvas-using-a-mouse
// create canvas element and append it to document body
var canvas = document.createElement('canvas');
canvas.style.zIndex = "1";
document.body.appendChild(canvas);

// some hotfixes... ( ≖_≖)
document.body.style.margin = 0;
canvas.style.position = 'fixed';

// get canvas 2D context and set him correct size
var ctx = canvas.getContext('2d');
resize();

// last known position
var pos = { x: 0, y: 0 };

window.addEventListener('resize', resize);
document.addEventListener('mousemove', draw);
document.addEventListener('mousedown', setPosition);
document.addEventListener('mouseenter', setPosition);

// new position from mouse event
function setPosition(e) {
  pos.x = e.clientX;
  pos.y = e.clientY;
}

// resize canvas
function resize() {
  ctx.canvas.width = window.innerWidth;
  ctx.canvas.height = window.innerHeight;
}

function draw(e) {
  // mouse left button must be pressed
  if (e.buttons !== 1) return;

  ctx.beginPath(); // begin

  ctx.lineWidth = 5;
  ctx.lineCap = 'round';
  ctx.strokeStyle = '#ff0000';

  ctx.moveTo(pos.x, pos.y); // from
  setPosition(e);
  ctx.lineTo(pos.x, pos.y); // to

  ctx.stroke(); // draw it!
}