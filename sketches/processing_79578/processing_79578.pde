
Circle[] circles = new Circle[100];
void setup(){
size(800,800);
 background(0);
//circle1 = new Circle(20,30);
//circle2 = new Circle(150,140);
for(int i = 0; i < circles.length; i++){
  float x = 108 + i*200;
  float y = 130 + i*30;
  circles[i] = new Circle(x, y);

}
}
void draw(){
  //background(0);
for(int i = 0; i < circles.length; i++){
  circles[i].move();
  circles[i].displayC();
}
}

class Circle{
  float x, y, angle1, angle2;

  //constuctor
  
  Circle(float Cx, float Cy){
    x = Cx;
    y = Cy;
    
  }
  

  
  void move(){

    
      //float angle1, angle2;
      float ang1 = radians(angle1);
      float ang2 = radians(angle2)*sin(20);

       x += (sin(ang2) * 90);  //(sin(random(203))));

       y += (cos(ang2) * random(10));
        stroke(0,random(70),random(170));
        //stroke(random(10),random(0),random(130));
      strokeWeight(0);

    //noFill();
    fill(random(50),random(0),random(50));
    angle1 *= 10;
    angle2 += 80;
    

}
  
void displayC(){
smooth();
  for (int i = 0; i <= 9; i ++){
  rect(x+i, y*i, random(10.5), random(20.5), random(60),random(200.5));
  //triangle(x+i, y*i, random(10.5), random(20.5), random(60),random(100.5));
  }
}
}

