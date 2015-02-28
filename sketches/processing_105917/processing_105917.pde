
int numBoxes=200;

int[] boxX=new int[numBoxes];
int[] boxY=new int[numBoxes];
 
/*int[] speedX=new int[numBoxes];
int[] speedY=new int[numBoxes];*/
 
int[] boxSize= new int [numBoxes];
 
int[] boxColors=new int[numBoxes];


void setup(){
  size(1000, 400);

  for(int i = 0; i < numBoxes; i++){
    boxX[i] = int(random(0, width));
    boxY[i] = int(random(0,height));
    boxColors[i] = color(random(0,255), random(0,255), random(0,255));
    boxSize[i] = int(random(5,30));
  }
}
void draw(){
  background(255, 255, 0);

  for(int i = 0; i < numBoxes; i++){
    fill(boxColors[i]);
    rect(boxX[i], boxY[i], boxSize[i], boxSize[i]);
    
  }  
  for(int i = 0; i < numBoxes; i++){
    if(mouseX > boxX[i]){
      if(mouseY > boxY[i]){
        if(mousePressed){
          boxX[i] = mouseX;
          boxY[i] = mouseY;
        }
      }
    }
  }
}

void keyPressed(){
  for(int i = 0; i < numBoxes; i++){
    boxX[i] = int(random(0, width));
    boxY[i] = int(random(0, height));
  }
}

/*void keyPressed(){
  for(int i=0;i<numBoxes;i++){
    boxSize=i;
  }
}

void keyReleased(){
  for(int i=0;i<numBoxes;i++){
    boxSize=i;
  }
}*/


