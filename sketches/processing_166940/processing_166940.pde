
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] speed = new float[100];

void setup() {
  size(1000, 700);
  for (int i =0; i <100; i++) {
    xCoord[i] = random(width);
    yCoord[i]= random(height);
    speed[i] = random (3, 8);
  }
}
void draw() {
  
  fill(0,10);
  rect(0,0,width,height);
 
    stroke(255);
  for (int i = 0; i < 100; i ++){ 
      strokeWeight(1);
    yCoord[i] += speed[i];
  fill(10,255,10);
  int randNum = int(random(1200,1250));
  char randomCharacter = char(randNum);
  text(randomCharacter,xCoord[i],yCoord[i]);
  if(yCoord[i] > height) yCoord[i]=0;
  if(mousePressed){
    yCoord[i]=height/2;
    xCoord[i]=int(random(0,width));
  }
    }
   
  }
