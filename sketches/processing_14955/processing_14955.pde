
//import processing.video.*;
ArrayList dla;
ArrayList particles;
int numPart=400;

//Capture video;

void setup()
{
  size(550, 300);
  background(0);
  dla = new ArrayList();

  particles = new ArrayList();
  for (int i =0; i<numPart; i++){
    Dust part  = new Dust();
    particles.add(part);
    part.x = random (width);
    part.y = random (height);
    part.vx = random (-1,1);
    part.vy = random (-1,1);  
  }
}

void draw()
{
  fill(0, 10);
  rect(-1, -1, width+1, height+1);
  for(int i=0;i<numPart;i++)
  {    
    Dust part= (Dust) particles.get(i);
    part.move();
    part.render();

//if (mousePressed)
    part.stick();
  }
  //   // noCursor();
 if (dla.size()==numPart){
   dla.clear();
   for(int i=0;i<numPart;i++)
  {
   Dust part=(Dust) particles.get(i);
   part.vx += random(-1, 1);
   part.vy += random(-1, 1);
  }
}
if (dla.size()>0){
  for (int i=1;i<dla.size();i++){
    Dust p =(Dust) dla.get(i);
    Dust q =(Dust) dla.get(i-1);
    stroke(0);
//    line(p.x,p.y,q.x,q.y);
  }
}
}


void mousePressed(){
  for(int i=0;i<numPart;i++)
  {
    Dust part=(Dust) particles.get(i);
    part.hault();
  }
}


class Dust
{
  float x = 0;
  float y = 0;
  float vx = 0;
  float vy = 0;

  float diameter=5;
  float diameter2=10;

  float diameter_sq=sq(diameter2);
  float threshold = 15;

  Dust(){

  }


  void move()
  {
    if (vx != 0 && vy != 0){
      vx += random(-1, 1);
      vy += random(-1, 1);
      vx *= .95;
      vy *= .95;
      x += vx;
      y += vy;
      if(x > width)
      {
        x = width;
        vx *= -1;
      }
      if(x<0)
      {
        x = 0;
        vx *= -1;
      }
      if(y > height)
      {
        y = height;
        vy *= -1;
      }
      if(y < 0)
      {
        y = 0;
        vy *= -1;
      }
    }  
  }
  void hault(){
    if(x>mouseX-threshold && x<mouseX+threshold && y>mouseY-threshold && y<mouseY+threshold){
      if (vx!=0 && vy!=0){
      vx = 0;
      vy = 0;
      dla.add(this);
      }

    }
  }

  void render(){
    if (vx != 0 && vy != 0){
      fill(255,208);
      stroke(255,208);
      ellipse(x, y, diameter,diameter);
      if(intersect(this, particles)) {
        vx *=-1;
        vy *=-1;
      }

    }
    if (vx == 0 && vy == 0){
      fill(255);
      stroke(255);
      ellipse(x, y, diameter2,diameter2);


    }
  }
 
  void stick(){
    if (vx != 0 && vy != 0){
      if(intersect(this, dla)) {
        vx = 0;
        vy = 0;
        dla.add(this);
      }
    }
  }
}

boolean intersect(Dust circle, ArrayList circle_array) {

  for(Iterator it = circle_array.iterator();it.hasNext();) {
    Dust circle2 = (Dust) it.next();
    if(circle2==circle) return false;
    //use square distance to avoid a call to sqrt, which is slow
    float dist_sq = sq(circle2.x-circle.x)+sq(circle2.y-circle.y);
    if(dist_sq < circle.diameter_sq) return true;

  }
  //if no intersection return false
  return false;
}


