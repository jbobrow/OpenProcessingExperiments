
float r;

int x;



void setup(){
size(400,400);
background(255);
smooth();
}


void draw(){
  
  r = random(100, 200);
  x = mouseX;

for(int i=0; i < 100; i++)
{
  float r = random(0, 255);
  stroke(r);

  fill(255, 255, 255, 50);
 


  ellipseMode(CENTER);
  noStroke();
  fill(x,r,r+x);
  ellipse(x, mouseY, r+x, r+x);
}
  

  
 
 
  
  

  
noStroke();
rectMode(CENTER);

for(int i=0; i<=400; i=i+20){ 
for(int j=0; j<=400; j=j+20){
fill(i,j,0);
rect(i,j,10,10);
}
}

}

