
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup(){
  size(200,200);
  background(20);
  smooth();
}

void draw(){
  //Each time though draw(),new random numbers are picked for a new ellipse.
  r=random(255);
  g=random(255);
    b=random(255);
      a=random(255);
      diam=random(200);
        x=random(width);
          y=random(height);
          
          //use values to draw an ellipse
          noStroke();
          fill(r,g,b,a);
          ellipse(x,y,diam,diam);
}
          


