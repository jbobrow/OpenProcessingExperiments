
PImage img;	

int r;
int g;
int b;

void setup() {
  size(500,319);

   
}

void mousePressed(){
 if((mouseX>0)&&(mouseX<30)&&(mouseY>289)&&(mouseY<319)){
   r=178;
   g=34;
   b=34;
 }
 
  if((mouseX>33)&&(mouseX<63)&&(mouseY>289)&&(mouseY<319)){
   r=250;
   g=128;
   b=114;
 }
 
   if((mouseX>66)&&(mouseX<96)&&(mouseY>289)&&(mouseY<319)){
   r=255;
   g=140;
   b=0;
 }
 
   if((mouseX>132)&&(mouseX<162)&&(mouseY>289)&&(mouseY<319)){
   r=139;
   g=69;
   b=19;
 }
 
    if((mouseX>99)&&(mouseX<129)&&(mouseY>289)&&(mouseY<319)){
   r=255;
   g=215;
   b=0;
 }
 
   if((mouseX>165)&&(mouseX<195)&&(mouseY>289)&&(mouseY<319)){
   r=107;
   g=142;
   b=35;
 }
 
   if((mouseX>198)&&(mouseX<228)&&(mouseY>289)&&(mouseY<319)){
   r=50;
   g=205;
   b=50;
 }
 
   if((mouseX>231)&&(mouseX<261)&&(mouseY>289)&&(mouseY<319)){
   r=0;
   g=206;
   b=209;
 }
 
   if((mouseX>264)&&(mouseX<294)&&(mouseY>289)&&(mouseY<319)){
   r=100;
   g=150;
   b=250;
 }
 
   if((mouseX>297)&&(mouseX<327)&&(mouseY>289)&&(mouseY<319)){
   r=70;
   g=61;
   b=139;
 }
 
   if((mouseX>330)&&(mouseX<360)&&(mouseY>289)&&(mouseY<319)){
   r=0;
   g=0;
   b=0;
 }
 
   if((mouseX>363)&&(mouseX<393)&&(mouseY>289)&&(mouseY<319)){
   r=255;
   g=255;
   b=255;
 }
}

void draw() {

  
  
  stroke(r, g, b);
  strokeWeight(5);
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  

  
   stroke(178, 34, 34);
   fill(178, 34, 34);
   smooth();
   rect(0, 289, 30, 30); // rectangles created by x, y, width, height
  
  
  smooth();
  stroke(250,128,114);
  fill(250, 128, 114);
  rect(33, 289, 30, 30); // rectangles created by x, y, width, height
 
  
  stroke(255,140,0);
  fill(255, 140, 0);
  smooth();
  rect(66, 289, 30, 30); // rectangles created by x, y, width, height

  
  stroke(255,215,0);
  fill(255, 215, 0);
  smooth();
  rect(99, 289, 30, 30); // rectangles created by x, y, width, height

  stroke(139,69,19);
  fill(139, 69, 19);
  smooth();
  rect(132, 289, 30, 30); // rectangles created by x, y, width, height

  stroke(107,142,35);
  fill(107, 142, 35);
  smooth();
  rect(165, 289, 30, 30); // rectangles created by x, y, width, height

  stroke(50,205,50);
  fill(50, 205, 50);
  smooth();
  rect(198, 289, 30, 30); // rectangles created by x, y, width, height
 
  stroke(0,206,209);
  fill(0, 206, 209);
  smooth();
  rect(231, 289, 30, 30); // rectangles created by x, y, width, height

  stroke(100,150,250);
  fill(100, 150, 250);
  smooth();
  rect(264, 289, 30, 30); // rectangles created by x, y, width, height
  
  stroke(70,61,139);
  fill(70, 61, 139);
  smooth();
  rect(297, 289, 30, 30); // rectangles created by x, y, width, height
  
  stroke(0,0,0);
  fill(0, 0, 0);
  smooth();
  rect(330, 289, 30, 30); // rectangles created by x, y, width, height
  
  stroke(255,255,255);
  fill(255, 255, 255);
  smooth();
  rect(363, 289, 30, 30); // rectangles created by x, y, width, height
 

}


