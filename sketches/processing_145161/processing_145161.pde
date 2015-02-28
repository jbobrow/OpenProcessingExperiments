
void setup () {
  size(900,650);

  
}



void draw() {
  background(255);
  for (int r=0; r<10; r++) {
    fill(r*25,200-r*25,200-r*25);
    rect(r*100, height*.9, 100,60);
    fill(0);
    textSize(15);
    text("Question ", r*100 + 14, height*.955);
    text(r+1, r*100+80, height*.955);
  }
    if (mouseY < 590) {
     intro(); 
    }
    if (mouseX < 100 && mouseY > 590) {
      Question1();
    }
    if (mouseX > 100 && mouseX < 200 && mouseY > 590) {
      Question2();
    }
    if (mouseX > 200 && mouseX < 300 && mouseY > 590) {
      Question3();
    }
    if (mouseX > 300 && mouseX < 400 && mouseY > 590) {
      Question4();
    }
    if (mouseX > 400 && mouseX < 500 && mouseY > 590 ) {
      Question5();
    }
    if (mouseX > 500 && mouseX < 600 && mouseY > 590) {
      Question6();
    }
    if (mouseX > 600 && mouseX < 700 && mouseY > 590 ) {
      Question7();
    }
    if (mouseX > 700 && mouseX < 800 && mouseY > 590 ) {
      Question8();
    }
    if (mouseX > 800 && mouseX < 900 && mouseY > 590 ) {
      Question9();
    }
}

void Question2() {
  fill(0,200,200);
  textSize(27);
  text("You are taking an easy class. How do you approach it?", 
    width*.03, height*.1);
  textSize(20);
  fill(175,0,0);
  text("Skip class and homeworks, but ace the tests.", width*.1, height*.2);
  rect(width*.1, height*.22, 100, 30);
  fill(150,50,50);
  text("Drop it, you're overwhelmed with your other classes as it is.", 
    width*.1, height*.35);
  fill(75,125,125);
  text("Put equal but relatively low effort into everything.", width*.1, height*.5);
  rect(width*.1, height*.52, 400, 30);
  fill(0,175,175);
  text("Take it just as seriously as your other classes and go the extra mile on",
    width*.1, height *.65);
  text("assignments to make sure you get an A.", width*.1, height*.68);
  rect(width*.1, height*.70, 200, 30);
}

void Question1() {
  fill(25,175,175);
  textSize(27);
  text("When making a decision, you:", 
    width*.03, height*.1);
  textSize(20);
  fill(175,0,0);
  text("Tend to hesitate or postpone it.", width*.1, height*.2);
  rect(width*.1, height*.22, 300, 30);
  fill(150,50,50);
  text("Decide immediately according to probabilities of success or failure.", 
    width*.1, height*.35);
  rect(width*.1, height*.37, 100, 30);
  fill(75,125,125);
  text("Act with your gut feelings.", width*.1, height*.5);
  rect(width*.1, height*.52, 400, 30);
  fill(0,175,175);
  text("Think about it until you are certain you are right.",
    width*.1, height *.65);
  rect(width*.1, height*.67, 200, 30);
}

void Question3() {
  fill(50,150,150);
  textSize(27);
  text("You are worried about failing a required class. What do you do?", 
    width*.03, height*.1);
  textSize(20);
  fill(175,0,0);
  text("Rationalize it by thinking about others who are worse off than you.", width*.1, height*.2);
  fill(150,50,50);
  text("Fight until the bitter end in hopes of passing.", 
    width*.1, height*.35);
  rect(width*.1, height*.37, 200, 30);
  fill(75,125,125);
  text("Cut your losses and drop it.", width*.1, height*.5);
  rect(width*.1, height*.52, 200, 30);
  fill(0,175,175);
  text("Negotiate with the Professor and spend extra time in office hours",
    width*.1, height *.65);
    text("or course center.", width*.1, height*.68);
  rect(width*.1, height*.7, 300, 30);
}

void Question4() {
  fill(75,125,125);
  textSize(27);
  text("When starting a new project you:", 
    width*.03, height*.1);
  textSize(20);
  fill(175,0,0);
  text("Make it up as you go along.", width*.1, height*.2);
  rect(width*.1, height*.22, 300, 30);
  fill(150,50,50);
  text("Have several backup plans in case you change your mind.", 
    width*.1, height*.35);
  fill(75,125,125);
  text("Rely on someone with experience for guidance.", width*.1, height*.5);
  rect(width*.1, height*.52, 100, 30);
  fill(0,175,175);
  text("Do extensive research to weigh the pros and cons.",
    width*.1, height *.65);
  rect(width*.1, height*.67, 100, 30);
}

