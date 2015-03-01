
color c1 = #77E9FA;
color c2 = #60D135;
color c3 = #FFCC00;
color c4 = #FF2C92;

float xpos = 30;
float ypos = 50;
float ypos1 = 540;

void setup() {

  size(700,750);  
}

void draw() {
  background(#FC99D1);
 
  textSize(20);
  
  fill(255);
  text("One day, a little girl was sad because one of her dolls was lost,", 30, 30);
  text("she couldn't find the way of her rabbit doll even she has been", 30, 60);
  text("searched every corners of her home. She sat alone in her bedroom", 30, 90);
  text("and cried, her tears fell like", 30, 120);

fill(c1);
  text("rain drops.", 280, ypos);
  ypos++;
  
  fill(255);
  text("She was tired of crying and ", 382, 120);
  text("fell into sleep gradually. She entered the dream.", 30, 150);
  
  fill(c2);
  text("Little girl walked in beautiful prairie,", xpos, 180);
  xpos++;
  
  fill(255);
  text("it was like a wonderland, everyone may linger on that place once", 30, 210);
  text("they have been to there. Suddenly, she saw her missing doll, it was", 30, 240);
  text("walking in front of her!", 30, 270);
  
  fill(c4);
  text("'Where're you going, Bunny?'", 30, 330);
  
  fill(c1);
  text("'I'm leaving you and looking for a responsible kid to be my new owner.'", 30, 360);
  
  fill(c4);
  text("'Please don't ... ...'", 30, 390);
  
  fill(255);
  text("Bunny asked the little girl, 'If I come back and stay with you,", 30, 450);
  text("will you promise me that you will love every toys you have got", 30, 480);
  text("and cherish them?' Little girl didn't say anything but lifted her", 30, 510);
  text("little finger towards Bunny, and Bunny did the similar action", 30, 540);
  text("in response.", 30, 570);
  
  fill(c3);
  text("The sun risen up and shinning the whold world.", 30, ypos1);
  ypos1--;
  
  fill(255);
  text("When she woke up, she found that she was holding her lovely rabbit", 30, 630);
  text("doll in her arms, she dried her tears, a shinning smile appeared", 30, 660);
  text("on her face. She was happy again.", 30, 690);
   
}
