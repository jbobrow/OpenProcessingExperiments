
  //all of these floats are variables i use to set up buttons
float x = 153;
float y = 110;
float w = 55;
float h = 43;
float a = 153;
float b = 220;
float c = 65;
float d = 63;
float n = 149;
float m = 340;
float o = 90;
float p = 65;
float q = 489;
float r = 150;
float s = 130;
float t = 95;
//saying the images i will use
PImage img1, img2, img3, img4, img5;


void setup (){
  
 

  size(720,500);
  
}
void draw() {

if (key == 'e'|| key == 'E'){
  //uses an image saved in data folder
 img1 = loadImage("list.jpg");
 //uses an image saved in data folder
 img2 = loadImage("check1.png");
 //uses an image saved in data folder
 img3 = loadImage("check2.png");
 //uses an image saved in data folder
 img4 = loadImage("check3.png");
 //uses an image saved in data folder
 img5 = loadImage("bunny2.png");
 image(img1, 0, 0);
 //no stroke or fill
 noStroke();
 noFill();
  lists();
}

if (key == 'q'|| key == 'Q'){
  ///memory is actually my reconigtion one but i don't know how to rename
  memory();
}
if (key == 'w'|| key =='W' ){
  short_term();

}


}

void lists(){
  
  
 //uses the floats to create a rectangle
 rect(x,y,w,h);
 noStroke();
 noFill();
 if(mousePressed){
  if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
   println("The mouse is pressed and over the button");
   one();
   //do stuff 
  }
 }
  //uses the floats to create a rectangle
  rect(a,b,c,d);
  noFill();
  noStroke();
  //this commans should happend if the mouse is pressed
 if(mousePressed){
   //if the mouse is pressed in this area set up by floats the action will happen
  if(mouseX>x && mouseX <a+c && mouseY>b && mouseY <b+d){
  //activate the group called two
   two();
  }
 }
  //uses the floats to create a rectangle
 rect(n,m,o,p);
 if(mousePressed){
   //if the mouse is pressed in this area set up by floats the action will happen
  if(mouseX>n && mouseX <n+o && mouseY>m && mouseY <m+p){
   //activate the group called three
   three();
 } 
 }
 //uses the floats to create a rectangle
  rect(q,r,s,t);
 if(mousePressed){
   //if the mouse is pressed in this area set up by floats the action will happen
  if(mouseX>q && mouseX <q+s && mouseY>r && mouseY <r+t){
 //activate the group called four
   four();
 } 
 }

}
 //a group that contains an image
void one(){
  //states what image is being used and where it will be placed
  image(img2, 0, 0);
  }
  //a group that contains an image
void two(){
  //states what image is being used and where it will be placed
  image(img3, 0, 0);
}
//a group that contains an image
void three(){
  //states what image is being used and where it will be placed
  image(img4, 0, 0);
}
//a group that contains an image
void four(){
  //states what image is being used and where it will be placed
  image(img5, 0, 0);
}




//keeps happening
void memory() {
  textSize(24);
  //background color
  background(51);
 
  translate(width/2, height/2);
  fill(#FFEF58);
  stroke(255);
  strokeWeight(2);
  beginShape();
  vertex(0, -50);
  vertex(33, -40);
  vertex(47, -5);
  vertex(29, 40);
  vertex(29, 70);
  vertex(-29, 70);
  vertex(-29, 40);
  vertex(-47, -5);
  vertex(-33, -40);
 
  endShape(CLOSE);
  fill(88);
  beginShape();
  vertex(29, 50);
  vertex(29, 90);
  vertex(-29, 90);
  vertex(-29, 50);
  endShape(CLOSE);
  
  
  endShape(CLOSE);
 noFill();
 stroke(82);
  beginShape();
  vertex(29, -10);
  vertex(12, 50);
  vertex(-12, 50);
  vertex(-29,-10);

  endShape(CLOSE);
  
  fill(#FFF59D);
  translate(0,0);
text("Brightness",-55,143); 

  
}
//happens once

  //keeps happening
void short_term(){
  //keeps redrawing background
  background(#F0EDEB);
//text color
  fill(#0B3352);
  //text size
  textSize(24);
  //writes on canavs
  text("1) Scroll Down",160,125);
  //text on canvas
  text("2) Remember the numbers: 1,4,6,9",160,200);
  //writes on canvas
  text("3) Say your phone number",160,275);
  //writes on canvas
  text("4)How many inches are in a foot?",160,350);
  //writes on canvas
  text("5)What were the orginal numbers?",160,425);
  //controls where rectagles are in relation to mouse
  rect(0, mouseY+100, 800, 500);
  //controls rectangles in relation to mouse
   rect(0, mouseY-15, 800, -500);
   //end
}


