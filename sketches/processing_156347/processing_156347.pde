
PFont font;
PImage robot;
PImage human;
PImage pbj;
PImage grilledcheese;
PImage bothSandwiches;

float humanX;
float humanY;
float robotX;
float robotY;
float diam = 150;

float rImageW = 700;
float rImageH = 300;

float hImageW = 160;
float hImageH = 200;

float fYeahX;
float fYeahY;
float mehX;
float mehY;

float rightieX;
float rightieY;
float leftieX;
float leftieY;
float bothX;
float bothY;

float gImageW = 330;
float gImageH = 300;

float pImageW = 330;
float pImageH = 300;

float bImageW = 720;
float bImageH = 300;

//on/off states row 1
boolean state1 = false; //i am a human
boolean state2 = false; //i am a robot

//on/off states row 2
boolean state3 = false; //sad robot return to start
boolean state4 = false; //fuck yeah i like sandwiches
boolean state5 = false; //meh

//on/off states row 3
boolean state6 = false; //leftie
boolean state7 = false; //rightie
boolean state8 = false; //ambidextrous

void setup(){
  background(241, 245, 242); //white background
  size(1000, 800);
  noStroke();
  fill(0);
  font = loadFont("AbadiMT-CondensedExtraBold-48.vlw");
  textFont(font, 48);
 humanX = width/4; //human button position
 humanY = 150;
 robotX = 3*width/4; //robot button position
 robotY = 150;
 
 fYeahX = width/4; //fuck yeah button position
 fYeahY = 400;
 mehX = 3*width/4;  //meh button position 
 mehY = 400;
 
 leftieX = width/4;
 leftieY = 650;
 rightieX = width/2;
 rightieY = 650;
 bothX =  3*width/4;
 bothY = 650;
  
}

