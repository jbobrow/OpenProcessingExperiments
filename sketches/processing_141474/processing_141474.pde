
ArrayList<Circle> circles;
Circle circle;
int count;

void setup(){
  size(500,500);
  background(255);
  circles = new ArrayList();
  count = 0;
  generateCircle(125, 400);

}

void draw(){
 
 //float tempR = noise(12.5,12.5)*400;
   circles.get(count).move();
   circles.get(count).display();
 
}

void mouseReleased(){
  generateCircle(375, 300);
  count=count+1;
}

void generateCircle(int f, int s){
  float tempR = noise(f,f)*s;
  float ff = (float)f;
  circles.add(new Circle(tempR, ff, ff));
}
class Circle{
 float r;
 float x,y;
 float xspeed,yspeed;
 float i;
 float colr;
 float xstart, ystart;
 
 Circle(float rad, float ix, float uy){
   //r = rad;

   i=0.0;
   x = ix;
   y = uy;
   xstart=250+cos(i-0.01);
   ystart = 250+cos(i-0.01);
   colr=random(255);
 }

 // boolean testPos(){
  
//  }
  
  void move(){
      i+=0.01;
      x = 250+cos(i);
      y = 250+sin(i);
      r= noise(x,y)*300;
      colr = r/300*255;
      x=250+r*cos(i);
      y=250+r*sin(i);

  }
  
  void display(){
    //stroke(255);
    noStroke();
    fill(0,colr,colr);
    ellipse(x,y,r/2,r/2);
  }
}


