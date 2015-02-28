
//author:robertlun,ncku arch
//purpose: practice on class
//concept: bounce ball
//reference:http://www.openprocessing.org/visuals/?visualID=42436
 
float x,y,w,h;
void setup()
{ size(400, 600);
  stroke(0);

 smooth();
  //frameRate(24);
  x=random(width);
  y=random(height);
  w=random(10);
  h=random(10);
 
}

void draw(){
background(0);
if (x>= width || x<0 ) {
    w = -w;
  }
  if ( y>=height||y<0) {
    h = -h;
  }
  x = x+w;
  y = y+h;
  

  
  
 fill(random(255),random(255),random(255));
  ellipse(x, y, random(80), random(80));


}

