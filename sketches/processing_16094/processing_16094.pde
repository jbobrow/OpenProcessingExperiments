
class Car {
  float w;
  float h;
  float speed;
  float x;
  float y;
  float z;
  color c;
  int cloud;

  Car(float _w, float _speed, float _x, float _y, color _c, int _cloud) { //values of particular car model
    w = _w;
    speed = _speed;
    x = _x;
    y = _y;
    c = _c;
    cloud = _cloud;
    z = random(-1000,0);

    h = 10;
  }

  void drive() { // update will change position of car based on speed
    z = z + speed;
    if(z>200) {
      z = -1200;
    }
  }

  void display() { // displaying our car
    fill(c);
    pushMatrix();
    translate(0,0,z);
    //rect(x,y,w,h); // rectangle represents the car
    image(img[cloud],x,y, -img[cloud].width/4,img[cloud].height/4);
    
    popMatrix();
  }

  void changeDirection() {
  }
}


