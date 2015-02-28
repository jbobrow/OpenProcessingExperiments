
ArrayList points = new ArrayList();
Boolean md = false;
float art = 0.01;
float artb = 0.01;

 
void setup(){
  size(594,841);
  background(245,226,206);
  smooth();

  //noStroke();
 
}
 
void draw(){
  strokeWeight(1);
  stroke(77,61,50,16);
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
      points.add(new Point(random(width/3-10,width*2/3+20),random(680,750)) );
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
  strokeWeight(2);
  stroke(0);
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
  //saveFrame("DenizBlitz####.png");
  background(245,226,206);
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
    this.xv = cos(  noise(this.x*art,this.y*artb)*TWO_PI*1.3);
    this.yv = sin(  -noise(this.x*art,this.y*artb)*TWO_PI+2);
 
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
 
    this.x += this.xv;
    this.y += this.yv;
 
    line(this.x+this.xv, this.y+this.yv,this.x,this.y );
  }
  
 
}


