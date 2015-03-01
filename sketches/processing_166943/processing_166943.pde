
float[] xCoord = new float[70];
float[] yCoord = new float[70];

void setup(){
  size(400,400);
  for(int i= 0; i <70; i++){
    xCoord[i]= random(width);
    yCoord[i]= random(height);
  }}


void draw(){
  fill(0,8);
  rect(0,0,width,height);
  for(int i = 0; i<70; i++){
    fill(10,255,10);
    int randNum = int(random(62,85));
    char randomCharacter = char(randNum);
    text(randomCharacter, xCoord[i], yCoord[i]);
    yCoord[i]+=15;
    xCoord[i]+=random(1,2);
   if(xCoord[i]>width){
     xCoord[i]=0;
   }
  if(yCoord[i]>height){
    yCoord[i] = 0;
  }
}
}
