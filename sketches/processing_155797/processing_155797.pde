
//set rect parameters
float rectw;
float recth;
float rectx;
float recty;

//set difference between mouse position and center
float dix;
float diy;

//transp
int x = 255;

//size step;=
float step;

void setup(){
 size(500,500);
 background(#ffffff);
 step = 100;
 background(random(222));

  
}


void draw(){
  
  
  if (mousePressed == true){step = 50; background(#000000);}
  if (mousePressed == false){step = 100; background(#ffffff);}
  
  
  //set rect size
  rectw = 500;
  recth = 500;
  //define the mouse to the center
  dix = 250 - mouseX;
  diy = 250 - mouseY;
  
  if (dix < 0) {
    dix = -dix; } 
  if (diy < 0) {
    diy = -diy; } 
    

   
 //rect1
  if (mouseX > 250) {
  rectx = mouseX - rectw/2 + dix*1.3;} else {
  rectx = mouseX - rectw/2 - dix*1.3;}
  if (mouseY > 250) {
  recty = mouseY - recth/2 + diy*1.3;} else {
    recty = mouseY - recth/2 - diy*1.3;}
  //rectx = rectx + dix;
  noStroke();
  fill(#cf616e, x);
  rect(rectx, recty, rectw, recth);
  
  //rect2
  rectw = rectw - step;
  recth = recth - step;
  rectx = mouseX - rectw/2;
  recty = mouseY - recth/2;
  if (mouseX > 250) {
  rectx = mouseX - rectw/2 + dix*0.9;} else {
    rectx = mouseX - rectw/2 - dix*0.9;}
  if (mouseY > 250) {
  recty = mouseY - recth/2 + diy*0.9;} else {
    recty = mouseY - recth/2 - diy*0.9;}
  //rectx = rectx + dix;
  noStroke();
  fill(#00ff00, x);
  rect(rectx, recty, rectw, recth);
 
 //rect3
 // fill(#ffffff, 80);
  //rect(0, 0, width, height);
  rectw = rectw - step;
  recth = recth - step;
  rectx = mouseX - rectw/2;
  recty = mouseY - recth/2;
  if (mouseX > 250) {
  rectx = mouseX - rectw/2 + dix*0.6;} else {
    rectx = mouseX - rectw/2 - dix*0.6;}
  if (mouseY > 250) {
  recty = mouseY - recth/2 + diy*0.6;} else {
    recty = mouseY - recth/2 - diy*0.6;}
  noStroke();
  fill(#00ffff, x);
  rect(rectx, recty, rectw, recth);
  
  //rect4
  //fill(#ffffff, 80);
  //rect(0, 0, width, height);
  rectw = rectw - step;
  recth = recth - step;
  rectx = mouseX - rectw/2;
  recty = mouseY - recth/2;
    if (mouseX > 250) {
  rectx = mouseX - rectw/2 + dix*0.3;} else {
    rectx = mouseX - rectw/2 - dix*0.3;}
  if (mouseY > 250) {
  recty = mouseY - recth/2 + diy*0.3;} else {
    recty = mouseY - recth/2 - diy*0.3;}
  noStroke();
  fill(#ffff00, x);
  rect(rectx, recty, rectw, recth);
  
  //rect5
  //fill(#ffffff, 80);
  //rect(0, 0, width, height);
  rectw = rectw - step;
  recth = recth - step;
  rectx = mouseX - rectw/2;
  recty = mouseY - recth/2;
  if (mouseX > 250) {
  rectx = mouseX - rectw/2 + dix*0.1;} else {
  rectx = mouseX - rectw/2 - dix*0.1;}
  if (mouseY > 250) {
  recty = mouseY - recth/2 + diy*0.1;} else {
  recty = mouseY - recth/2 - diy*0.1;}
  noStroke();
  fill(#ff00ff, x);
  rect(rectx, recty, rectw, recth);
  
  
  //rect6
  //fill(#ffffff, 80);
  //rect(0, 0, width, height);
  rectw = rectw - 70;
  recth = recth - 70;
  rectx = mouseX - rectw/2;
  recty = mouseY - recth/2;
  noStroke();
  fill(#330033, x);
  rect(rectx, recty, rectw, recth);
   
  
  
  
}


