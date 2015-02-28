
int[] positionsX = new int[100];
int[] positionsY = new int[100];
int i = 0;
 
void setup(){
  size(500, 500);
  stroke(0, 10);
  background(255);
}
 
void draw(){ 
   positionsX = append(positionsX, mouseX);
   positionsY = append(positionsY, mouseY);
   
  for(int j=0; j < positionsX.length; j++){
      int distance = int(dist(positionsX[j], positionsY[j],mouseX, mouseY));
      float r = random(0, 100);
      if(distance < 50 && r < 40)  line(positionsX[j],positionsY[j],mouseX, mouseY);
  }
}

