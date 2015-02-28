
//float xnoise = 0.0;
//float ynoise = 0.0;
//float inc;
float r, g, b;
int i,j;
float x,y;

void setup(){
  size(320,640);
  background(255);
}

void draw(){
  noStroke();
  fill(255);
  rect(0,0,320,640);
 
  for (i=0; i<width; i+=8){
    for (j=0; j<height; j+=8){
      r= random(255);
      g= random(255);
      b= random(255);
      strokeWeight(8);
      stroke(r,g,b);
      point(i,j);
      
    }
  }
}


