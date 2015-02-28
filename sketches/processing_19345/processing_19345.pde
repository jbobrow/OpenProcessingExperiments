
PImage sleep;
PImage blank;
PImage glow;

float x;
float y;
float xx;
float yy;
float targetX, targetY, targetXX, targetYY;
float easing = 0.1;

float xLight;
float yLight;

float xShake = 0;
float yShake = 0;

void setup () {
  smooth ();
  size (640, 480); 
  noStroke ();  

  sleep =loadImage ("panda_sleep.jpg");
  blank = loadImage ("panda_blank.jpg");
  glow = loadImage ("glow.png");

}


void draw () {
//SCARED
if(mousePressed){
xShake = random(0, 4);
yShake = random(0, 4);  

  noTint ();
  image (blank, xShake, yShake, width, height);
   
   
//WHITES (L-R)
  fill (255);
  ellipse (188 + xShake, 200 + yShake, 114 + xShake, 99 + yShake);
  fill (255);
  ellipse (446 + xShake, 200 +yShake, 114 + xShake, 99 +yShake);


//MOVE W/ MOUSE (L)
float x = map (mouseX, 0, width, 188, 202);
float y = map (mouseY, 0, height, 192, 206);

   fill (#4D88A6);
   ellipse (x + xShake, y + yShake, 86, 81);
   
   
//MOVE W/ MOUSE (R)
float xx = map (mouseX, 0, width, 448, 462);
float yy = map (mouseY, 0, height, 192, 206);

   fill (#4D88A6);
   ellipse (xx + xShake, yy +yShake, 86, 81); 
  
  
} else {
//SLEEPING
  tint (100, 100);
  image (sleep, 0, 0, width, height); 
  
//FLASHLIGHT  
  noTint ();
  tint (255, 200);
    float xLight = map (mouseX, 0, width, 0, width);
    float yLight= map (mouseY, 0, height, 0, height);
    fill (255, 80);
    ellipse (mouseX, mouseY, 300, 300);

  }
}


