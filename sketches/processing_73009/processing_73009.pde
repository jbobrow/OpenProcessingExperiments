

int x;
int y;

void setup(){
  size(600,600);

  
  x = 0; 
  y = 100;
}

void draw(){
  background(255);
  smooth();
  noStroke();
  fill(random(25),random(25),random(25));
  if(x>width){
  x = 0;
  }  
  for(int x = 0; x < width; x++)
  for(int y = 0; y < height; y++)  
  rect(x*random(-10.,10.),y*10,10,10);
  x++;
  y++;
  
}


 


