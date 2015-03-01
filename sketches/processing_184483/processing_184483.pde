


void setup() {
  size(600,600);
  smooth();
  frameRate(20);
 

}

void draw() {
  background(random(0,255),random(0,255),random(0,255));
    for (int x = 10; x < 590; x = x+25) { //Array on x axis
      for (int y = 10; y < 590; y = y+25) { //Array on y axis
       fill(random(0,255),random(0,255),random(0,255));//fill
       strokeWeight(5);  //change stroke weight
       stroke(random(0,255),random(0,255),random(0,255));//change stroke color
          rect(x,y,15,15);
    }
  }
}

  


