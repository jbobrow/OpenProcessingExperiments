
/**
Random Coloured Square Painting (STUDY)
28/08/2013
 */
 
float x, y;
float dim = 10;

void setup() {
  frameRate(30);
  size(400, 400);
  noStroke();
  background(0,0,255);
  //x = random(0, width);
  //y = random(0, height);
  x = 0-dim;
  //y = 0;
}

void draw() {
  x = x + 0.8;
  y = random(0-dim,height+dim);

  //if(x < width - dim && y < height - dim){
  fill(255);
  //point(x,y);
  
  //float w = random(1,width);
  //float h = random(1,height);
  rect(x,y,dim,dim);
 // }
 if(mousePressed){
     background(0,0,255);
       x = 0-dim;
         y = random(0-dim,height+dim);
 }
}