void Question5() {
  fill(100,100,100);
  textSize(27);
  text("Do you consider yourself to be good at lying?", 
    width*.03, height*.1);
  textSize(20);
  fill(175,0,0);
  text("It's not lying, it's selective truthfulness.", width*.1, height*.2);
  rect(width*.1, height*.22, 100, 30);
  fill(150,50,50);
  text("Yes because I'm usually so honest that everyone believes me.", 
    width*.1, height*.35);
  fill(75,125,125);
  text("Yes but I feel really guilty when I lie.", width*.1, height*.5);
  fill(0,175,175);
  text("No, lying never seems to work out for me.",
    width*.1, height *.65);
  rect(width*.1, height*.67, 100, 30);
}

void Question6() {
  fill(125,75,75);
  textSize(27);
  text("Your life seems like it's falling apart and you need emotional " ,
    width*.03, height*.07);
  text("support. What do you do?", width*.03, height*.12);
  textSize(20);
  fill(175,0,0);
  text("Drink the pain away.", width*.1, height*.2);
  fill(150,50,50);
  text("Commiserate with friends.", 
    width*.1, height*.35);
  fill(75,125,125);
  text("Call your family.", width*.1, height*.5);
  rect(width*.1, height*.52, 200, 30);
  fill(0,175,175);
  text("Seek guidance from CAPS.",
    width*.1, height *.65);
  rect(width*.1, height*.67, 100, 30);
}

void Question7() {
  fill(150,50,50);
  textSize(27);
  text("Have you ever been in a situation where you could have been " ,
    width*.03, height*.07);
  text("arrested?", width*.03, height*.12);
  textSize(20);
  fill(175,0,0);
  text("Yeah, happens all the time.", width*.1, height*.2);
  rect(width*.1, height*.22, 100, 30);
  fill(150,50,50);
  text("Yes. It was terrifying.", 
    width*.1, height*.35);
  rect(width*.1, height*.37, 100, 30);
  fill(75,125,125);
  text("No, because I was pretty sure about being able to get away with it.", width*.1, height*.5);
  fill(0,175,175);
  text("No. I've never done anything that could have gotten me arrested.",
    width*.1, height *.65);
}

void Question8() {
  fill(175,25,25);
  textSize(27);
  text("You have one day to live. What do you do?", 
    width*.03, height*.1);
  textSize(20);
  fill(175,0,0);
  text("Indulge yourself in maximum decadence.", width*.1, height*.2);
  fill(100,100,100);
  text("Get out of the house for a final adventure.", 
    width*.1, height*.4);
  rect(width*.1, height*.42, 100, 30);
  fill(0,175,175);
  text("Spend the day quietly with your closest friends and family.",
    width*.1, height *.6);
}

void Question9() {
  fill(200,0,0);
  textSize(27);
  text("Which would you rather pursue: A stable job or living " ,
    width*.03, height*.07);
  text("your dream?", width*.03, height*.12);
  textSize(20);
  fill(175,0,0);
  text("Living my dream. Life is nothing if you can't enjoy it.", width*.1, height*.2);
  fill(150,50,50);
  text("My dream is to get a stable job.", 
    width*.1, height*.35);
  rect(width*.1, height*.37, 100, 30);
  fill(75,125,125);
  text("A stable job, I don't want to be homeless in 20 years.", width*.1, height*.5);
  fill(0,175,175);
  text("Both. My dream happens to be something that gives me a high chance of",
    width*.1, height *.65);
  text("stable employment.", width*.1, height*.7);
}

void intro(){
  fill(0);
  textSize(27);
  text("These are responses by CMU students to questions about",
    width*.078, height*.2);
  text("decision making, collected during Spring Carnival 2014.",
    width*.08, height*.27);
  text("Questions and answers sorted according to risk involved.", 
    width*.08, height*.4);
  fill(0,255,255);
  rect(width*.3, height*.45, 75,50);
  fill(255,0,0);
  rect(width*.6, height*.45, 75,50);
  fill(0);
  text("Low risk", width*.28, height*.59);
  text("High risk", width*.58, height*.59);
  text("Please hover over a question view.", width*.08, height*.7);
}


