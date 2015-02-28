


class Cell {

  // A cell object knows about its location in the grid as well as its size with the variables x, y, w, h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float  hr, vr; //  horizontal and vertical radious
  float angle;
   	

  float noiseVal;
  float noiseScale=0.02;

  
  Cell(float tempX, float tempY, float tempW, float tempH, int tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    hr= w/2;
    vr= h/2;
    angle=tempAngle;
  }
  

  void display() {
    stroke(255);
    noiseDetail(8,0.5);
      noiseVal = noise(
        (200+x) * noiseScale,
        (200+y) * noiseScale
      );

    
  float r =  noiseVal*255;
  float g =  (int)random(0, 255);
  float b =  noiseVal*255;

     
    fill(r,g,b);
    rect(x,y,w,h);
  }
  
  void update(){
    noiseDetail(3,0.5);
      noiseVal = noise(
        (200+x) * noiseScale,
        (200+y) * noiseScale
      );
    if(abs(mouseX-x) < hr  && abs(mouseY-y)< vr){
     float r = (int)random(0, 254);
     float g = (int)random(0, 134);
     float b = noiseVal*255;
     
      fill(r,g,b);
      rect(x,y,w,h);
    }
  }
}


