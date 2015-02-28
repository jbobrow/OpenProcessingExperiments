
//HUI Wang Chuen
//53077809
//Assignment 2
//CMS3 Coding for Interactivity

//Reference for coding :
//wk2_exercise_01_1
//http://processing.org/reference/constrain_.html
//http://processing.org/reference/keyCode.html
//week 2 leture notes _ Exercise 1 solution
//week 3 leture notes _ Exercise 1 solution
//week 3 leture notes _ Exercise 2 solution



float colorR,colorG,colorB,alpha; // Set color as a float variables, changeable every frame

void setup()
{
  size (600,600); // display size of sketch
  background (255); // color of background
  smooth (); // the smoothness of stroke


}

void draw (){
  

  
colorR = random (255); //
colorG = random (255); // 
colorB = random (255); //
alpha = random (255); // set color value varies from 0 to 254

float[] ax1 = new float [10]; // the amount of X-coordinate appearing on each frame is 10
float[] ay1 = new float [10]; // the amount of Y-coodrinate appearing on each frame is 10,
//it means each frame, 10 rects will appear.

noFill(); //no color field


//

 
for (int x1=0 ; x1<ax1.length ; x1++){ // set x1=0, 10 x1 values only produce and execute
for (int y1=0 ; y1<ay1.length ; y1++){ // set y1=0. 10 y1 values only produce and execute

 ax1[x1] = floor(random (10)); // value from 0 to 10 will only be selected
 ay1[y1] = floor(random (10)); // value from 0 to 10 will only be selected
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 500, 600); //
float my = constrain(mouseY,  0, 600); // set constrain to limit movement and area of producing rect when we moving mouse

 strokeWeight (1); // the thickness of stroke
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 


//

 
for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 400, 500);
float my = constrain(mouseY,  0, 600);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 
//

 
for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 300, 400);
float my = constrain(mouseY,  0, 600);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}

//


for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 200, 300);
float my = constrain(mouseY,  0, 600);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}


//


for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 100, 200);
float my = constrain(mouseY,  0, 600);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 

 
 
//


for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 0, 100);
float my = constrain(mouseY,  0, 600);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 

 
 
//

 for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 0, 600);
float my = constrain(mouseY,  0, 100);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 

 
 
//



 for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 0, 600);
float my = constrain(mouseY,  100, 200);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 

 
 
//

 for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 0, 600);
float my = constrain(mouseY,  200, 300);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 
 
 //


 for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 0, 600);
float my = constrain(mouseY,  300, 400);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 
 
  //


 for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 0, 600);
float my = constrain(mouseY,  400, 500);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 
   //


 for (int x1=0 ; x1<ax1.length ; x1++){
for (int y1=0 ; y1<ay1.length ; y1++){

 ax1[x1] = floor(random (10));
 ay1[y1] = floor(random (10));
 stroke(colorR,colorG,colorB,alpha);
float mx = constrain(mouseX, 0, 600);
float my = constrain(mouseY,  500, 600);

 strokeWeight (1);
 if (key == CODED) 
 {if (keyCode == UP) {stroke(colorR);}
 else if (keyCode == DOWN) {stroke(colorR,colorG,colorB,alpha);}
 else if (keyCode == LEFT) {stroke (255) ; background (255) ; } 
 rect (mx-ax1[x1], my-ay1[y1],5,5); }}}
 
 
}
