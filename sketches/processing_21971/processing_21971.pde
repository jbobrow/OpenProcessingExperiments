
 //global vars.
 int myvar = mouseX + 33;
int initX = 457;
int initY = 159;
//float flow = 30; //in the end, this will change with mouse coordinate...

PImage b;

void setup() {

  loop();
   size(900, 600);
   smooth();
   frameRate(17);
 
 
  b = loadImage("kangara.jpg");
  
  
}


void draw()
{
  background(255);
  image(b, 0, 0);
  //grab mouse position
  // average it on total width, then constrain it.
  
  
  //blinking eye
  if(random(1, 30) < 3){
    noStroke();
    fill(142, 92,71);
    ellipse(400, 265, 20, 20);
  }
    
  
  
float flow = constrain( mouseX/22, 7, 70);
   //float flow = (mouseX /7)+3;
  
  
  
  

  
  
  //loop for all the particules.
  for (int p = 0; p < 40; p = p+1) {
   // we pick a color randomly from the 4 color array, we'll use this as base color.
   float x1 = initX;
   float y1 = initY;

   float xVel = flow * random(1, 2);
   float yVel = flow * random(1, 3); // + rnd seed?
   
   //stroke
   strokeWeight(random(1, 6));
   //color
   float r1 = constrain(random(100, 200), 0, 200);
    float r2 = constrain(random(0, 100), 0, 150);
     float r3 = constrain(random(0, 200), 0, 200);
  stroke(r1, r2, r3);
   
    //we loop all line segment.
    for (int i = 0; i < 40; i++) {
      float y2 = y1 +yVel*random(0.9, 1.1);
       float x2 = x1 +xVel *random(0.9, 1.1);
       
       
  
      line(x1, y1, x2, y2);
      x1 = x2;
      y1 = y2;
      constrain(random(0, 255), 10, 150);
      xVel = constrain(xVel/1.3, 1, 40);
      yVel =  constrain(yVel/1.1, 0, 40);
     }
     
   }}
  
  
  //constrain(value, min, max)
  /*
  
  line(20, mouseY, 80, mouseY);
  
  line(30, 20, 85, 20);
  stroke(126);
  line(85, 20, 85, 75);
  stroke(255);
  line(85, 75, 30, 75);
  */
  














