
ArrayList <square> squareList;
ArrayList <circle> circleList;

void setup(){
  size(1000, 500);
  squareList = new ArrayList();
  circleList = new ArrayList();
  for(int i = 0; i < 20; i = i + 1){
  squareList.add(new square());
  circleList.add(new circle());
  }
}

void draw(){
  background(245, 226, 52);
  for(int i = 0; i < squareList.size(); i = i + 1){
    if(squareList.get(i).lifetime > 0){
        squareList.get(i).move();
        squareList.get(i).display();
        squareList.get(i).bounce();
    } else{squareList.remove(i);
    squareList.add(new square());
    }
  }
  for(int i = 0; i < circleList.size(); i = i + 1){
    if(circleList.get(i).lifetime > 0){
        circleList.get(i).move();
        circleList.get(i).display();
        circleList.get(i).bounce();
    } else{circleList.remove(i);
    circleList.add(new circle());
    }
  }
}

class circle{
  // variables
  float xpos = 100;
  float ypos = 600;
  float xspd = 1;
  float yspd = 1;
  float grav = 0.5;
  color col = color (random(250), random(250), random(250));
  float lifetime;
  // constructor
  circle(){
    xpos = mouseX;
    ypos = mouseY;
    xspd = mouseX - pmouseX + random(-3, 3);
    yspd = mouseY - pmouseY;
    lifetime = 250 + random(-50, 50);
  }
  // methods
  void move(){
    yspd = yspd + grav;
    xpos = xpos + xspd;
    ypos = ypos + yspd;
    lifetime = lifetime - 3;
  }
  
  void bounce(){
    if(ypos + 25 > height){
      yspd = 0.8 * -abs(yspd);
    }
    if(xpos + 25 > width){
      xspd = 0.8 * -abs(xspd);
    }
    if(xpos - 25 < 0){
      xspd = 0.8 * abs(xspd);
    }
  }
  
  void display(){
    fill(red(col), green(col), blue(col), lifetime);
    ellipse(xpos, ypos, 50, 50);
  }
}

class square{
  // variables
  float xpos = 100;
  float ypos = 600;
  float xspd = 1;
  float yspd = 1;
  float grav = 0.5;
  color col = color (random(250), random(250), random(250));
  float lifetime;
  // constructor
  square(){
    xpos = mouseX;
    ypos = mouseY;
    xspd = mouseX - pmouseX + random(-3, 3);
    yspd = mouseY - pmouseY;
    lifetime = 250 + random(-50, 50);
  }
  // methods
  void move(){
    yspd = yspd + grav;
    xpos = xpos + xspd;
    ypos = ypos + yspd;
    lifetime = lifetime - 3;
  }
  
  void bounce(){
    if(ypos + 25 > height){
      yspd = 0.8 * -abs(yspd);
    }
    if(xpos + 25 > width){
      xspd = 0.8 * -abs(xspd);
    }
    if(xpos - 25 < 0){
      xspd = 0.8 * abs(xspd);
    }
  }
  
  void display(){
    fill(red(col), green(col), blue(col), lifetime);
    rect(xpos, ypos, 50, 50);
  }
}
