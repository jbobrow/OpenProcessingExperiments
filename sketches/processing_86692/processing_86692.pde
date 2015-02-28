
float t = 0.1;
float globalSaturation = 0.;
float hue = random(360);

void setup() {
  size(600, 600);
 frameRate(15);
  colorMode(HSB, 360, 100, 100); // set RANGES for hue, saturation, brightness
 
  smooth();

  
}

void draw()
{
   translate(width/2, height/2); //translate 100 horizontally, 100 veritcally
   background(255);
   stroke(255);        // white stroke
  
  for (int x = 500; x > 0; x = x-10) { //integer setting: x=180, x is greater than 0, x is equal to x minus 10
    rectMode(CENTER);
    rect(0, 0, x, x);            //x-coordinate of upper-left corner set to 0, y-cooridinate set to 0, width and height are equal to x
    //fill(100 - x, 34 + x, x, 50);          // fill colour : R= 100- x value, G= 34, B=x value, opacity= 50

    globalSaturation += t;
  float sat = globalSaturation;
    for ( int i = 50; i < 300; i++ )
    { 
      fill(color((hue) % 360, 100, 100));
      hue += t;
    }

    rotate( PI/6 );             // angle of rotation set to pie divided by 6
  }
  
}


