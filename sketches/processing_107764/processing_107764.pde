
/**
Random Coloured Square Painting (STUDY)
28/08/2013
 */
 
float x, y;
//int scale = 2;
//float dim = 15 * scale;
float dim = 35;

void setup() {
  frameRate(300);
  //size((210*scale),(297*scale));
  size(600,600);
  noStroke();
  //noSmooth();
  //background(0,0,255);
  //fill(255);
  background(random(0,255),random(0,255),random(0,255));
  fill(random(0,255),random(0,255),random(0,255));
  //x = random(0, width);
  //y = random(0, height);
  x = 0-dim;
  //y = 0;
}

void draw() {
  //x = x + (0.285*scale);
  x = x + 1.2;
  y = random(0-dim,height+dim);

  //if(x < width - dim && y < height - dim){
  //fill(255);
  //point(x,y);
  
  //float w = random(1,width);
  //float h = random(1,height);
  rect(x,y,dim,dim);
 // }
 if(x > width){
   //saveFrame("whiteSquaresOnBlue#9.tif");
 }
 if(mousePressed){
     //background(0,0,255);
     background(random(0,255),random(0,255),random(0,255));
       fill(random(0,255),random(0,255),random(0,255));
       x = 0-dim;
         y = random(0-dim,height+dim);
 }
}


