
int circles = 10;

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
  
      cloud(100, 100);
       cloud(200, 200);

}


void draw(){
  background(0);
  fill(255,70);
  
  int i = 0;
  
  while( i < circles) {
  
    cloud(xpos[i], ypos[i]);
    
    xpos[i] = xpos[i]+speed[i];
    
    if (xpos [i] > 700){
      
      xpos[i] = 0;
    } 
  i++;
  }
 


  
}

void cloud(float x, float y){
  noStroke();
  int i = 0;
  while(i < 15){
    ellipse(x+random(-20,20),y+random(-10,10),10,10);
    i++;
  }
 
}


