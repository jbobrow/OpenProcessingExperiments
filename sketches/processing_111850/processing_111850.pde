
float x,y;
float angle = 250;
float r = 600;
float g = 1;


void setup(){
  size(600,600);
  background(255);
  
}

void draw() {
  
smooth();

float red = random(0,255);
float green = random(0,255);
float blue = random(0,255);


color c = color(red,green,blue);


fill(c);
  
  
  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.1); 
  stroke(0); 


  translate(width/2, height/2); 
 
  rotate(r); 
  

  noFill();
  strokeWeight(1);
  stroke(c,80);
  
  ellipse(x/2,y/2,150,150);
  ellipse(x/3,y/3,100,100);

  ellipse(x/4,y/4,100,100);
  ellipse(x/5,y/5,100,100);
  ellipse(x/6,y/6,100,100);
  
  fill(c);
  ellipse(x/7,y/7,100,100);

  
  ellipse(0,0,50,50);
  
  rect(x/2,y/2,5,5);

  line(x,y, -x, -y); 


  angle = angle + 400;
  r = r - g;

  if ( r == 0 || r == 300) { 
    g =  g * -100;
  }
  
  

}
