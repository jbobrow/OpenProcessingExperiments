
ArrayList points = new ArrayList();
Boolean md = false;

void setup(){
  size(800,600);
  background(255);
  smooth();
  //noStroke();

}

void draw(){
  if(md){
    for(int f=0; f<500; f+=1){
      //for(int g=0; g<height; g+=height/10){
      points.add(new Point(random(0,width),random(0,height)) );
      //}
    }
  }
  //fill(255,10);
  //rect(-1,1,width+1,height+1);
  //background(255);
  noiseDetail(8,0);
  //noiseSeed(1);
  for(int i=points.size()-1; i>0; i--){
    Point p = (Point)points.get(i);
    p.update();
    if(p.finished){
      points.remove(i);
    }
  } 
  
  println(points.size());
}

void mousePressed(){
  md = true;
}
void mouseReleased(){
  md = false;
}
void keyPressed(){
  background(255);
  noiseSeed(round(random(1000)));
  for(int i=points.size()-1; i>0; i--){
    Point p = (Point)points.get(i);
    //p.x = random(width);
    //p.y = random(height);
    points.remove(i);
  }
  //saveFrame("perlin####.png");
}

class Point {
  float x,y,xv = 0, yv = 0;
  float maxSpeed = 3000000;

  Boolean finished = false;

  Point(float x, float y){
    this.x = x;
    this.y = y;
  } 

  void update(){
    stroke(0,16);
    float r = random(1);
    this.xv = cos(  noise(this.x*.01,this.y*.01)*TWO_PI  );
    this.yv = -sin(  noise(this.x*.01,this.y*.01)*TWO_PI  );

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






