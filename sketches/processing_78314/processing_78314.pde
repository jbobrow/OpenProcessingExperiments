
Circle[] circles;


void setup(){
  size(700,700);
  background(0,0,0);
  circles= new Circle[200];
  for(int i=0; i<circles.length; i++){
      circles[i]= new Circle(random(width),random(height), random(-500,500),random(-500,500),random(-10,10),random(-10,10));
  }
}

void draw(){
  for(int i=0; i <circles.length; i++){
  circles[i].move();
  circles[i].display();
  }
}






class Circle{
  float x,y,offx,offy,x2,y2,angle,rad;
  
  //constructor
  Circle(float _x, float _y, float _offx, float _offy,float _x2, float _y2){
    x2= _x2;
    y2= _y2;
    offx= _offx;
    offy= _offy;
    x= _x;
    y= _y;
  }
  
  //methods
void move(){
  angle+=.1;
  rad=300;
  
  
  x= rad*cos(radians(angle*4))*sin(radians(angle*5))*sin(radians(angle*3));
  y= rad*sin(radians(angle*4))*cos(radians(angle*5))*cos(radians(angle*3));
  }
  
void display(){
  //float ellsize= (mouseX-mouseY)/random(10);
  
  fill(random(500),random(92),153,70);
  smooth();
  //noStroke();
  strokeWeight(5);
  stroke(255,209,239);
  ellipse(x+offx+width/2,y+offy+height/2,random(200),random(200)); 
}


}

