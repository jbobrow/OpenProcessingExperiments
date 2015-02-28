

ArrayList c;
float Size;
float startSize;
float windX = 0;
float windY = 0;
boolean popOnce = false;
 void setup(){
   size(400,400);
   startSize = width;
   smooth();
   c = new ArrayList();
   ellipseMode(CENTER);
   c.add(new Circle(width/2,height/2,startSize));
   Size = startSize;
    
 }
 void draw(){
   background(18,80,105);
   for (int i = c.size()-1; i >= 0; i--) {
    Circle ci = (Circle) c.get(i);
     ci.display(windX , windY);
     if(ci.clickable == false){
       c.remove(i);
     }
   }
 }
  
 void mousePressed(){
   for ( int i = 0; i < c.size(); i++){
      Circle ci = (Circle) c.get(i);
      ci.Clicked();
   }
 }
 void mouseReleased(){
 popOnce = true;
 }
class Circle{
  float x;
  float y;
  float xAcc;
  float yAcc;
  float jitterValue = 1.5;
  float radius;
  Boolean clickable = true;
  Circle(float _x,float _y,float _radius){
    x = _x;
    y = _y;
    radius = _radius;
    xAcc = random(jitterValue) - jitterValue/2;
    yAcc = random(jitterValue) - jitterValue/2;
    fill(219,141,22);

  }
  void display(float windX,float windY){
    x += windX;
    y += windY;
    ellipse(x,y,radius,radius);
    maths();
  }
  void maths(){
    x += xAcc;
    y += yAcc;
    if (x > width + radius/2){
      x = -radius/4;
    }
    if (x < -radius/4 ){
      x = width + radius/4;
    }
    if (y > height + radius/4){
      y = -radius/4;
    }
    if (y < -radius/4 ){
      y = height + radius/4;
    }
  }
  void Clicked(){
    if((dist(mouseX,mouseY,x,y) < radius/2)&&(dist(mouseX,mouseY,x,y) > -radius/2)&&(clickable)&&(popOnce)){
        c.add(new Circle(x-(radius/4), y-(radius/4), radius/2));
        c.add(new Circle(x-(radius/4), y+(radius/4), radius/2));
        c.add(new Circle(x+(radius/4), y-(radius/4), radius/2));
        c.add(new Circle(x+(radius/4), y+(radius/4), radius/2));
         
        
      clickable = false;
      popOnce = false;
    }
  }
}


