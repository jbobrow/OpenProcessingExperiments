
Circle [] circles;
float ax,ay,angle;
float h,wr,hr;
float hl,anglel;
float dx,dy,cx,cy,easing;


void setup(){
  size(600,600);

 
    
  ax = 30;
  ay = 30;
  angle = 0 ; 
  h = 0;
  wr=50;
  hr=50;
  
  hl = 0;
  anglel = 0;

  easing = .018;
  
  circles = new Circle[500];
  for (int i = 0; i < circles.length;i++){
    circles[i] = new Circle(random(width),random(height),random(1,30));
  }
}

void draw(){
 noCursor();
 background(35,88,76);
 smooth(); 
 stroke(159,229,210);
 
 
 //sparkle
   stroke(60,112,116);
   ellipse(random(0,600),random(0,600),1,1);

 
 //LINE(circle)
  fill(123,160,153);
  noStroke();
  ellipse(mouseX+50,mouseY+50,25,25);
  hl ++;
  anglel ++;
 
 //FISH
    dx = mouseX +40 - cx;
    dy = mouseY +40 - cy;
    cx = cx + dx * easing;
    cy = cy + dy * easing;
    
    fill(255,0,0);
    noStroke();
    ellipse(cx,cy,20,20);
 
 
 for(int i = 0; i<circles.length;i++){
   circles[i].move();
   circles[i].display();
   
   
//raindrops
   ax = cos(radians(angle)) *(h/10) + wr;
   ay = sin(radians(angle)) *(h/10) + hr;
   ellipse(ax,ay,1,1);
  angle++;
  h++;
  if(ax>9000){
    ax=random(300,600);
    ay=random(300,600);
    angle=0;
    h=0;
    wr=random(50,550);
    hr=random(50,550);
    
    fill(255);
    ellipse(wr,hr,5,5);
    
    
    
  }
  
 }

  //LINE
  stroke(255);
  fill(35,88,76);
  strokeWeight(2.5);
  triangle(mouseX+50,mouseY+50,pmouseX+50, pmouseY+50,cos(radians(anglel))*(hl/100)+(mouseX+pmouseX)-150,sin(radians(anglel))*(hl/50)+(mouseY+pmouseY)-150); 
  
  stroke(0);
  strokeWeight(5);
  line( cos(radians(anglel))*(hl/100)+(mouseX+pmouseX)-150,sin(radians(anglel))*(hl/50)+(mouseY+pmouseY)-150,cos(radians(anglel))*(hl/100)+(mouseX+pmouseX)+100,sin(radians(anglel))*(hl/50)+(mouseY+pmouseY)+100);



}


  
class Circle {
  float x,y,circleSize;
  int directionX =1;
  int directionY =1;
  

  Circle(float xpos,float ypos,float cSize){
   x = xpos;
   y = ypos;
   circleSize = cSize;
  
  }
  

  
  void display(){
   
    fill(69,139,110);
    stroke(69,139,120);
    ellipse(x,y,circleSize,circleSize);
    
    
  }
  void move(){
    x += directionX*cos(radians(y));
    y += directionY*cos(radians(x));
  }
}

