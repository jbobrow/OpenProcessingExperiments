
int[] hues = new int[100];
int i=0;
void setup(){
  size(400,400);
  for(int i=0;i<100;i++){
   hues[i] = int(random(1,360)); 
  }  
  background(255);
  //frameRate(1);
  colorMode(HSB,360,100,100);
  noStroke();
}

void draw(){
  for(int i = 0;i<10;i++){
    for(int j = 0;j<10;j++){
      fill((hues[i*10+j]),100,100);
      rect(j*40,i*40,40,40);
    }  
  }  
}  

void mouseMoved(){
  int boxX = int(mouseX/40);
  int boxY = int(mouseY/40);
  for(int i = 0;i<4;i++){
    for(int j = 0;j<4;j++){
      fill(360-(hues[constrain((((boxY)*10)+(boxX))+(i*10+j),0,99)]),100,100);
      rect(mouseX+j*40,mouseY+i*40,40,40);
    }  
  }
 
}  

