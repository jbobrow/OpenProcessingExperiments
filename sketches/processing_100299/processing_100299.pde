
boolean odd = false;
int x;
int y;
int timer;
float speed;
int score;
RedDot dot;
Cursor c;
ArrayList RD;
ArrayList BD;
ArrayList GD;
void setup() {  // this is run once.   
    // set the background color
    background(255);
    // canvas size (Integers only, please.)
    size(300, 300);
    // smooth edges
    smooth();
    // limit the number of frames per second
    frameRate(30);
    dot = new RedDot();
    
    c = new Cursor(mouseX, mouseY);
    
    RD = new ArrayList();
    
    BD = new ArrayList();
    
    GD = new ArrayList();
    
    speed = 1;
    
    score = 0;
 
    //
    
    for(int i = 1; i <= 15; i++) {
      RedDot r = new RedDot();
      RD.add(r);
    }
    
    for(int i = 1; i <= 15; i++) {
      BlueDot b = new BlueDot();
      BD.add(b);
    }
    
    for(int i = 1; i <= 15; i++) {
      GreenDot b = new GreenDot();
      GD.add(b);
    }
    
}
void draw() {  // this is run repeatedly.  
    /*if(c.RedDotHit(dot)){
      dot.reset();
      System.out.println("HIT");
    }*/
    
    background(255);
    
    for ( int i = 0; i < RD.size(); i++ ) {
     RedDot r = (RedDot) RD.get(i);
     r.move();
     r.draw();
     if(c.RedDotHit(r)) {
       r.reset();
      
     }
    }
     
     for ( int i = 0; i < RD.size(); i++ ) {
     GreenDot g = (GreenDot) GD.get(i);
     g.move();
     g.draw();
     /*if(c.RedDotHit(g)) {
       g.reset();
     }*/
   }
   
   for ( int i = 0; i < BD.size(); i++ ) {
     BlueDot b = (BlueDot) BD.get(i);
     b.move();
     b.draw();
     /*if(c.BlueDotHit(b)) {
       b.reset();
     }*/
    }
   
    
    speed = 1 + millis() * .00005;
    dot.move();
    dot.draw();
    c = new Cursor(mouseX, mouseY);
    c.draw();
    
    /*if( c.RedDotHit(dot) ) {
      dot.reset();
    }*/    
}
class RedDot {
    private float x;
    private float y;
    
    private int hp;
    
    private int rad;
   
    RedDot() {
      x = random(-200,0);
      y = random(-200,0);
      
      hp = 5;
      
      rad = 5;
      
      //speed = 1;
    }
    void draw() {
      stroke( random(255), random(50), random(50) );
      strokeWeight(1);
      fill ( random(255), random(50), random(50) );
      ellipse( x, y, rad, rad );
    }
    public float getX() {
      return X;
    }
    public int getRad() {
      
      return rad;
      
    }
    public float getY() {
      return Y;
    }
    
    public int getHP() {
      
      return hp;
      
    }
    
    public void setHP( int h) {
      
      hp = h;
      
    }
    
    public void reset() {
      x = random(-200,0);
      y = random(-200,0);
      
    }
    public void move() {
      if( x >= width && y >= height ) {
          reset();
      }
      x+=speed;
      y+=speed;
    }
}
class BlueDot extends RedDot {
  
  private float x;
  
  private float y;
  
  private int hp;
  
  private int rad;
 
 BlueDot() {
    
   x = random(width/2.0-100, width/2.0 + 100);
   
   y = random(height, height + 200);
   
   hp = 5;
   
   rad = 5;
  
 } 
 
 void draw() {
   
   stroke (random(50), random(50), random(255));
   
   strokeWeight(1);
   fill ( random(50), random(50), random(255) );
   ellipse( x, y, rad, rad );
   
 }
 
 public void move() {
      if( y <= 0 ) {
          reset();
      }
      y-=speed;
  }
  
  public void reset() {
      x = random(width/2.0-100, width/2.0 + 100);
      y = random(height, height + 200);   
  }
  
}
 class GreenDot extends RedDot {
   
  private float x;
  
  private float y;
  
  private int hp;
  
  private int rad;
 
 GreenDot() {
    
   x = random(width, width + 200);
   
   y = random(0, -200);
   
   hp = 5;
   
   rad = 5;
  
 } 
 
 void draw() {
   
   stroke (random(50), random(255), random(50));
   
   strokeWeight(1);
   fill ( random(50), random(255), random(50) );
   ellipse( x, y, rad, rad );
   
 }
 
 public void move() {
      if( x < 0 && y > height ) {
          reset();
      }
      
      x-=speed;
      y+=speed;
  }
  
  public void reset() {
      x = random(width, width + 200);
      y = random(0, -200);   
  }
  
 }
public class Cursor {
    private float curX;
    private float curY;
   
    private float randBotLeft = 0;
   
    private float randBotRight = width;
   
    private float top = width/2.0;
   
    public Cursor(float x, float y) {
      curX = x;
      curY = y;
    }
    public void draw() {
      stroke(random(50), random(255), random(255), 90);
      line(curX-5, curY+5, randBotLeft, height);
      
      fill(0, 0, 255, 100);
      
      ellipse(curX-5, curY+5, 5, 5);
      stroke(random(255), random(255), random(50), 90);
      smooth();
      strokeWeight(1);
      line(curX+5, curY+5, randBotRight, height);
      
      fill(0, 255, 0, 100);
      
      ellipse(curX+5, curY+5, 5, 5);
      smooth();
      strokeWeight(1);
      
      stroke(random(255), random(50), random(255), 90);
      line(curX, curY-5, top, 0);
      
      fill( 255, 0, 0, 100);
      
      ellipse(curX, curY-5, 5, 5);
      strokeWeight(1);
      
      //fill(209);
      
      //stroke(209);
      //ellipse(curX, curY, 40, 40);
    }
   
    public boolean RedDotHit(RedDot r) {
       /*float q = (0-curY)/(top - curX);
       System.out.println(q);
       // y1 is curY, x1 is curX
       float xCor = (r.getX()/q + r.getY() + curX * q - curY)/(q+1/q);
       float yCor = q*(xCor-curX)+ curY;
       System.out.println(dist(xCor, yCor, r.getX(), r.getY()));
       return dist(xCor, yCor, r.getX(), r.getY()) <= r.getRad();*/
       
       /*float q = (curY - height)/curX;
       float xCor = (r.getX()/q + r.getY() - width)/(q + 1/q);
       float yCor = q * xCor + height;
       return dist(xCor, yCor, r.getX(), r.getY()) <= r.getRad();*/
       
       float q = (curY)/(curX - top);
       float xCor = (1/q + r.getY() + q)/(q + 1/q);
       float yCor = q * (xCor - 1);
       ellipse(xCor, yCor, 2, 2);
        System.out.println("Coordinates of Dot: " + r.getX() + " " + r.getY());
        System.out.println("Intersection at " + xCor + ", " + yCor + " Distance of " + dist(xCor, yCor, r.getX(), r.getY()));
       return dist(xCor, yCor, r.getX(), r.getY()) <= r.getRad() && xCor > curX;    
       
    }
}

