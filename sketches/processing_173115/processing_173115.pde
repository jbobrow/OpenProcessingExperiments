
PVector position, velocity, force, centre;//sets vector class (position, velocity, or acceleration)
void setup(){
size(800,800);
position = new PVector(50,50);//position for starting vector
velocity = new PVector(2, 3.5);//the starting vector
strokeWeight(6);
}
void draw(){
background(255);
velocity.add(0, 0.5, 0);//gravity vector to make it fall
velocity.mult(0.98);//damp or air resistance to make it fall slower
position.add(velocity);//gravity starts imediatly

bounce();//draws the class bounce
point(position.x, position.y);//draws in the position specified in the pvector
}
void bounce(){
  if(position.x > width){
    position.x = width;
    velocity.x = -velocity.x;
  } else if ( position.x < 0){
    position.x = 0;
    velocity.x = -velocity.x;
    //reverses the velocty of a forces if it reaches the sides
  }


  // as above but notice how the velocity is reversed by multiplying by -1 less typing ;) 
  if(position.y > height){
    position.y = height;
    velocity.y *= -1;
  } else if ( position.y < 0){
    position.y = 0;
    velocity.y *= -1;
    //reverses the velocty of a forces if it reaches the top or bottom
  }

}


