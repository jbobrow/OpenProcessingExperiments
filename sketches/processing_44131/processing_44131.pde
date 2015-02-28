
int[] positionsX = new int[100];
int[] positionsY = new int[100];
int i = 0;
 
void setup(){
  size(500, 500);
  stroke(250, 100);
  strokeWeight(1);
  background(0);
}
 
void draw(){ 
  int radius1 = int(random(0, 250));
  int radius2 = int(random(radius1*0.9, radius1*1.1));
 
  positionsX = append(positionsX, mouseX);
   positionsY = append(positionsY, mouseY);
  
   
  for(int j=0; j < positionsX.length; j++){
      int distance = int(dist(positionsX[j], positionsY[j],mouseX, mouseY));
      float r = random(0, 100);
      if(distance < 80 && r < 6)  line(positionsX[j],positionsY[j],mouseX, mouseY);
  }
}

