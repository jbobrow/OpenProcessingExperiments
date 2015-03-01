
// The possibility of parallel universes is present and numerous.
// You know OF this, but you don't KNOW this, you don't experience this.

void setup() {

size(800,600);

// The house came with no furniture. The previous owners were not interested in selling any of it.
// You don't especially mind; this is your domain now. You and your partner could do as you please.
// The walls are so white.

}

void draw() {
  
background(255);

float x, y;
x = mouseX;
y = mouseY;

textAlign(CENTER);

PFont action, thought;
action = loadFont("Serif-30.vlw");
thought = loadFont("SansSerif-40.vlw");

// When people say we have no free will, what they really mean is that every decision and every move we make is affected by the generations before us. A combination of environment and genetics culminate in these decisions.
// Yet we are all our own unique combination of ancestry, and so despite lacking freedom we retain our one-point position in the universe, every universe.
// It's not so bad, is it?
// You sit down and contemplate the paint color.

String darling;
darling = "My darling, this morning I feel so";

// Who you are in this universe may be radically different from who you are in the next. Does that bother you?
// On Tuesday, November 28 you wake up next to your partner the day after you paint the walls.

String depressed;
depressed = "quietly ask to be left alone";

String peaceful;
peaceful = "breathe the morning air slowly and deeply";

String important;
important = "demand affection and breakfast in bed";

String rich;
rich = "bathe in the sweet smell of money";

String strong;
strong = "beat your strong, broad chest";

// Who you are, what you say, what you think, is an inevitable fate.
// But it is undeniably yours.

String brilliant;
brilliant = "shout out your million-dollar idea";

String bold;
bold = "make a move";

String bright;
bright = "burst into laughter";

String sick;
sick = "puke yesterday's salad all over their feet";

String impatient;
impatient = "rush out of the room";

String wise;
wise = "don't expect too little or too much";

String responsible;
responsible = "call your mother to tell her how you're doing";

String proud;
proud = "hold your head up high";

// Do you like yourself, in this universe?

String determined;
determined = "stand up!";

String brave;
brave = "conquer your fears";

String creative;
creative = "scribble down all your ideas";

String busy;
busy = "consult your schedule and begin immediately";

String annoyed;
annoyed = "tell them to shut the fuck up";

String confused;
confused = "squint at them and demand who they are";

String anxious;
anxious = "rub cold sweat from your hands";

// Do you like your partner in this universe, or would you prefer another?

String ambitious;
ambitious = "create a 5-year-plan";

String understanding;
understanding = "tell them you accept them";

String generous;
generous = "offer them more room on the bed";

String pretty;
pretty = "give your hair a flip";

String drowsy;
drowsy = "stretch and yawn loudly";

String envious;
envious = "compare yourself to their every move";

String dissatisfied;
dissatisfied = "look at the mirror with distaste";

String serious;
serious = "sit them down and have a discussion";

String melancholy;
melancholy = "let your tears fall";

String thoughtful;
thoughtful = "write down your conclusions";

String hazy;
hazy = "smoke a joint with them";

// We do this to ourselves, as humans, we wrap ourselves in our own ancestry and often cannot remove ourselves from it.
// Do you mind?

String caring;
caring = "embrace them in your arms";

String young;
young = "get out and go to the club";

String mischievous;
mischievous = "ask them to pull your finger";

String curious;
curious = "ask them about that tattoo";

String cynical;
cynical = "don't expect them to say anything original";

String studious;
studious = "don your glasses and squint at last night's reading";

String nostalgic;
nostalgic = "remember this day 10 years ago";

String gentle;
gentle = "cradle their cheek with your hand";

String clean;
clean = "wriggle your toes";

// Do you still own all those paint swatches? Maybe it's not too late to change your mind.

String hyper;
hyper = "giddily jump about the room";

String clever;
clever = "rattle off a riddle you heard at a bar";

String flirtatious;
flirtatious = "give them a flightly little peck";

String content;
content = "smile softly";

String reassuring;
reassuring = "tell them you think they're wonderful";

String lyrical;
lyrical = "clasp your hands to the sound of a soft hum";

String dainty;
dainty = "step lightly onto the carpet";

String free;
free = "float toward the ceiling";

// How unfortunate it is that we must choose to live in one universe at a time.

fill(y/4,y/3,x/4);
rect(0,0,800,600);

textFont(thought);
fill(255);
text(darling,400,275);

noStroke();
fill(255,100);
textFont(action);

// If you could choose one, if you know that you live in parallel universes and you experience them all simultaneously as one, would you?
// Which would you choose?

if (y < 100) {
  if (x < 100) {
    text(depressed,400,300);
  } else if ((x > 100) && (x < 200)) {
    text(peaceful,400,300);
  } else if ((x > 200) && (x < 300)) {
    text(important,400,300);
  } else if ((x > 300) && (x < 400)) {
    text(rich,400,300);
  } else if ((x > 400) && (x < 500)) {
    text(strong,400,300);
  } else if ((x > 500) && (x < 600)) {
    text(brilliant,400,300);
  } else if ((x > 600) && (x < 700)) {
    text(bold,400,300);
  } else if (x > 700) {
    text(bright,400,300);
  }
}

if ((y > 100) && (y < 200)) {
  if (x < 100) {
    text(sick,400,300);
  } else if ((x > 100) && (x < 200)) {
    text(impatient,400,300);
  } else if ((x > 200) && (x < 300)) {
    text(wise,400,300);
  } else if ((x > 300) && (x < 400)) {
    text(responsible,400,300);
  } else if ((x > 400) && (x < 500)) {
    text(proud,400,300);
  } else if ((x > 500) && (x < 600)) {
    text(determined,400,300);
  } else if ((x > 600) && (x < 700)) {
    text(brave,400,300);
  } else if (x > 700) {
    text(creative,400,300);
  }
}

if ((y > 200) && (y < 300)) {
  if (x < 100) {
    text(busy,400,300);
  } else if ((x > 100) && (x < 200)) {
    text(annoyed,400,300);
  } else if ((x > 200) && (x < 300)) {
    text(confused,400,300);
  } else if ((x > 300) && (x < 400)) {
    text(anxious,400,300);
  } else if ((x > 400) && (x < 500)) {
    text(ambitious,400,300);
  } else if ((x > 500) && (x < 600)) {
    text(understanding,400,300);
  } else if ((x > 600) && (x < 700)) {
    text(generous,400,300);
  } else if (x > 700) {
    text(pretty,400,300);
  }
}

if ((y > 300) && (y < 400)) {
  if (x < 100) {
    text(drowsy,400,300);
  } else if ((x > 100) && (x < 200)) {
    text(envious,400,300);
  } else if ((x > 200) && (x < 300)) {
    text(dissatisfied,400,300);
  } else if ((x > 300) && (x < 400)) {
    text(serious,400,300);
  } else if ((x > 400) && (x < 500)) {
    text(melancholy,400,300);
  } else if ((x > 500) && (x < 600)) {
    text(thoughtful,400,300);
  } else if ((x > 600) && (x < 700)) {
    text(hazy,400,300);
  } else if (x > 700) {
    text(caring,400,300);
  }
}

if ((y > 400) && (y < 500)) { 
  if (x < 100) {
    text(young,400,300);
  } else if ((x > 100) && (x < 200)) {
    text(mischievous,400,300);
  } else if ((x > 200) && (x < 300)) {
    text(curious,400,300);
  } else if ((x > 300) && (x < 400)) {
    text(cynical,400,300);
  } else if ((x > 400) && (x < 500)) {
    text(studious,400,300);
  } else if ((x > 500) && (x < 600)) {
    text(nostalgic,400,300);
  } else if ((x > 600) && (x < 700)) {
    text(gentle,400,300);
  } else if (x > 700) {
    text(clean,400,300);
  }
}

if (y > 500) {
  if (x < 100) {
    text(hyper,400,300);
  } else if ((x > 100) && (x < 200)) {
    text(clever,400,300);
  } else if ((x > 200) && (x < 300)) {
    text(flirtatious,400,300);
  } else if ((x > 300) && (x < 400)) {
    text(content,400,300);
  } else if ((x > 400) && (x < 500)) {
    text(reassuring,400,300);
  } else if ((x > 500) && (x < 600)) {
    text(lyrical,400,300);
  } else if ((x > 600) && (x < 700)) {
    text(dainty,400,300);
  } else if (x > 700) {
    text(free,400,300);
  }
}

// On Wednesday, November 29 you call your real estate agent and ask if the mortgage payment went through yet.
// You'd like to take another look at your options, you say, and perhaps fully furnished. Best let other people make the decisions for you.

}


