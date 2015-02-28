
//H/W 9.5
//Arthur Siebesian
//Worked with the class examples for collision, but still can't get a full...
//grasp of the work, a lot of these codes are just reworked for class room examples.
Circle[] c = new Circle[50];

void setup(){
  size(1000,1000);
  background(0);
  frameRate(60);
  
  for(int i = 0; i < c.length; i++) {
    c[i] = new Circle();
  }
}

void draw() {
  for(int i = 0; i < c.length; i++) {
    c[i].walk();
    c[i].display();
    
    for(int j = 0; j<c.length; j++) {
    if ((c[i].intersect(c[j])) ){
  c[i].inter();
  }else{
  c[i].no_inter();
}
  }
}
}



class Circle {
  float x,y;
  int s;
  color k = color(255,0,0);
  
  Circle() {
    x = random(width);
    y = random(height);
    s=5;
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x,y,s,s);
    noFill();
    stroke(0,0,255);
    rect(x,y,20,20);
  

  }
  
  void walk() {
    int option = int(random(4));
    if(option == 0) {
      x = x + s;
    }else if(option == 1) {
      x = x - s;
    }else if(option == 2) {
      y = y + s;
    }else{
      y = y - s;
    }
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
    
    void inter() {
      k = color(0,255,0);
      fill(k);
    }
    void no_inter() {
      k = color(50,10);
    }
    
    boolean intersect(Circle c0){
      float d = dist(x,y,c0.x,c0.y);
      if((d > 0) && (d < s*5)) {
        return true;
      }else{
        return false;
      }
    }
  }
