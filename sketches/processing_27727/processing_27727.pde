
Circle [] circles;
int f;

void setup(){
  f=0;
  size(2000,999);
  smooth();
  circles = new Circle[20];
  for(int i=0;i<circles.length;i++){
    f++;
    circles[i] = new Circle(f,random(width),random(height));
   if(i%2 == 0){
     f--;
   }
  }
}

void draw(){
  fill(255,0,0,20);
  rect(0,0,width,height);
  for(int i=0;i<circles.length;i++){
    circles[i].display();
    circles[i].rotation();
  }
}










class Circle{
  float a, radius;
  float xCirc;
  float yCirc;
  float xPos, yPos;
  
  
  Circle(float angle, float xPos1, float yPos1){
    radius = 100;
    a = angle;
    xPos = xPos1;
    yPos = yPos1;
    
  }
  
  void rotation(){
    
    yCirc = sin(radians(a))*radius + (yPos);
    xCirc = cos(radians(a))*radius + (xPos);
    a++; 
  }
  void display(){
    fill(255,20);
    ellipse(xCirc,yCirc,20,20);
    
  }
}

