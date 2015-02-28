
PImage a;  // Declare variable "a" of type PImage

float theta = 80;


int varInt = 0;
float varFloat = 1;

long timer ;
long interval = 50;

void setup() {

   size(800, 800);

   a = loadImage("rotate.png");  // Load the image into the program

     timer = millis() + interval;//put timer in the future
background (0);
}

void draw() {

 if (timer < millis() ){
 varInt = varInt + 1;
timer = millis() + interval;//put timer in the future
theta += 100;
 }
 //image(a, 0, 0);

 pushMatrix();

 rotate( radians ( 75 ) );// 360 = 2 * PI

 //image(a, 0, 0);

 popMatrix();

 pushMatrix();

 translate(width/2, height/2);
rotate(radians(theta));
translate(-a.width/2, -a.height/2);
image(a, 0, 0);
popMatrix();//sort of boundaries for a rotation translation
}

