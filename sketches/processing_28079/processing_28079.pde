
Circle circle, circle2, circle3; //declare objects
Circle[] circles;

void setup(){
  
  size(500, 500);
  smooth();
  
  circles = new Circle[1000];
  
  for(int i = 0; i < 1000; i++){
   
    circles[i] = new Circle(random(0, 500), random(0, 500), random(20));
    
  }
  
  circle = new Circle(250, 250, 45);
  circle2 = new Circle(100, 100, 45);
  circle3 = new Circle(400, 400, 45);
  
  frameRate(3);

  
 }

void draw(){
  
  for(int i = 0; i < 1000; i++){
    

 circle.smilyFace(random(0,500), random(0,500), random(50));

 
  }

//  if(mousePressed == true){
//   
//    circle.smilyFace(mouseX, mouseY, random(50));
//    
//  }
 
 if(mousePressed == true){
  
   point(mouseX, mouseY);
   
 }
 
//   if(mousePressed == true){
//  
//   smilyFace(random(500), random(500), 50);
//  
//   
//  }
  
}

class Circle {
 
  float x,y, diameter;
  
  //constructor
  Circle(float xpos, float ypos, float dia){
   
    x= xpos;
    y= ypos;
    diameter = dia;
    
  }
  
  void display(){
   
    ellipse(x, y, diameter, diameter);
    
  }
  
  void move(){
   
   if(x <= width - diameter/2 && x <= height - diameter/2 && y <= width - diameter/2 && y <= height - diameter/2){
    x++;
    y++;
    
   }
    
  }
  
void smilyFace(float xpos, float ypos, float faceSize){
  
//void draw loop

 float ep = random(0, 4);
 float rNum = random(1, 3);
 
  if(faceSize/ep < faceSize*random(3)){
    
  fill(random(250), random(250), random(250), 255);
  ellipse(xpos, ypos, faceSize*rNum, faceSize*rNum);
  strokeWeight(4);
  
//  line(xpos - (faceSize/ep), ypos - (faceSize/random(8)), xpos - (faceSize/ep), ypos + (faceSize/random(8)));
//  line(xpos + (faceSize/ep), ypos - (faceSize/random(8)), xpos + (faceSize/ep), ypos + (faceSize/random(8)));

  line(xpos - (faceSize/ep), ypos - (faceSize/8), xpos - (faceSize/ep), ypos + (faceSize/8));
  line(xpos + (faceSize/ep), ypos - (faceSize/8), xpos + (faceSize/ep), ypos + (faceSize/8));
  arc(xpos, ypos + (faceSize/ep), 10, 10, 0, PI);
  
  }
  
}
  
  void randomFaces(){
   
    
    
  }
  
  
}




