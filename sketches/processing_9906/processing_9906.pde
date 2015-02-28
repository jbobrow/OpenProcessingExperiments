
class Bubble {
  color c;
  //velocity and accelerator
  float v, ac;
  //initial position
  float x0, y0;
  // dimension
  float di, d;
  
  Bubble(float tempX, float tempY){
    c = color(255);
    v = 0;
    ac = 0.1;
    x0 = tempX;
    y0 = tempY;
    di = 1;
 }
  
  void display(){
    fill(c);
    noStroke();
    ellipseMode(CENTER);
    if (di <= 80 && mousePressed){
    ellipse(x0, y0, di, di);
      di++;
    }else if (di== 80 || mousePressed == false){
       frozen[j] = di;
    }
  }

  void drop(float tempD){
      d = tempD; 
      ellipse(x0, y0, d, d);
      y0 = constrain(y0, 0, height - d/2);
      y0 = y0+v;
      v += ac;
      if (y0 >= height-d/2){
      v*=-0.9;      
     }
  }

  
}

