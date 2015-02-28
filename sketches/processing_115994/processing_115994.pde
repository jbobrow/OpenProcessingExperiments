
Snow[] flakes = new Snow[300];
Building b;

void setup() {
  size (500, 900);
  for (int i = 0; i<flakes.length; i++) { 
    flakes[i] = new Snow(random(2, 10));
    flakes[i].spreadY(i);
  }
}
void draw() {
  background(0); 
  b = new Building();
    b.display();
  for (int i = 0; i < flakes.length; i++) {
    flakes[i] .display();
  if (flakes[i].x > 280 && flakes[i].y >445 && flakes[i].x<400){
    flakes[i].bounce();  
  }
  }
  }




class Snow {
  float x; 
  float y;
  float alpha;
  float diameter;
  float speed = random(.1, .9);
  float descentX;

  Snow (float tempD) {
    x = random(-50, width+50);
    y = random(0,40);
    diameter = tempD;
  }
  
  void spreadY(int i) {
    y = y - i*3;
  }
  
  void display() {
    alpha = map(y, 0, height, 255, -50);
    noStroke();
    fill(255, alpha);
    ellipse(x, y, diameter, diameter);
    y = y + speed;
    x = x + descentX;
    
    //checking the boundary
    if (y > height) {
      y = -diameter;
    }
    if (x < 0-50) {
      x = width+diameter;} 
      else if (x > width+50){
      x = 0-diameter;
    }
    
    }
  void bounce(){
    y = y - speed; 
}
}
  


class Building {
  float x = 300;
  float y = 900;
  int width = 85;
  int height = 65;
  void display() {
    stroke(255);
    strokeWeight(2);
    noFill();
    rectMode(RADIUS);
    rect(x, y, width/2, height/2);
    rect(x+width, y, width/2, height/2);
    rect(x+width/2, y+height/2, width*0.8, height*2);  // 2nd rect
    rect(x, y-height*3, width*0.2, height*4);  //twin 3rd recs
    rect(x+width, y-height*3, width*0.2, height*4);
    rect(x+width/6, y-height*7, width/6, height/2);//twin 4rd recs
    rect(x+width/6+width*0.7, y-height*7, width/6, height/2);
    rect(x+width/2, y-height*7.7, width/3, height/2);  //5th rect
    rect(x+width/2, y-height*7.7, width/3, height/2);
    rect(x+width/2, y-height*8.2, width/4, height/4); //6th rect
    rect(x+width/2, y-height*8.5, width/6, height/6);//7th rect
    rect(x+width/2, y-height*9, width/9.5, height/2);//8th rect
    ellipse(x+width/2, y-height*9.5, height/6, height/6);
    line(x+width/2, y-height*9.5, x+width/2, y-height*11);//needle
    
  }
}



