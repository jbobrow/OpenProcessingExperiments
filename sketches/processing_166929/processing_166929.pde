
float[] xPos = new float[100];
float[] yPos = new float[100];
float[] speed=new float[100];
float[] stroke= new float[100];
void setup() {
  size(400, 400);
 ;
  for (int i = 0; i < 100; i++) {
    xPos[i] = random(width);
    yPos[i] = random(height);
    speed[i]= random(2,3);
  }
}
void draw(){
  //fade the old stuff instead of painting over it=see through background
   fill(0,10);
   rect(0,0, width,height);
  smooth();
 
  for (int i=0;i<80;i++){
     fill(#00CE2E);
     int randNum=int(random(50,90));
     char randomCharacter=char(randNum);
    text(randomCharacter,xPos[i],yPos[i]);
    yPos[i]+=speed[i];
    if(yPos[i]>height) {
      yPos[i]=1;
    }
  }
  }
