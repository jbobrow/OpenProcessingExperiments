
//orange circles
 
int numBalls = 8;
 
int[] circleX = new int[numBalls];
int[] circleY = new int[numBalls];
 
int rad = 20;
 
void setup(){
  size(500,500);
  smooth();
  
  
  
  for(int i = 0; i < numBalls; i++){
    circleX[i] = int(random(width));
    circleY[i] = int(random(height));
  }
}
 
void draw(){
  background(0,0,255,50);
  noStroke();
  fill(255, 167, 3);
   
  //checking
   
  for(int i=0; i<numBalls; i++){
    if (mouseX > circleX[i] - rad && mouseX< circleX[i] + rad){
      if(mouseY > circleY[i] - rad && mouseY < circleY[i] + rad){
        if(mousePressed){
          circleX[i] = mouseX;
          circleY[i] = mouseY;
        }
        
      }
    }
  }
  //circles
   
  for(int i = 0; i< numBalls; i++){
    ellipse(circleX[i], circleY[i], rad, rad);
    if(mousePressed){
      fill(40, 255,200);
        ellipse(circleX[i], circleY[i], rad, rad);
    }
  }
//for(int i =0; i< numBalls; i++){
  //for int j = 0; j < numBalls; j++){
    //if(dist( circleX[i], circleY[i])<= rad){
    //}
  //}
//}
}
 
void keyPressed(){
  for(int i = 0; i<numBalls; i++){
    circleX[i] = width-(i*2);
    circleY[i] = height-(i*2);}
}



