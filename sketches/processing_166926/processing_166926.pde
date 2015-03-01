
float[] xpos = new float[50];
float[] ypos = new float[50];
void setup(){
  size(600,600);
  for(int i = 0; i < 50; i++){
    xpos[i] = random(width);
    ypos[i] = random(height);
  }
}

void draw(){
  fill(0,5);
  rect(0,0,width,height);
  
  for(int i = 0; i < 50; i ++){
    fill(10,255,30);
    int randNum = int(random(62,85));
    char randomCharacter = char(randNum);
    text(randomCharacter, xpos[i], ypos[i]);
    ypos[i] += 1.5;
    if(ypos[i] > height) ypos[i] = 0;
  }
}
