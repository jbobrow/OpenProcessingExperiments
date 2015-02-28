
int[] positionX;
int[] positionY;
float[] squareSize;

void setup(){
size(500,500);
positionY = new int[5];
for (int i=0; i<positionY.length;i++) {
    positionY[i]= i*100+20;
  }
  
positionX = new int[5];
for (int i=0; i<positionX.length;i++) {
    positionX[i]= i*100+20;
  }

squareSize = new float[5];
for (int i=0; i<squareSize.length;i++) {
    squareSize[i]= 50;
  }
}

void draw(){
  background(100);
  fill(255);
  for(int i=0; i < 5; i++){
    
           
    if (mousePressed && mouseY >positionY[i] &&
        mouseY < positionY[i]+squareSize[i] && 
        mouseX >positionX[i] && 
        mouseX<positionX[i]+squareSize[i]){
        squareSize[i]= squareSize[i]*1.01;
            float rd= random(255);
            float bl= random(255);
            float gr= random(255);
            fill(rd,bl,gr);    }  
       rect(positionX[i],positionY[i],
    squareSize[i],squareSize[i]);   
    fill(255);
  }

}