void draw(){
  //textSize(48);
  fill(13, 15, 14); //black question
  
  text("ARE YOU A...", (width/2-120), 50);
  noStroke();
  fill(244, 131, 108); //coral button
  noStroke();
  ellipse(humanX, humanY, diam, diam); //human button
  
  fill(241, 245, 242);
  text("HUMAN", (humanX-65), 162); //human button text
  
  fill(244, 131, 108); //coral button
  noStroke();
  ellipse(robotX, robotY, diam, diam); //robot button
  
  fill(241, 245, 242);
  noStroke();
  text("ROBOT", (3*width/4-65), 162); //robot button text
  
  //if human button pressed:
  if(state1==true){ 
    fill(240, 81, 81); //red button
    noStroke();
    ellipse(humanX, humanY, diam, diam); //human button red if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("HUMAN", (humanX-65), 160); //human text white and still there if pressed
    
    fill(13, 15, 14); //black question
    noStroke();
    text("DO YOU LIKE SANDWICHES, HUMAN?", width/6, 300); //question 2 appears if pressed
    
    fill(72, 91, 89); //grey button
    noStroke();
    ellipse(fYeahX, fYeahY, diam, diam); //fuck yeah button appears if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("FUCK", fYeahX-60, fYeahY); //fuck yeah text appears if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("YEAH!!", fYeahX-63, fYeahY+40); //fuck yeah text appears if pressed
    
    fill(72, 91, 89); //grey button
    noStroke();
    ellipse(mehX, mehY, diam, diam); //meh button appears if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("MEH...", mehX-60, mehY+20); //meh button text appears if pressed
  }
  
 
 //OR if robot button pressed: 
  if(state2==true){
    fill(240, 81, 81);
    noStroke();
    ellipse(robotX, robotY, diam, diam);//robot button red if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("ROBOT", (3*width/4-65), 160); //robot text white and still there if pressed
    
    fill(13, 15, 14);
    noStroke();
    text("SORRY, ROBOTS DON'T EAT SANDWICHES.", width/4-100, 300); //sad robot text if pressed
    
    robot = loadImage("robot.png");
    image(robot, width/6, height/3+100, rImageW, rImageH);
  }
    /*fill(244, 131, 108);
    text("CLICK ROBOT TO TURN INTO A HUMAN", width/4-75, 750);
    /*
    


  /*
  if(state3==true){ //trying to figure out return to start
   background(241, 245, 242);
   
   fill(13, 15, 14); //black question
  text("ARE YOU A...", (width/2-120), 50);
  
  fill(244, 131, 108); //coral button
  noStroke();
  ellipse(humanX, humanY, diam, diam); //human button
  
  fill(241, 245, 242);
  text("HUMAN", (humanX-65), 162); //human button text
  
  fill(244, 131, 108); //coral button
  noStroke();
  ellipse(robotX, robotY, diam, diam); //robot button
  
  fill(241, 245, 242);
  text("ROBOT", (3*width/4-65), 162); //robot button text
  }
  */
  
  //HUMAN QUESTIONS ROUND 2: if fuck yeah button pressed:
  if(state4==true){
    
    fill(240, 81, 81);
    noStroke();
    ellipse(fYeahX, fYeahY, diam, diam); //fuck yeah button red if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("FUCK", fYeahX-60, fYeahY); //fuck yeah text still there if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("YEAH!!", fYeahX-63, fYeahY+40); //fuck yeah text still there if pressed
    
    fill(13, 15, 14);
    noStroke();
    text("ARE YOU A RIGHTIE OR A LEFTIE?", width/6, 550); //rightie leftie question appears if pressed
    
    fill(244, 131, 108);
    noStroke();
    ellipse(rightieX, rightieY, diam, diam); //rightie button appears if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("RIGHTIE", rightieX-70, rightieY+20); //rightie text appears if pressed
    
    fill(244, 131, 108);
    noStroke();
    ellipse(leftieX, leftieY, diam, diam); //leftie button appears if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("LEFTIE", leftieX-60, leftieY+20);
    
    fill(244, 131, 108);
    noStroke();
    ellipse(bothX, bothY, diam, diam); //both circle appears if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("BOTH", bothX-60, bothY+20);
    
  }
  
  if(state5==true){
    fill(240, 81, 81); //meh button turns red if pressed
    noStroke();
    ellipse(mehX, mehY, diam, diam); //meh button still there if pressed
    
    fill(241, 245, 242);
    noStroke();
    text("MEH...", mehX-60, mehY+20); //meh button text still there if pressed
    
    fill(13, 15, 14);
    noStroke();
    text("UM...WHAT'S WRONG WITH YOU, DUDE?", width/4-100, 550); //sad robot text if pressed
    
    human = loadImage("human.png");
    image(human, (width/2-(hImageW/2)), height/2+160, hImageW, hImageH);
    
  }
  
  if(state6==true){
    background(72, 91, 89); //re-load background to clear page
    
    grilledcheese = loadImage("grilled_cheese.png");
    image(grilledcheese, width/2-150, height/2-150, gImageW, gImageH);
    
    fill(240, 81, 81);
    noStroke();
    text("OM NOM NOM!", 100, 150);
    
  }
  
  if(state7==true){
    background(72, 91, 89);
    
    pbj = loadImage("pbj.png");
    image(pbj, width/2-150, height/2-150, pImageW, pImageH);
    
    fill(240, 81, 81);
    noStroke();
    text("PEANUT BUTTAH JELLY TIME!", 100, 150);
  }
  
  if(state8==true){
    background(72, 91, 89);
    
    bothSandwiches = loadImage("both.png");
    image(bothSandwiches, 100, height/2-150, bImageW, bImageH);
    
    fill(240, 81, 81);
    noStroke();
    text("EAT ALL THE THINGS!", 100, 150);
  }
}


void mousePressed(){
  
  //answering question 1:
  if(state2==false && dist(mouseX, mouseY, humanX, humanY)<diam/2){
    state1=true;
  }
  
  if(state1==false && state4==false && dist(mouseX, mouseY, robotX, robotY)<diam/2){
    state2=true;
  }
  
  /*
  if(state1==false && state2==false && mouseY>height/2){
  //dist(mouseX, mouseY, rImageW, rImageH)<rImageW/2 && dist(mouseX, mouseY, rImageW, rImageH)<rImageH/2){
    state3=true;
  }
  */
  
  //answering question 2:
  if(state5==false && dist(mouseX, mouseY, fYeahX, fYeahY)<diam/2){
    state4=true;
  }
  if(state4==false && dist(mouseX, mouseY, mehX, mehY)<diam/2){
    state5=true;
  }
  
  //answering question 3:
  if(state7==false && dist(mouseX, mouseY, leftieX, leftieY)<diam/2){
    state6=true;
  }
  if(state6==false && dist(mouseX, mouseY, rightieX, rightieY)<diam/2){
    state7=true;
  }
  if(state6==false && state7==false && dist(mouseX, mouseY, bothX, bothY)<diam/2){
    state8=true;
  }
    
  
  if (keyPressed){
    if (key=='s'){
      saveFrame();
    }
    }
}



