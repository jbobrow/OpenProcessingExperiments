

int circles = 40;

float[] xpos = new float[circles];
float[] ypos = new float[circles];
float[] sizy = new float[circles];
float[] speed = new float[circles];



void setup(){
  
  size(700,400);
  background(0);
  smooth();
  
  int i = 0;
  
  while (i < circles){
    
    xpos[i] = 0;
    ypos[i] = random(0,400);
    sizy[i] = 50;
    speed[i] = random (1, 20);
    
    i++;
  }  
}


void draw(){
  
  background(0);
  fill(255,70);
  noStroke();
  
  int i = 0;
  
  while( i < circles) {
  
    ellipse(xpos[i], ypos[i], sizy[i], sizy[i]);
    
    xpos[i] = xpos[i]+speed[i];
    
    if (xpos [i] > 700){
      
      xpos[i] = 0;
    } 
  i++;
}

}

