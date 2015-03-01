
float[] xCoord = new float[100];
float[] yCoord = new float[100];

void setup(){
size(550,550);
for(int i = 0; i < 100; i++){
xCoord[i] = random(width);
yCoord[i] = random(height);


}
}
 
void draw(){
  fill(0,10);
  rect(0,0,width,height);
for(int i = 0; i < 50; i++){
  fill(#36E81C);
  int randNum = int(random(62,85));
  char randomCharacter = char(randNum);
text(randomCharacter,xCoord[i], yCoord[i]);
yCoord[i] += 3;
if(yCoord[i] > height){
  yCoord[i] = 0;
}

}
}
