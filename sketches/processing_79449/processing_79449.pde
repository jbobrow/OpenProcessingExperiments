
//When you click the mouse, a new square is drawn on top of the old. It's all with random colors, 
//and being transparent you are able to see the other layers underneath. If you press down the mouse for longer
//you get the 60s flower power effect.





Circle[] circles;




void setup(){
  size(800,800);
  background(120);
  circles = new Circle[20];
  for(int i = 0; i < circles.length; i++){
    circles[i] = new Circle(random(width),random(height),random(-500,500),random(-500,500));
  }
}

void draw(){
  //background(120);
  for(int i = 0; i < circles.length; i++){
  circles[i].move();
  circles[i].displayC();
  }
  
 if(mousePressed){
  rect(0,0,800,800);
  fill(random(255), random(255), random(255),30);
 } 
}
























class Circle{
  float x,y,speedX,speedY,ann,angle,offx,offy,glowLight,random;
  //constructor
  Circle(float _x, float _y, float _offx, float _offy){    //underscore is just to make it different from the other "x" and "y".
   offx= _offx;
   offy= _offy;
    x = _x;
    y = _y;
    angle = random;
    smooth();
    ann=2;
  }
 
//Methods

void move(){                                                 //move; made-up name
  ann+=1;
  x = ann*cos(radians(angle))*sin(radians(angle));
  y = ann*sin(radians(angle))*cos(radians(angle/5));
  angle++;
}

void displayC(){                                             //displayC; made-up name
  float ellsize = (mouseX-x)/10;
  rect(x+offx+width/2,y+offy+height/2,ellsize,ellsize);
  ellipse(x+offx+width/2,y+offy+height/2,ellsize,ellsize);
 
  glowLight = abs(196*sin(radians(angle)));
  //fill(57,67,234,56);
  
 
}
} 

