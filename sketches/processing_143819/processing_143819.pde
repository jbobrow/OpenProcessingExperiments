
int numMolecules = 1;
float[][] position = new float[numMolecules][2];
float[][] nextPosition = new float[numMolecules][2];
int particleSize = 5;
float stepSize = 5;
int itCounter = 0;

void setup(){
  size(500,500);
  background(255,255,255);
  for(int n=0;n<numMolecules;n++){
     // Start from random position
     position[n][0]=random(width);
     position[n][1]=random(height);  
     
     // Start from a point source
     position[n][0]=width/2;
     position[n][1]=height/2;  
     
     
  }
  smooth();
}

void draw(){
  itCounter++;
  //println(itCounter);
  //background(255,255,255);
  for(int n=0;n<numMolecules;n++){
    //noStroke();
    //fill(0,0,0,20);
    //ellipse(position[n][0],position[n][1],particleSize,particleSize);
    nextPosition[n][0]=position[n][0]+random(2*stepSize)-1*stepSize;
    nextPosition[n][1]=position[n][1]+random(2*stepSize)-1*stepSize; 
    
    // Trace the particle trajectory
    strokeWeight(2);
    stroke(0,0,0,50);
    line(position[n][0],position[n][1],nextPosition[n][0],nextPosition[n][1]);
    position[n][0]=nextPosition[n][0];
    position[n][1]=nextPosition[n][1];
  }
  
  
  
}

void keyPressed() {
  if (key == 's') {
    save("numMolecules_"+ numMolecules+"stepSize_" + stepSize +"itCounter" + itCounter +"_.png");
  }
  if (key =='r') {
    setup(); 
 }
}




