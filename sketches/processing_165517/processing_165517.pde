
Square[]shape = new Square[400];

void setup() {
  size(500,500);
  for (int i = 0; i<200; i++){
    shape[i] = new Square();
    

  }
}
  void draw(){
     PVector SquarePos = new PVector(0,0);

  
  
    background((random (0, 255)), (random (0, 255)), (random (0, 255)));
    rect(width/2, height/2, 20, 20);
  }
  
 class Square {
 PVector shapePos= new PVector (0,0);
 PVector shapeSize= new PVector (0,0); 

 }
   


