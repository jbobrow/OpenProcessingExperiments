
float rect1x=40;
float rect1y=250;
float rect1size=80;

float rect2x=480;
float rect2y=250;
float rect2size=80;

boolean state1=true;
boolean state2;
boolean state3;
boolean state4;
boolean state5;
boolean state6;
boolean state7;

PImage miley;
PImage bieber;
PImage cara;

void setup () {
  size(600, 600);
  background(246, 143, 247);

  miley=loadImage("miley.png");
  bieber=loadImage("bieber.png");
  cara=loadImage("cara.png");
}

void draw() {
  background(246, 143, 247);

  textSize(50);
  fill(180, 30, 145);
  text("YAY OR NAY", 150, 100);

  textSize(10);
  fill(0);
  fill(255);  
  rect(rect1x, rect1y, rect1size, rect1size);
  fill(0);
  text("YAY", 68, 300);
  fill(255); 
  rect(rect2x, rect2y, rect2size, rect2size);
  fill(0);
  text("NAY", 510, 300);

  if (mouseX > rect1x && mouseX < rect1x + rect1size &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    fill(random(255), random(255), random(255));
  } else {
    fill(255);
  }
  rect(rect1x, rect1y, rect1size, rect1size);
  fill(0);
  text("YAY", 68, 300);
  
    if(mouseX > rect2x && mouseY < rect2x + rect2size &&
  mouseY > rect2y && mouseY < rect2y + rect2size){
    fill(random(255),random(255),random(255)); //do something
  }else{
    fill(255);
  }
  rect(rect2x,rect2y,rect2size,rect2size);
   fill(0);
  text("NAY", 510, 300);

//state1
  if (state1==true) {
    image(miley, width/4, height/4);
  }  

//state2
  if (state2==true) {
    background(232, 102, 12);
    textSize(50);
    fill(80, 44, 30);
    text("YAY OR NAY", 150, 100);

    textSize(10);
    fill(0);
    fill(255);  
    rect(rect1x, rect1y, rect1size, rect1size);
    fill(0);
    text("YAY", 68, 300);
    fill(255); 
    rect(rect2x, rect2y, rect2size, rect2size);
    fill(0);
    text("NAY", 510, 300);
    image(bieber, width/4, height/4);
  }
    if (mouseX > rect1x && mouseX < rect1x + rect1size &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    fill(random(255), random(255), random(255));
  } else {
    fill(255);
  }
  rect(rect1x, rect1y, rect1size, rect1size);
  fill(0);
  text("YAY", 68, 300);
  
    if(mouseX > rect2x && mouseY < rect2x + rect2size &&
  mouseY > rect2y && mouseY < rect2y + rect2size){
    fill(random(255),random(255),random(255)); //do something
  }else{
    fill(255);
  }
  rect(rect2x,rect2y,rect2size,rect2size);
   fill(0);
  text("NAY", 510, 300);

//state3
  if (state3==true) {
    background(69, 68, 255);
    textSize(50);
    fill(101, 202, 255);
    text("YAY OR NAY", 150, 100);

    textSize(10);
    fill(0);
    fill(255);  
    rect(rect1x, rect1y, rect1size, rect1size);
    fill(0);
    text("YAY", 68, 300);
    fill(255); 
    rect(rect2x, rect2y, rect2size, rect2size);
    fill(0);
    text("NAY", 510, 300);
    image(cara, width/4, height/4);
  }
    if (mouseX > rect1x && mouseX < rect1x + rect1size &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    fill(random(255), random(255), random(255));
  } else {
    fill(255);
  }
  rect(rect1x, rect1y, rect1size, rect1size);
  fill(0);
  text("YAY", 68, 300);
  
    if(mouseX > rect2x && mouseY < rect2x + rect2size &&
  mouseY > rect2y && mouseY < rect2y + rect2size){
    fill(random(255),random(255),random(255)); //do something
  }else{
    fill(255);
  }
  rect(rect2x,rect2y,rect2size,rect2size);
   fill(0);
  text("NAY", 510, 300);
  
  //state4
  if (state4==true) {
    fill(255); 
    ellipse(width/2, height/2, 300, 300);
    fill(0); 
    text("q3a", 300, 300);
  }

  if (state5==true) {
    fill(255); 
    ellipse(width/2, height/2, 300, 300);
    fill(0); 
    text("q3b", 300, 300);
  }
  
  if (state6==true) {
    fill(255); 
    ellipse(width/2, height/2, 300, 300);
    fill(0); 
    text("q4a", 300, 300);
  }

  if (state7==true) {
    fill(255); 
    ellipse(width/2, height/2, 300, 300);
    fill(0); 
    text("q4b", 300, 300);
  }
}


void mousePressed() {

  //if i click on the left button, make state 2 equal to true
  //and make state1 and state3 false
  if ( mouseX > rect1x && mouseX < rect1x + rect1size &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    state1 =false;
    state2 =true;
    state3=false;
  } else if ( mouseX > rect2x && mouseX < rect2x + rect2size &&
    mouseY > rect2y && mouseY < rect2y + rect2size) {
    state1=false;
    state2=false;
    state3=true;
  }

  if ( mouseX > rect1x && mouseX < rect1x + rect1size &&
    mouseY > rect1y && mouseY < rect1y + rect1size) {
    state1 =false;
    state2 =true;
    state3=false;
  } else if ( mouseX > rect2x && mouseX < rect2x + rect2size &&
    mouseY > rect2y && mouseY < rect2y + rect2size) {
    state1=false;
    state2=false;
    state3=true;
  }
}



