

//Setup class.
//This class sets canvas size, background colour and any other special parameters that are needed in the whole program.
//This class also calls the custom classes for our drawing. - straightlines, rectangles and circles.
//NOTE its pretty smart if you mess about with the order it calls the different classes.
//I have left another set of rectcangles and circles commented out, add them in and notice the changes.
//Could possibly add a loop to add multiple layers.
//CHANGE - Added Insanity class. - Funky random lines, just to mix it up a notch.
void setup() {
  size(600, 600);
  smooth();
  background(255);
  colorMode(HSB, width);

  insanity();
  straightlines();
  rectangles();
  circles();
  //rectangles();
  //circles();
}


//Class for our circles. 
//First sets the fill and stroke colours that are local to this class.
//Uses a loop to generate a smooth colour transition
//I used x*4 and y*2 to get the best colour mixing, can change these to change the overall appearance of the circle fill.
//It then draws concentric circles on our canvas using the previously set colours for fill and stroke.
void circles() {
  for (int x=0;x<width;x++) {
    for (int y=0;y<height;y++) {
      stroke(x, y, y, 80);
      fill(x, x*4, y*2, 40);
    }
  } 
  for (int d=0;d<=600;d+=50) {
    ellipse(width/2, height/2, d, d);
  }
}

//Class for our rectangles. 
//First sets the fill and stroke colours that are local to this class.
//Uses a loop to generate a smooth colour transition.
//I used x*2 and y*3 to get the best colour mixing, can change these to change the overall appearance of the circle fill.
//It then draws concentric rectangles on our canvas using the previously set colours for fill and stroke.
void rectangles() {
  for (int x=0;x<(width/2);x++) {
    for (int y=0;y<(height*4);y++) {
      stroke(380, x, y, 255);
      fill(380, x*2, y*3, 80);
    }
  }
  rectMode(CENTER);
  for (int d=0;d<=600;d+=50) {
    rect(width/2, height/2, d, d);
  }
}


//Class for some nice lines for added "tunnel" effect.
//Currently just set as a nice clean grey for maximum enhancement.
//Did mess around with a colour loop here too but grey is the colour of choice!
void straightlines() {

  stroke(255, 200);
  for (int i=0 ;i<=600; i+=50) {
    line(300, 300, i, 0);
    line(300, 300, 0, i);
    line(300, 300, i, 600);
    line(300, 300, 600, i);
  }
}

//Class to draw Beizer lines.
//Brings randomness to the clean cut tunnel effect.
void insanity() {
  float j=0;
  float k=0;
  float l=0;

  for (int x=0;x<=230;x+=55)
  {
    for (int g=0;g<width;g++)
    {

      for (int y=0;y<width;y++) 
      {
      }
    }
    for (int i=1/4; i<100; i+=4.5) 
    {  

      j=(random(width));
      k=(random(height));
      l=(random(width)+100);   

      stroke(230, 95, 74, 300);
      bezier(random(500, 600), k, j, random(460), 6+x, 10+i, j, k);
    }
  }
}


