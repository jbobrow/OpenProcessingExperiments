



ArrayList<Matrix> squares;  //array list

void setup(){  
  size(400,400);
  background(0); // black
  smooth();

  

  

squares = new ArrayList<Matrix>();

//square
squares.add(new Matrix());
  

}

void draw(){
  background(0); //black
  
  

  for(int i = 0; i < squares.size(); i++){
    Matrix othersquare = squares.get(i);  
    othersquare.update();
    othersquare.display(); 
  }

//makes many squares 
squares.add(new Matrix());
  
}




class Matrix{
  
float posx, posy;  
float radius;  
float fallspeed;  
float ground;  
 
 //constructor
 Matrix(){
  posx = random(width);  //where the square will be
  posy = 0; 
  radius = random(1,8); //how big the square will be
  fallspeed = random(5,15);  //how fast it will go

 }
 
 
 void update(){

  posy += fallspeed;  // 
  
  
 }
  
  
  void display(){
   
    fill(32,219,20);//green
    rect(posx,posy,radius,radius);//squares
    
   
 
 
    
      if(mousePressed){
      fallspeed = random(1,5);
      }else{
        fallspeed = random(5,10); //if you press the mouse, the cubes will slow down, if you let go, they will go back to the same speed.
    }
  }  
}



