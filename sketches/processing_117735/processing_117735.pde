
//3D Pyramid//
//I have set all line coordinates manually, which I could not find the easier way, imagining hundreds of joints.






Point[] mypoints= new Point[4];

void setup(){
  
  size(500,500,P3D);
  
  smooth();
  for(int i=0;i<mypoints.length;i++){
    mypoints[i]=new Point();
              
  }
}


void draw(){
  
  
  
  background(190,125,125);
  
  
  for(int i=0;i<mypoints.length;i++){
    
    mypoints[i].display();
    mypoints[i].update();
    strokeWeight(2);
    line(mypoints[0].location.x,mypoints[0].location.y,mypoints[0].location.z,mypoints[1].location.x,mypoints[1].location.y,mypoints[1].location.z);
    line(mypoints[1].location.x,mypoints[1].location.y,mypoints[1].location.z,mypoints[2].location.x,mypoints[2].location.y,mypoints[2].location.z);
    line(mypoints[2].location.x,mypoints[2].location.y,mypoints[2].location.z,mypoints[0].location.x,mypoints[0].location.y,mypoints[0].location.z);
    line(mypoints[3].location.x,mypoints[3].location.y,mypoints[3].location.z,mypoints[1].location.x,mypoints[1].location.y,mypoints[1].location.z);
    line(mypoints[3].location.x,mypoints[3].location.y,mypoints[3].location.z,mypoints[0].location.x,mypoints[0].location.y,mypoints[0].location.z);
    line(mypoints[3].location.x,mypoints[3].location.y,mypoints[3].location.z,mypoints[2].location.x,mypoints[2].location.y,mypoints[2].location.z);
  }
}



class Point{
  
  PVector location;
  PVector velocity;
  float lineweight;
  float speed;
  float aa=200;
  float bb=300;
  
  
  float red,green,blue;
  
  Point(){
    location=new PVector(random(aa,bb),random(aa,bb),random(aa,bb));
    lineweight=6;
    red=0;
    green=0;
    blue=0;
    speed=0.5;
  
    
    
  }
  
  void display(){
    stroke(red,green,blue);
    strokeWeight(lineweight);
    point(location.x,location.y,location.z);
    
  }
  
  void update(){
    
    velocity=new PVector(random(-speed,speed),random(-speed,speed),random(-speed,speed));
    location.add(velocity);
    
  }
  
  void edges(){
    
   if(location.x>300 && location.x<200){
     location.x=location.x*-1;
   }
   
   if(location.y>300 && location.y<200){
     location.y=location.y*-1;
   }
   
   if(location.z>300 && location.z<200){
     location.z=location.z*-1;
   }
    
  }
  
  void fixlocation(){
    location.x=250;
    location.y=250;
    location.z=250;
  }
  
  void changecolor(int clrr,int clrg,int clrb){
    
    red=clrr;
    green=clrg;
    blue=clrb;
}
}



