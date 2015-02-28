
//global variables
boolean clicked = false;

void setup() {
  size(400,600);
  smooth();
}

void draw(){
  //get mouse position
  float x = mouseX;
  float y = mouseY;
  
  //adjusted colour values (0 <= colour <= 255)
  float colourX = x/400*255;
  float colourY = y/600*255;
  float colourZ = x*y/400/600*255;
  
  //mouse determined background colour
  background(colourX,colourY,colourZ);
  
  //background extras
  strokeWeight(2.5);
  stroke(0);
  line(220,140,230,80);
  line(220,140,300,60);
  line(220,140,300,120);
  noStroke();
  if (clicked) {
    fill(0);
  }else {
    fill(255);
  }
  arc(300,60,7,7,0,6.28);
  stroke(0);
  strokeWeight(2.5);
  line(160,360,80,320);
  line(160,360,120,380);
  if (clicked) {
    fill(0);
  }else {
    fill(255);
  }
  noStroke();
  arc(80,320,7,7,0,6.28);
  
  //body
  strokeWeight(10);
  stroke(65);
  line(190,185,190,230); //left neckline
  line(210,185,210,250); //right neckline
  if (!clicked) {
    fill(255);
  }else {
    fill(0);
  }
  noStroke();
  arc(x,y,0.35*x,0.466*y,0,7); //head (initial values 200,150,70,70,0,6.28)
  if (clicked) {
    fill(0);
  }else {
    fill(255);
  }
  rect(150,230,57.5,100); //body top left white rectangle
  fill(193);
  if (clicked) {
    fill(0);
  }else {
    fill(65);
  }
  rect(207.5,250,30,30); //body top right dark grey square
  if (clicked) {
    fill(255);
  }else {
    fill(0);
  }
  rect(190.5,280,47,50); //black square right
  rect(150,330,87.5,20); //thin rectangle black
  if (clicked) {
    fill(0);
  }else {
    fill(255);
  }
  rect(150,350,87.5,35); //white thick rectangle
  if (clicked) {
    fill(193);
  }else {
    fill(65);
  }
  arc(193.75,385,87.5,87.5,0,3.14); //semi circle bottom
  
  //extras
  arc(210,130,20,20,0,6.28); //big eye
  for (int i=0; i<3; i++) {
    arc(225-7.5*i,145+7.5*i,5,5,0,7); //little circles in head
  }
  
  for (int i=0; i<4; i++) {
    arc(160,240+10*i,5,5,0,6.28); //first line little circles body
  }
  for (int i=0; i<6; i++) {
    arc(170,260+10*i,5,5,0,6.28); //second line little circles body
  }
  
  if (clicked) {
    fill(255);
  }else {
    fill(0);
  }
  rect(155,355,40,10); //long black rectangle
  for (int i=0; i<5; i++) {
    rect(155+15*i,370,10,10); //small black squares in body
  }
  
}

void mousePressed() {
  clicked = true;
}

void mouseReleased() {
  clicked = false;
}

