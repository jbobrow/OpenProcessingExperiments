
void setup() {
  size(580, 580); //W2_03_03 Frame Size set to 580*580
  rectMode(CENTER); //W2_03_03 Mode changed from CORNER to CENTER
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw(){
  background(180);
  fill(200, 50, 50);
   
     
  float cellsize = 100;
  int gap = 10;
  int num = 25;
  
 
  for(int i = 0; i < sqrt(num); i++){
    for(int j = 0; j < sqrt(num); j++){
      int offsetX = (int) random(3, 12);
      int offsetY = (int) random(3, 12);
      if(num%getOdd(num)==0){
        fill((int)random(250), random(250), random(250));
        //W2_03_03 Fill Changed to completely randomize colours
       rect((cellsize + cellsize*i)-getOdd(offsetX), (cellsize + cellsize*j)+getOdd(offsetY), cellsize-gap, cellsize-gap);
      }else{
         fill((int)random(180), random(150), 50);
         //W2_03_03 In RGB Values for R and G have been randomized, B has been set tos constant
        rect((cellsize + cellsize*i)+getOdd(offsetX), (cellsize + cellsize*j)-getOdd(offsetY), cellsize-gap, cellsize-gap);
      } 
    }
  }
   //W2_03_04 Saving the frame as a jpeg image Key "S"
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }
}
 
int getOdd(int num){
 return (int)random(1, num);
}

