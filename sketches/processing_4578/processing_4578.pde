
//Angular Rectangular  ---  based on orig code from Ira Greenberg
//Jeff Hendrickson  Sept 09

/*  In Ira's original code, a number of colored squares started at left and painted their
way at various angles to the right, leaving behind solid color.

I'm really fascinated with these techniques of painting and have massaged the code into this,
on my way to a mashup of this and the Painting Worms sketch from earlier.

This runs a bit faster than previous versions and stops at 15 seconds

*/

int shapes = 400;
float[]speedX = new float[shapes];
float[]speedY = new float[shapes];
float[]x = new float[shapes];
float[]y = new float[shapes];
float[]w = new float[shapes];
float[]h = new float[shapes];
color[]colors = new color[shapes];

void setup(){
  size(600, 320);
  frameRate(30);
  smooth();
  // fill arrays will random values
   for (int i=0; i<shapes; i++){
     x[i]=random(width);
     y[i]=random(height);  
     w[i]=random(width/6);  //play with these to get many different size effects
     h[i]=random(height/3);
     colors[i]=color(random(200), random(200), random(255), random(10,40));
     speedX[i] = random(-4, 10);  //angle and speed horizontal
     speedY[i] = random(-4, 10);  //positive int makes them all go same way  speed vertical
     
   }
}
/*   if you want to do a screen cap uncomment this block
void mousePressed() {
  save("paintStripes800.tif");
}  */

void draw(){
  for (int i=0; i<shapes; i++){
    fill(colors[i]);
    stroke(random(200), random(240), random(130), random(40,80));  //this is what leaves behind the trail
    rect(x[i], y[i], w[i], h[i]);
    x[i]+=cos(speedX[i]);
    y[i]+=sin(speedY[i]);
  }
  if (millis() >= 15000) {
  noLoop();
}
}



