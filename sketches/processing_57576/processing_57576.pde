
//flower program
color colorYellow = #FFF40D;
color colorRed = #FF3A34;
Flower [] myFlower;

void setup(){
  size(900,400);
  smooth();
  
  myFlower = new Flower[12];
  for (int i=0; i<myFlower.length;i++){
    myFlower [i] = new Flower(int(random(12,28)), int(random(7,15)),colorYellow,colorRed);}
} //centerSize, numberPetals, centerColor, petalColor

void draw(){
  background(#CBF798);
  for (int i=0;i<myFlower.length;i++){
    pushMatrix();
    translate(i*66+80, height/2);
    myFlower[i].drawFlower();
    popMatrix();
  }
}
  
 
 
 
 
 
 
 
 
 
 
 
 


 
 //dont know how to create a seperate tap here. 
 //Class Flower 
  class Flower{
  int centerSize;
  int numberPetals;
  color centerColor;
  color petalColor;
  
  //constructor
  Flower (int tcenterSize, int tnumberPetals, color tcenterColor, color tpetalColor){
    centerSize = tcenterSize;
    numberPetals = tnumberPetals;
    centerColor = tcenterColor;
    petalColor = tpetalColor;
  }
  
  
  //method 
  void drawFlower(){
    fill(centerColor);
    ellipse(0,0,centerSize,centerSize);
    fill(petalColor);
    for (int i=0;i<360; i=i+(360/numberPetals)){
      //75
      pushMatrix();
      rotate(radians(i));
      translate((3*centerSize)/2, 0);
      ellipse(0, 0, centerSize*2, centerSize);
      popMatrix();
    }
  }
}
