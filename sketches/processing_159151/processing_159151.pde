
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;



void setup(){
  size(200,200);
  background(2000);
  smooth(900);
  frameRate(10);
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
          
          x1=random(width);
          y1=random(height);
          x2=random(width);
          y2=random(height);
          x3=random(width);
          y3=random(height);
          x4=random(width);
          y4=random(height);
        
         
         
        
          //use values to draw an ellipse
          //noStroke();
         fill(r,g,b,a); 
         ellipse(x,y,diam,diam); 
         
         fill(r,g,b,a); 
         quad(x1,y1,x2,y2,x3,y3,x4,y4);
         
         fill(r,g,b,a); 
         stroke(r,g,b);
         strokeWeight(5);
         line(59,99,x,y);
         noStroke();
}


