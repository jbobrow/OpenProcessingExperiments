
Plane[] planes = new Plane[10];
//Plane is the name of the class 
//then planes is the array of the class

void setup(){
  size(400,400);
  smooth();
  //initialize all "planes"
  for (int i=0; i<planes.length; i++){
    planes[i] = new Plane(random(width),random(height),30,30,8);
  } 
}

void draw(){
  background(100,40,180);
  for (int i=0; i < planes.length;i++){
    planes[i].display();
    planes[i].jiggle();
    //this is like diplay of planes, jiggle of plaes. 
  }
}

class Plane {
  //when you make a new class you use class instead of void
  //Plane variables
  float x,y,w,h,eyeSize;
  
  //Plane constructor
  Plane(float tempX, float tempY, float tempW, float tempH, float tempEyesize){
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    eyeSize = tempEyesize;
  }
  
  //move Plane
  void jiggle(){
    //change the location 
    x = x + random(-1,1);
    y = y + random(-1,1);
    
    //Constrain Plane to window
    x=constrain(x,0,width);
    y=constrain(y,0,height);
  }
  
  //display Plane
  void display(){
    ellipseMode(CENTER);
    rectMode(CENTER);
    //draw bee's arms
    for (float i = y-h/3; i <y + h/2; i+=15){
      stroke(0);
      line(x-w/4,i,x+w/4,i);
    }
    //bee's eyes
    fill(0);
    ellipse(x-w,y-h*2,eyeSize/2,eyeSize/1.5);
    ellipse(x+w,y-h*2,eyeSize/2,eyeSize/1.5);
    line(x-w,y-h*2,x-w/2.3,y-h*1.2);
    line(x+w,y-h*2,x+w/2.3,y-h*1.2);
  
 
    //wings 
    fill(250);
    stroke(0);
    fill(250,80);
    triangle(x-w*.8,y-h/2,x+w*.8,y-h/2,x,y*1.05);
    triangle(x-w*.8,y+h/2,x+w*.8,y+h/2,x,y*.95);
      
    //draw bee's boday
    stroke(0);
    fill(240,200,0);
    ellipse(x,y,w/2,h*1.3);
    
    //draw bee's head
    stroke(0);
    fill(255);
    ellipse(x,y-h,w,h);
    
    }
}



