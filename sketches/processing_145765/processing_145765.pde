
int Mau5Y;
int Mau5X;
int eyes;
int repeat;
 
//basic
void setup() {
  size(500, 500);
  eyes = 170;
}
 
 
void draw() {
  background(255);
   
  for (int i = 0; i < 15; i = i + 1){
  monster (-24+(i*96),260);
  }
 
  aureool();
}
 
 
 
 
 
void monster(int Mau5X, int Mau5Y) {
  
   //* Head
  stroke (255);
  
  ellipseMode(CENTER);
  ellipse (Mau5X, Mau5Y+-1, 101, 101);
  //* Ears
  //Right Ear
  ellipse (Mau5X+65, Mau5Y+-60, 73, 74);
  //Left Ear
  ellipse (Mau5X-65, Mau5Y-60, 73, 74);
  //* Eyes
fill(255);
  ellipseMode (CENTER);
  ellipse (Mau5X-20, Mau5Y+-1, 35, 20);
  ellipse (Mau5X+25, Mau5Y+-1, 35, 20);
  //* Eyemask
  stroke(200,40);
fill(200,40);  
  ellipse (Mau5X+0, Mau5Y+0, 100, 33);
  //* aureool
  stroke (255);
  fill (eyes);
  ellipse (Mau5X+3, Mau5Y-123, 110, 21);
  //*mouth 
  stroke (255);
  fill (255);
  ellipse (Mau5X+2, Mau5Y+31, 45, 12);
 
  stroke(0);
  fill(0);
  
}
 
 
void aureool(){
    for (int i = 0; i < 5; i++) {
    eyes = eyes + i;
  }
  if (eyes >= 255) {
    eyes = 170;
  }
}
