
//mid term proejct: death and decay of the spider

PShape spider;
PShape spiderDecay2;

//movement variables
float startX = 400; //initial x coordinate
float stopX = 180; // final x coordinate
float startY = 150; //initial y coordinate
float stopY = 400; // final y coordinate
float distX;//x-axis distance to move
float distY; // y-axis distance to move
float exponent = 4; //determines the curve
float x = startX; // current x 
float y = startY; // current y
float step = 0.005; // size of each step - speed
float pct = 0.0; // percentage travelled


void setup(){
  size (600, 600);
  smooth();
  shapeMode(CENTER);
  spider = loadShape("spider.svg");
  spiderDecay2 = loadShape("spiderDecay2.svg");
  distX = stopX - startX;
  distY = stopY - startY;
}


void draw(){
  stroke(180);
  background(20);
  web();
  //spidersFollow();
  spiderDecayFollowMouse();
  spider();
 
  }
  
void web(){
  for(int f = 150; f < 450; f +=6){ // fan lines 
    line(f, 0, f + f/1.5, height);
  }
  for(int i = 100; i < 500 ; i+=7){ // web horizontal lines
   line(i, 100, i, 500);
   }
  for(int i = 100; i < 500; i+=5){ //web vertical lines
   line(100, i, 500, i);
   }
  fill(0,150);
  noStroke();
  ellipse(300, 200, 30, 30);
  ellipse(200, 300, 50, 80);
  ellipse(420, 320, 50, 30);
  ellipse(490, 120, 60, 80);
  stroke(255);
  strokeWeight(1);
}
 
 /*void spidersFollow(){
  float mx = map(mouseX, 300, width, 60, 180);
  float my = map(300, mouseY, height, 100, 100);
   shape(spider, mx, mouseY, 150, 150); //healthy spider
  shape(spiderDecay2, mouseX, my, 200, 200);
}
  */
void spider(){
  shape(spider, 400, 120, 150, 150);
}
  
void spiderDecayFollowMouse(){
  pct += step;
  if(pct < 1.0){
  x = startX + (pct * distX);
  y = startY + (pow(pct, exponent) *distY);
  }
  shape(spiderDecay2, x, y, 200, 200);
  
}
 
void mousePressed() {
   pct = 0.0;
   startX = x;
   startY = y;
   stopX = mouseX;
   stopY = mouseY;
   distX = stopX - startX;
   distY = stopY - startY;
 } 
  


