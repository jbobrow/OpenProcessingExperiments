
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  fill(0,102);
  smooth();
  noStroke();

}


void draw() {  //draw function loops 
 background(0,0,255);
 
 fill(255,255,0);
 ellipse(200,200,200,200);
 
fill(255,255,255);
ellipse(160,150,40,40);

 fill(0,0,0);
 ellipse(160,150,20,20);
 
fill(255,255,255);
ellipse(230,150,40,40);
 
 fill(0,0,0);
 ellipse(230,150,20,20);
 
line(40,65,60,65);

 
}

