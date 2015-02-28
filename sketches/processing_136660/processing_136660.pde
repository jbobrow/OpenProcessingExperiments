
/*Artistic intent: It is currently summer in sunny South Africa. 
My intent was to capture the summer. The background 
represents yellow flower petals. The colourful windmills, 
created when pressing the mouse, represents the festive mood 
and colours of different seasonal flowers.

Instructions:

Pressing the mouse button will create windmills.
Pressing numerical keys 1 to 4 will change the colour shades of the windmills.
Pressing “s” or “S” will save the picture to the “screenshot.png” file in the relevant directory.
Pressing “Delete” or “Backspace” will clear the canvas.

*/

//Global variables

//Color variables

color [] palR={#FF9276,#FFA466,#E8685B,#E8A489,#FFC481};
color [] palY={#FFFE6F,#E8E44A,#FFD51A,#E8E293,#FFE829};
color [] palG={#91FF6A,#86E895,#54FFB6,#64E884,#C5FF6A};
color [] palB={#70E3FF,#5DA8E8,#99B7FF,#AECCE8,#8FC3FF};
color [] palV={#FFA6F4,#E87AD0,#FF74A7,#E8726F,#FF8E8E};

//PImage variable
PImage image;

//Setup block
void setup (){
  
//Canvas size
  size(800,800);
  
//Loading the background image
  image=loadImage("summer.png");
 background(image);
}

//Draw block
void draw() {
//Local variables
//Variable for changing triangles
float t=random(100);

//Variable for determining degrees for rotation
float rec=random(360);

//Variables for determining random palette colors
float c1=0;

//Keyboard options  
//1 = c1 will pick a random number between 0 and 1
//2 = c1 will pick a random number between 0 and 2
//3 = c1 will pick a random number between 0 and 3
//4 = c1 will pick a random number between 0 and 4
  switch (key) {
    case '1': 
c1=random(0,1);
break;

case '2': 
c1=random(0,2);
break;

case '3': 
c1=random(0,3);
break;

case '4': 
c1=random(0,4);
break;

}
 
// If the mouse is pressed the relevat code will execute 
if(mousePressed){ 
  
//Moving the drawn object to start at the cursor
translate(mouseX,mouseY);

//Rotating the drawn objects
rotate(radians(rec));

//Fill the first order triangle
fill(palV[int(c1)]);

//Disabling the first order triangle's stroke
noStroke();

//Drawing the first order triangle
triangle(0,0,1+t,0,4+t,1+t);

//Fill the second order triangle
fill(palB[int(c1)]);

//Disabling the second order triangle's stroke
noStroke();

//Drawing the second order triangle
triangle(0,0,1+t/2,0,4+t/2,1+t/2);

//Fill the second order triangle
fill(palG[int(c1)]);

//Disabling the third order triangle's stroke
noStroke();

//Drawing the third order triangle
triangle(0,0,1+t/3,0,4+t/3,1+t/3);

//Fill the fourth order triangle
fill(palR[int(c1)]);

//Disabling the fourth order triangle's stroke
noStroke();

//Drawing the fourth order triangle
triangle(0,0,1+t/4,0,4+t/4,1+t/4);

//Fill the fifth order triangle
fill(palY[int(c1)]);

//Disabling the fifth order triangle's stroke
noStroke();

//Drawing the fifth order triangle
triangle(0,0,1+t/5,0,4+t/5,1+t/5);

}
}

//On releasing the mouse the drawing of objects will stop
void mouseReleased() {
}

//When pressing "Delete" or "Backspace" the drawing will be cleared
//When pressing "s" or "S" the drawing will be saved as "screenshot.png"
void keyReleased () {
 if(key==DELETE || key==BACKSPACE) background(image);
 if(key=='s' || key=='S') saveFrame ("screenshot.png");
}



