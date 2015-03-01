
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
void setup(){
 size(720,500);
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
}

void draw(){
  image(img1, 0, 0);
  
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




