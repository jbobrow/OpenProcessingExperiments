
int abstand = 10;
int abstand2 = 5; 
void setup(){
  size(300, 300);
  smooth();
}
 
void draw(){
  background(255);
  for(int y = 0; y <= height; y = y + abstand){
    for(int x = 0; x <= width; x = x + abstand){
      rect(x, y, 10, 10);
      noFill();
      stroke(0);
      ellipse(x, y, abstand2, abstand);
  }
  
}

}

