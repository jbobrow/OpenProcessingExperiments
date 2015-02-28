
Mau5 move1;
Mau5 move2;
Mau5 move3;
  
void setup() {
  size(500,500);
  move1 = new Mau5(0,392,-61);
  move2 = new Mau5(0,180,44);
  move3 = new Mau5(3,54,-14);
}
  
void draw() {
  background(255);
  move1.updateMau5();
  move1.testMau5();
  move1.drawMau5();
    
  move2.updateMau5();
  move2.testMau5();
  move2.drawMau5();
   
  move3.updateMau5();
  move3.testMau5();
  move3.drawMau5();
}
  
class Mau5 {
  int Mau5X;
  int Mau5Y;
  int speed;
    
  Mau5(int _X, int _Y, int _Speed) {
    Mau5X = _X;
    Mau5Y = _Y;
    speed = _Speed;
  }
    
  void updateMau5(){
    Mau5X = Mau5X+ speed;
  }
  
  void testMau5(){
   if(Mau5X > width || Mau5X < -13){
     speed = speed * -1;
   }
  }
    
  void drawMau5() {
     //* Head
  stroke (255);
  
  ellipseMode(CENTER);
  ellipse (Mau5X, Mau5Y+-1, 101, 101);
  //* Ears
  //Right Ear
  ellipse (Mau5X+65, Mau5Y+-60, 73, 74);
  //Left Ear
  ellipse (Mau5X-65, Mau5Y-60, 73, 74);
  //* EYes
fill(255);
  ellipseMode (CENTER);
  ellipse (Mau5X-20, Mau5Y+-1, 35, 20);
  ellipse (Mau5X+25, Mau5Y+-1, 35, 20);
  //* eyes
  stroke(200,40);
fill(200,40);  
  ellipse (Mau5X+0, Mau5Y+0, 100, 33);
  //* aureool
  stroke (255);
  fill (200,40,40);
  ellipse (Mau5X+3, Mau5Y-123, 110, 21);
  //*mouth 
  stroke (255);
  fill (255);
  ellipse (Mau5X+2, Mau5Y+31, 45, 12);
 
  stroke(0);
  fill(0);
  
  }
}

}
