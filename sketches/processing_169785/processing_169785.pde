
// 
//inspired by: http://www.openprocessing.org/sketch/7316

ArrayList points = new ArrayList();
float mouspeedX=0;
float mouspeedY=0;
void setup(){
  size(800,600);
  background(125);
  smooth();
}

void draw(){
   // fill(255,10);
   // rect(0,0,width,height);
   for(int c=points.size()-1; c>=0; c--){
    Point p = (Point)points.get(c);
     if(p.done){ points.remove(c);}
     else{  
     p.findNN();
     p.update();  }
  }
 // println(points.size());
}
 
void mouseDragged(){
   mouspeedX=  (mouseX - mouspeedX)/mouseX;
   mouspeedY=  (mouseY - mouspeedY)/mouseY;

  //float shift =random(-10,10);
  //float speed = mouspeedX/2;//random(1.2,2.5);
  color col = color(255,48);
  for( float i=.5; i<1.5; i+=.5){ //.1
    for( int c=0; c<360; c+=60){ //+10
      float xv=cos(radians(c+mouspeedX))*mouspeedX*i/3; // cos(radians(c+shift))*speed*i/3 c t
      float yv=sin(radians(c+mouspeedY))*mouspeedY*i/3;
      PVector from, to, speed;
      to= new PVector (mouseX, mouseY);
      from= new PVector (mouseX, mouseY);
      speed= new PVector (xv,yv);
      points.add( new Point(from,speed, col, to , 10 ) );
    }
  }
}
 
class Point {
  float x,y,xv,yv, disto =random(10,13);
  float r= 4;
  PVector from, to, speed;
  float shrinkRate;
  boolean done = false;
  float timer = 2;
  color c;// = color(random(200,255), 100,0,48);
  //IntList sordist;
  
  Point(PVector from, PVector speed, color c, PVector to, float disto){ 
    this.from= from;
    this.speed= speed; 
   // this.shrinkRate = random(.995,.999);
    this.c = c;
    this.to= to; 
  }
 
 void findNN (){
   float mindist=999;
   //int closestp;
   for (int c=points.size()-1; c>=0; c--){ 
       Point q = (Point)points.get(c);
       float dist=sqrt( sq(this.from.x - q.from.x)+sq(this.from.y -q.from.y)) ;
      // this.sordist[c]= dist;
    if(dist < mindist && dist>0) {
      mindist=dist;
      this.to.x=q.from.x; 
      this.to.y=q.from.y; 
      this.disto=mindist;
    }
   }
   // this.sortdist.sort()
   // idx= for... dist == sortdist // should return a bool or idx
 }
 
  void update(){
     this.shrinkRate =  .999+(cos(timer*10))/100 ;//random(.995,.999);
    if(this.r>0){ this.r *= shrinkRate;}
      this.speed.mult(1); //.999
      this.speed.x += random(-.02,.015);
      this.speed.y += random(-.02,.015);
      this.speed.x += sqrt(this.disto)/1000;
      this.speed.y += sqrt(this.disto)/1000;
      
    timer -= .01;//random(.01,.1);
    if(timer <= 0){
      this.done = true;
    }
    //this.xv = noise(this.x*.02-PI/4,this.y*.02)*2-1;
    this.from.add(this.speed);
   // fill( (this.speed.x + this.speed.y)*100, this.speed.x*100, this.speed.y*200 ,64); // 
    //fill(50,1);
    //stroke(c);//255,48);
    strokeWeight(.1);
    //ellipse(this.from.x,this.from.y,this.r,this.r); // ellipse(this.to.x,this.from.y,this.r,this.r);
    stroke( ((this.speed.x) + (this.speed.y))*300, this.speed.x*800, this.speed.y*800 ,64); // 
    line(this.from.x,this.from.y, this.to.x, this.to.y);  
  }
}
