
 // Final Assignment for the Computational Arts mooc: Dec2014
//Statement
////The skyline of a a modern city - forever moving like the reflections and the traffic. There's also constant movement in nature - but of a 
//different kind - maybe more considered, generally at a slower pace. This piece tries to demonstrate this disparity.

color[] sky = {#092db9,#1d17a0,#1c25a8,#0f43b9};
color[] street = {#fff6d5, #eb8809, #FC3E1C, #e78429, #fdbd63};
color[] moon = {#EDE8EB, #D3D3D3, #F2F0FA};
color[] horizon = {#000000,#0C096C};
color[] buildings1 = {#4d1f3b, #70383b, #0b000e, #682f35, #640B28};
color[] buildings2 = {#4d1f3b, #70383b, #0b000e, #682f35, #AA5109};
color[] buildings3 = {#4d1f3b, #70383b, #0b000e, #682f35, #AA5109};
color[] sea = {#fd9c3b,#fee1c3,#6b3340,#fda440,#ba5c26,#fbc797,#fe8824,#ec7b2f,#092db9,#1d17a0,#1c25a8,#0f43b9,#092db9,#1d17a0,#133DB9,#1A3DA2};

PImage ig1;
float x;
int z = 0;

//Setup
void setup(){
 size(1000, 800);
 background(horizon[1]);
 ig1 = loadImage("1.jpg");
 instructions();
}

void draw(){
  
//The Sky
frameRate(.5);
  {
 float r = random(4);
 noStroke();
 fill(sky[int(r)]);
 float x = random(width);
 float y = random(1,420);
 float d = random(420,650);
 ellipse(x, y, d, d);
 }


//The Buildings 1
{
 float r = random(5);
 noStroke();
 fill(buildings1[int(r)]);
 float x = random(0, 1000);
 float y = random(230,500);
 float d = random(20,45);
 float e = random(100,170);
 rect(x, y, d, e);
 if (z > 0) {
  z += 1;
 }  
// loop();
}

//The Buildings 2
 float counter = 0;
 while(counter < 100) {
 float r = random(4);
 noStroke();
 fill(buildings2[int(r)]);
 float x = random(0, 700);
 float y = random(320,420);
 float d = random(8,45);
 float e = random(50,120);
 rect(x, y, d, e);
 counter ++;
 }

//The Buildings 3
 counter = 0;
 while(counter < 500) {
 float r = random(5);
 noStroke();
 fill(buildings3[int(r)]);
 float x = random(width);
 float y = random(400,450);
 float d = random(10,50);
 float e = random(40,120);
 rect(x, y, d, e);
 counter ++;
 }


//The building Lights
   counter = 0;
 while(counter < 180) {
 float r = random(4);
 noStroke();
 fill(sea[int(r)]);
 float x = random(width);
 float y = random(400,550);
 float d = random(2,8);
 ellipse(x, y, d, d);
 ellipse(x/1.5, y/1.2, d/1.2, d/1.2);
 counter++;
 }

//The Sea
 counter = 0;
 while(counter < 500) {
 float r = random(16);
 noStroke();
 fill(sea[int(r)]);
 float x = random(width);
 float y = random(540,800);
 float d = random(1,5);
 float e = random(10,100);
 rect(x, y, d, e);
 counter ++;
 }


//The Street Lights
 counter = 0;
 while(counter < 800) {
 float r = random(5);
 noStroke();
 fill(street[int(r)]);
 float x = random(width);
 float y = random(532,548);
 float d = random(2,6);
 rect(x, y, d+150, d);
 counter ++;
 }

//The Horizon and the Moon
  noStroke();
  fill(horizon[int(0)]);
  rect(0,550,1000,6);
}

void keyPressed() {
 if (key == 'b' || key == 'B') {
 background(0);
  }
  
 if (key == 'm' || key == 'M') {
  noStroke();
  fill(#EDE8EB);
  ellipse(750, 150, 100, 100);
  //Moons shadow
  fill(#A5B5E3);
  ellipse(750, 700, 98, 98);
 }   

 if (key == 'p' || key == 'P') {
 image(ig1,20,20);
  }
 
}

void mouseClicked(){
//when mouse clicked show image
}

void instructions(){
 //starting instructions
 textSize(40);
 fill(#FFFFFF);
 String inst = "\nPress m or p                                   Press m or p";
 text(inst, 50,50);
}



