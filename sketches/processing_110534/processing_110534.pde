


class AttractorElement{


Vec3D  position;
Vec3D  velocity;


//constructor
AttractorElement(
Vec3D _position, 
Vec3D _velocity){
  
position = _position.copy();
velocity = _velocity.copy();
}





  void render() {

        strokeWeight(1);
        stroke(255,0,0);
        point(position.x,position.y,position.z);

  }
  
}


