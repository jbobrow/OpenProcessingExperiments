
//Declarations: 
int bnum = 100; // number for balls 
int[] xpos= new int[bnum]; //xpos for balls
int[] ypos= new int[bnum]; //ypos for balls
int[] sx= new int[bnum]; //xspeed for balls
int[] sy= new int[bnum]; //yspeedfor balls
int radius; //radius!!
int gravity = 2; // Global gravity variable

//Setup

void setup() {
  size(500, 500);
  background (255);
  radius = 20;
  
  //loop setup
for (int i=0; i<bnum; i++) {
  xpos[i] = int(random(0, width)); //assign random xvalue to array
    ypos[i] = int(random(0, width)); //assign random yvalue to array
    sx[i] = int(random(1, 5)); // assagn random speed to x on array
    sy[i] = int(random(1, 5)); // assagned speed to y on array
  }
}


//Draw

void draw() {

  background (255);
  noStroke();
  fill(200, 0, 0); 

  for (int i=0; i<bnum; i++) {

    sy[i] = sy[i] + gravity; // make gravity
    if ((xpos[i] >= width-radius/2) || (xpos[i]  <= radius/2)) {
      sx[i] = sx[i] * -1;
    } //bounce off left and tight walls

    if ((ypos[i] >= height-radius/2) || (xpos[i]  <= radius/2)) {
      sy[i] = sy[i] * -1;
    } //bounce off top and bottom walls

    if (ypos[i]>=height-radius/2&&sy[i]<=0) {
      ypos[i]=height-radius/2;
    } //dont go through floor

    bounce(i);

    ellipse(xpos[i], ypos[i], radius, radius);
  }
}


void bounce(int i) {
  xpos[i] = xpos[i] + sx[i];
  ypos[i] = ypos[i] + sy[i] + gravity;
} // bouncing action


/* 
 void movex (int i) { 
 xpos[i] = xpos[i] + sx[i] ; 
 if (xpos[i]  > width-radius/2); { 
 sx[i] = sx[i] * -1;
 }
 }
 void movey (int i) { 
 ypos[i]  = ypos[i]  + sy[i] ; 
 if (ypos [i] > width-radius/2); { 
 sx[i] = sx[i] * -1;
 }}
 ys = ys + gravity; //initialize y speed
 fill(200, 0, 0); 
 xpos = xpos + xs;
 
 
 
 ypos = ypos + ys;
 if ((ypos >= height-radius/2) || (ypos <= radius/2)) {
 ys = ys * -1;
 }
 
 if (ypos>=height-radius/2&&ys<=0) {
 
 ypos=height-radius/2;
 }
 ellipse(xpos, ypos, radius, radius); //draw a circle
 */



