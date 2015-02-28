
//position
int x;
int y;

//diameter
int d;

//colour variables
int r;
int g;
int b;
int a;

void setup(){
  size(500,500);
background(300);

  
}


void draw(){
  fill(r,g,b,a);
  noStroke();
   ellipseMode(CENTER);
 ellipse(mouseX,mouseY,d,d);

  
  x = int(random(500));
  y = int(random(500));
  r = int(random(300));
  g = int(random(300));
  b = int(random(200));
  a = int(random(200));
  d = int(random(60));
  

}

void keyPressed(){
rect(x,y,200,200);

  
}




