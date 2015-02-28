
class Circle {

  float t1,t2,s1;

  Circle(float tempT1,float tempT2) {
    t1 = tempT1;
    t2 = tempT2; 
  }
  void move() {
    x = (noise(t1)*width);
    y = (noise(t2)*height);
    t1+=noiseValue;
    t2+=noiseValue;
  }    
  void display() { 
    stroke(255);
    ellipse(x,y,1,1);
    fill(90,90,175,100);
    noStroke();
    ellipse(x,y,5,5); 
  }
}


