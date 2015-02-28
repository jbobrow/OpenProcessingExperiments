
PFont font;

float[] xCoords = new float[1000];
float[] yCoords = new float[1000];

char[] chars = new char[1000];

void setup(){
  size (1300,700);
  font = loadFont("CourierNewPSMT-48.vlw");
  for (int i=0;i<1000;i++){
    xCoords[i] = random(width);
    yCoords[i] = random(height);
    char c = 'a';
    c+= random (64);
    chars[i]=c;
  }
}
void draw(){
  noStroke();
  fill(0,20);
  rect(0,0,width,height);
  
  //matrix
  for (int i=0;i<1000;i++){
    fill(0,255,0);
    text(chars[i],xCoords[i],yCoords[i]);
    
    //move chars
    
  yCoords[i]+=2;
  if(yCoords[i]>height)yCoords[i]=0;
  chars[i] +=random(64);
  chars[i] %=64;
  }
}

