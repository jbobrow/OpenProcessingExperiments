
// Kurt Ralske
// January 2013


String[] data;
float counter = 0.;
float t = 0.3;
int circleRadius = 200;
void setup() {
  size(500, 700);
  smooth();
  frameRate(15);


  // Load text file as an array of Strings
  data = loadStrings("data.txt");  
  // Create the font
}

void draw() 
{
  translate(width/2, height/2); 
  //color


  background(0);     
  // Each line is split into an array of floating point numbers.
  float[] values_old = float(split(data[(int) counter], "," ));
  float[] values_new = float(split(data[(int) counter + 1], "," )); 

  // interpolate (slide) between old and new values
  float xx = lerp(values_old[0], values_new[0], counter % 1.0);
  float yy = lerp(values_old[1], values_new[1], counter % 1.0);
  float zz = lerp(values_old[2], values_new[2], counter % 1.0);



  //ellipse(xx, yy, zz, zz);
  float colorx = random(0, 500);
  float colory = random(0, 500);
  fill( noise( colorx/100.0, colory/100.0 ) * 255, 0, 255 - noise( colorx / 200.0, colory/200.0) * 255 );



  counter += t;
  if (counter >= (data.length - 2) ) counter = 0;

  float numWords = 60;
  float wordDegree = 360 / numWords; 

  for (int i = 0; i < numWords; i++)
  {
    pushMatrix();
    float x = cos(radians(i * wordDegree)) * circleRadius;
    float y = sin(radians(i * wordDegree)) * circleRadius;
    translate(x, y);
    rotate(radians(xx * wordDegree));
    textSize(zz/2); 
    text("Hello World!Hello World!", 0, 0);


    popMatrix();
  }
}



