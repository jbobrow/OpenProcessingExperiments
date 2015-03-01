
Circle[] circles;

void setup(){
  size(640,480);
  smooth();
  
  circles = new Circle[50];
  for(int i=0; i<circles.length; i++){
    circles[i] = new Circle();
    Circle c = circles[i];
  }
  
  //if (t!=null) t.stop();
    //new MovementThread();

}

void draw(){
  background(0);

  stroke(255,150);
  for(int i=0; i<circles.length; i++)
    for(int j=i+1; j<circles.length; j++)
      if (circles[i].intersects(circles[j]))
        line(circles[i].x,circles[i].y,circles[j].x,circles[j].y);
      else
        point(circles[i].x,circles[i].y);

  noStroke();
  
  for(int i=0; i<circles.length; i++){
    circles[i].move();
    circles[i].draw();
  }
  
  //println(frameRate);
  //saveFrame("/frames/frame-#####.bmp");
}

class Circle{

  float x, y, radius;
  color c;
  float speed, direction;
  
  Circle(){
    this.radius = random(10,120);
    
    this.x = random(0,width-1);
    this.y = random(0,height-1);
    
    this.c = color(random(50,255),random(50,255),random(50,255),75);
    this.speed = random(1, 3);
    this.direction = random(0, TWO_PI);
  }
  
  void move(){
    this.x += this.speed*cos(this.direction);
    this.y += this.speed*sin(this.direction);
    
    if (this.y < 0|| this.y > height-1)
      this.direction=-this.direction;
    if (this.x < 0 || this.x > width-1)
      this.direction=PI-this.direction;
      
    this.direction %= TWO_PI;
  }

  void draw(){  
    fill(this.c);
    ellipse(this.x, this.y, this.radius, this.radius);
  }
    
  boolean intersects(Circle c){
    Circle c1 = this, c2 = c;
    float distance = sqrt(sq(c2.x - c1.x) + sq(c2.y - c1.y));
    return (distance <= (c1.radius + c2.radius)/2); 
  }
  
}
Thread t;
class MovementThread implements Runnable {
  MovementThread() {
    t = new Thread(this,"Movement Thread");
    t.start();
  }
 
  public void run() {
    try {
      while(true)
      {
        for (int i=0; i<circles.length; i++)
            circles[i].move();
        Thread.sleep((long)(1/frameRate*250)); //Update position once per frame to limit CPU usage
      }
    }
    catch (InterruptedException e) {
      System.out.println("Child interrupted.");
    }
    System.out.println("Exiting child thread.");
  }
}



