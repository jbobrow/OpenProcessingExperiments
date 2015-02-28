

ArrayList circles;
float diameter;
int control;

void setup(){
  smooth();
  noStroke();
  size(800,800);

  diameter = 50;
  control = 0;

  circles = new ArrayList();
  circles.add(new Circle(random(diameter/2,width-diameter/2),random(diameter/2,height-diameter/2), random(150),random(150),random(150), random(-5,5),random(-5,5)));
}

void draw(){
  background(255);

  if(keyPressed && (key == 'a' || key == 'A') && control == 0){
    circles.add(new Circle(random(diameter/2, width-(diameter/2)),random(diameter/2, height-(diameter/2)), random(150),random(150),random(150), random(-5,5),random(-5,5)));
    control++;
  }
  else if(keyPressed == false){
    control = 0;
  }

  for(int i=circles.size()-1; i>=0; i--){
    Circle a = (Circle) circles.get(i);
    a.display();
    a.move();
  }
}

class Circle{
  float x,y, r,g,b, vx,vy;

  Circle(float givenX, float givenY, float givenR, float givenG, float givenB, float givenVX, float givenVY){
    x = givenX;
    y = givenY;

    r = givenR;
    g = givenG;
    b = givenB;

    vx = givenVX;
    vy = givenVY;
  }

  void display(){
//    stroke(0);
//    fill(255, 50);
//    ellipse(x,y, diameter*2,diameter*2);
    
    stroke(r,g,b);
    fill(r,g,b, 100);
    ellipse(x,y, diameter,diameter);    
  }

  void move(){
    x += vx;
    y += vy;

    if (x>(width-(diameter/2)) || x<(diameter/2)) vx *= -1;  
    if (y>(height-(diameter/2)) || y<(diameter/2)) vy *= -1;
  }
}


