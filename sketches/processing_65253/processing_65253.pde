
import processing.pdf.*;
ArrayList points = new ArrayList();
Boolean md = false;
float art = 0.01;
float artb = 0.01;
float rot = 245;
float gruen = 226;
float blau = 206;
float rot2 = 77;
float gruen2 = 61;
float blau2 = 50;
int fall = 1;
int aender = 1;
boolean isRecording = false;

 
void setup(){
  size(594,841);
  background(rot,gruen,blau);
  smooth();
  size(594,841);
  
  //noStroke();
 
}
 
void draw(){
  strokeWeight(1);
  stroke(rot2,gruen2,blau2,16);
  
     if(fall == 2){
    rot = random(80,255);
    gruen = rot + random(-100,50);
    blau = gruen + random(-80,120);
    
    rot2 = 20;
    gruen2 =23;
    blau2 = 23;
    aender = 1;
    art = 0.03;
    artb=0.03;
    
  }
  
  if(fall == 1){
    rot = 87;
    gruen = 71;
    blau = 63;
    rot2 = 77;
    gruen2 =61;
    blau2 = 50;
    aender = 1;
    art = 0.01;
    artb = 0.01;
    
    
  }
  if(fall == 3){
    rot = 245;
    gruen =226;
    blau = 206;
    rot2 = 196;
    gruen2 =20;
    blau2 = 81;
    aender = -2;
    art = 0.005;
    artb = art;
  }
    
  if(md){
    for(int f=0; f<200; f+=1){
      for(int g=0; g<height; g+=height/3){
      points.add(new Point(random(0,width),random(0,200)) );
      }
    }
    for(int f=0; f<30; f+=1){
      for(int g=0; g<height; g+=height/3){
      points.add(new Point(random(20,width/3+20),random(360,390)) );
      }
    }
     for(int f=0; f<30; f+=1){
      for(int g=0; g<height; g+=height/3){
      points.add(new Point(random(width/3+180,width-20),random(360,390)) );
      }
    }
    for(int f=0; f<30; f+=1){
      for(int g=0; g<height; g+=height/3){
      points.add(new Point(random(width/3-20,width*2/3+20),random(650,720)) );
      }
    }
  }
  //fill(255,10);
  //rect(-1,1,width+1,height+1);
 
  noiseDetail(3,0);
  //noiseSeed(1);
  for(int i=points.size()-1; i>0; i--){
    Point p = (Point)points.get(i);
    p.update();
    if(p.finished){
      points.remove(i);
    }
  
 
  }
   
  println(points.size());
  //fill(20,0,100);
  strokeWeight(1);
  stroke(0,16);
  noFill();
  //fill(245,226,206);
  smooth();
  //ellipse(width/2,20,800,500);
  arc(width/4, height*0.5, 150, 60, 0.5, PI-0.5);
  arc(width*0.75, height*0.5, 150, 60, 0.5, PI-0.5); 
  arc(width/2, height*0.72, 100, 60, 0.5, PI-0.5); 
  
}
 
void mousePressed(){
  md = true;
  strokeWeight(1);
  
}
void mouseReleased(){
  md = false;
}
void keyPressed(){
  //saveFrame("Face####.png");
  if(key == 'c'){
    fall = fall + aender;
    background(rot,gruen,blau);
    //background(random(150),random(219),random(80));
    //stroke(random(100),random(200),random(200),16);
    noiseSeed(round(random(1000)));
    for(int i=points.size()-1; i>0; i--){
      Point p = (Point)points.get(i);
      p.x = random(width);
      p.y = random(height);
      points.remove(i);
    }
  }
 //if(key == 's'){
  // if(isRecording) {
  // endRecord();
  // }
  // isRecording = true;
  // beginRecord(PDF, "face#######.pdf");
  // background(rot,gruen,blau);
 //}
}
 
class Point {
  float x,y,xv = 0, yv = 0;
  float maxSpeed = 300000;
 
  Boolean finished = false;
 
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void update(){
    
    float r = random(10,100);
    this.xv = cos(  noise(this.x*art,this.y*artb)*TWO_PI);
    this.yv = sin(  -noise(this.x*art,this.y*artb)*TWO_PI);
 
    if(this.x>width){
      //this.x = 1;
      this.finished = true;
    }
    else if(this.x<0){
      //this.x = width-1;
      this.finished = true;
    }
    if(this.y>height){
      //this.y = 1;
      this.finished = true;
    }
    else if(this.y<0){
      //this.y = height-1;
      this.finished = true;
    }
 
    if(this.xv>maxSpeed){
      this.xv = maxSpeed;
    }
    else if(this.xv<-maxSpeed){
      this.xv = -maxSpeed;
    }
    if(this.yv>maxSpeed){
      this.yv = maxSpeed;
    }
    else if(this.yv<-maxSpeed){
      this.yv = -maxSpeed;
    }
 
    this.x -= this.xv;
    this.y -= this.yv;
 
    line(this.x+this.xv, this.y+this.yv,this.x,this.y );
  }
  
 
}


