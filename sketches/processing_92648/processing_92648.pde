
//Rosa Han
//March 11 2013
//200 things: lines and circles



int balls = 300;
float[] X = new float[balls];
float[] Y = new float[balls];
float[] ballsize= new float[balls];



int Click = 0;

void setup() {
  size(500, 500);
  background(100);
}

void draw () {
  
}


void mouseDragged () { //start to draw what I want
   
   smooth();
   noStroke();
   fill(255,255,255,50);
   ellipse(mouseX, mouseY, 20, 20); 
   strokeWeight(.5);
   stroke(255);
   line(mouseX,mouseY,width/2,height/2);
   
  X[Click] = mouseX;
  Y[Click] = mouseY;
  Click += 2;
  
 if (Click >= balls) { 
   Click=0;
   background(190, map(mouseY, 0, height, 0 , 255), map(mouseY, 0, height, 0 , 255));
   ellipse(0,mouseY,100,100);
   ellipse(mouseX,0,100,100);
   ellipse(0,mouseX,100,100);
   ellipse(mouseY,0,100,100);
   ellipse(mouseX,500,100,100);
   ellipse(500,mouseY,100,100);
   ellipse(0,mouseX,100,100);
   ellipse(mouseY,0,100,100);
   ellipse(mouseX,mouseY,20, 20);
   
 }
 
}
