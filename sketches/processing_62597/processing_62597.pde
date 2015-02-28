
class City {
  float lat;
  float lon;
  String name;
  

  City(String name, float lat, float lon) {
    this.lat = -lat;   //gets placemarkers in the right position because the y direction in processing is top down
    this.lon = lon;
    this.name = name;
  }

  void draw() {
    pushMatrix();
    translate(lon, lat);
    imageMode(CENTER);
    
    if (mouseIsOver == this){
      //fill(0);
      textAlign(CENTER);
      textFont(body);
     // pushMatrix();
      //scale(0.5,0.5);  //if you need to change size of text on the fly!
      text(name,4,-5);
      //popMatrix();
    }
      //fill(255, 128, 128);
    //else
    noStroke();
      fill(44,99,245,100);
      ellipse(0,0,1.5,1.5);
      stroke(0);
    strokeWeight(0.1);
      fill(44, 99, 245,255);
   ellipse(0, 0, 1.0, 1.0);
   popMatrix();
    
  }
}


