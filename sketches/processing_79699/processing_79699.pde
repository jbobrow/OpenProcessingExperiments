
//Brendan M   Computer Programming 1    mods 4-5
String[] sarcasm = 
{
"Nope",
"I don't feel like answering today",
"I'm on break",
"Check back in 5",
"That's for me to know, and you to not find out",
"Stupid questions don't get answers",
"Why don't you ask your mum?",
"Ouch! Stop clicking so hard!",
"Look at how little I care",
"Puny mortal. You don't deserve answers",
"YOU CAN'T HANDLE THE TRUTH",
"Dude, you think I can answer that?",
"Nothing",
"...",
"I'm not helping you",
"Look to yourself for your answer",
"Does not compute",
"нет",
"не происходит",
"Ask me a question!",
"~~INSERT ANSWER HERE~~",
"I can't tell you that",
"Maybe if you go away",
"Bad request",
"400 Bad Request",
"Delete system32 and try again",
"503 Forbidden",
"Meh",
"I don't care",
"Does it look like I care?",
"Nein",
"413 Request Entity Too Large",
"404 answer Not Found",
"Well, you see...nevermind",
"Only if you make me a sandwich",
"I'll never talk!",
"I like turtles",
"Answer is simple...we kill the Batman",
"No way loser!",
"Maybe",
"Erm...about that...",
"What do YOU think?",
"I once questioned an inanimate object",
"What do i look like, a genie?",
"EIGHT!",
"8",
"If I say yes, will you stop clicking me?",
"I don't know",
"I'm not a fortune teller, you know",
"Get your own answers!",
"I'm not telling you",
"Yes...or no, I can't tell you what to do",
"Definitely maybe",
"I want to keep you guessing",
"The answer is...",
"Maybe a little cash will get me talking",
"Reply hazy, insert coin to continue",
"Forget about it",
"But, of course! Not. Maybe.",
"Yes...just kidding- It's never going to happen",
"Leave me alone already",
"ANSWER IS EIGHT!",
"Quit clicking me!",
"Take a guess",
"Don't click me, jerk",
"I'm not answering that",
"Don't you dare ask me that again",
"I would read your mind, but I'm getting a 404",
"HAHAHAHAHAHA...no",
"No hablo ingles.",
"I don't care",
"That's out of my jurisdction"
};


void setup()
{
  size (600,600);
  background(100);
  smooth();
}  

boolean answers = false;

void draw()
{

  
  if (answers == false)
  {
    background(100);
    fill(0);
    ellipse (300,270,500,500);
    fill(255);
    ellipse (300,270,350,350);
    fill(0);
    textSize(150);
    textAlign(CENTER);
    text("8", 300,300);
    fill(225,225,150);
    textSize(40);
    text("Ask me a question!",300,550);
    textSize(10);
    text("I dare you, sucker....",300,595);
  }
  else if (answers == true)
  {
    background(100);
    fill(255,100,255);
    triangle(30,220,570,220,300,450);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text(sarcasm[(int(random(sarcasm.length)))],300,300);
    noLoop();
  }
}
void mousePressed()
{
if (answers==false)
{
  answers=true;
  redraw();
}
else if (answers==true)
{
  answers=false;
  redraw();
}
}
