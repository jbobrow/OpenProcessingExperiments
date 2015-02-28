
int radius;
int cols;
int rows;
int total;
float r = 0;
int RADI;
int punctuation = 0;
int slowdownMax = 100;
int slowdownCurr = 0;
boolean isSlowingDown = false;



boolean isDopelgangerActive = true;
ArrayList<Integer> _colors;

Enemy[] circles;
Circle home;
Trail trail;
Trail trail2;
Trail trail3;
Trail trail4;

ArrayList<Trail> trails = new ArrayList();

//Maxim maxim;



void setup(){
  frameRate(60);
  size(800, 800);
  background(0);
  
  // The Sounds
  //maxim = new Maxim(this);
  
  
  
  radius = 20;
  float x, y;
  color colour;
  color powerupColour = #2A9617;
  color slowDownColour = #53B5E2;
  String id;
  
  RADI = width;
  total = 50;
  circles = new Enemy[500];
  
  _colors = new ArrayList();
  _colors.add(#FA0000);
  _colors.add(#C80000);
  _colors.add(#960000);
  _colors.add(#E21717);
  
  
  // Enemy creation
  for (int i = 0; i < total; i = i+1) {
    int randomAngle = int(random(360));
    int distancia = int(RADI + random(RADI * 10));
    x = (width / 2) + distancia*cos(radians(randomAngle));
    y = (height / 2) + distancia*sin(radians(randomAngle));
    int rnd = int(random(_colors.size()));
    
    float powerRnd = random(100); 
    
    if(powerRnd > 0 && powerRnd < 10 ){
       // Not an enemy, power up!
      colour = powerupColour; 
      id = Constants.POWER_UP;
    }else if(powerRnd >= 10 && powerRnd < 20 ){
      colour = slowDownColour; 
      id = Constants.SLOW_DOWN;
    }else{
      // Another enemy
      colour = _colors.get(rnd);
      id = Constants.ENEMY;
    }
    
    
    Enemy c = new Enemy(id, x, y, colour, radius, randomAngle, distancia);
    circles[i] = c;
    c.setAlpha(255);
    c.draw(); 
  }
  
  home = new Circle(width / 2, height / 2, #FFFF00, 100);
  home.draw();
  
  // Trail creation
  trail = new Trail(home, Constants.PLAYER);  
  trail2 = new Trail(home, Constants.RIGHT_REFLEX);
  trail3 = new Trail(home, Constants.UP_REFLEX);
  trail4 = new Trail(home, Constants.DOWN_REFLEX);
  
  trails.add(trail);
  trails.add(trail2);
  trails.add(trail3);
  trails.add(trail4);
  
  
  //
  
  
}

void draw(){
  
  noCursor();
  background(0);
 
 // punctuation distances
  
  // outter most
  noFill();
  stroke(#FCFFDF, 40);
  arc(width/2, height/2, 800, 800, 0, PI * 2);
  arc(width/2, height/2, 500, 500, 0, PI * 2);
  arc(width/2, height/2, 200, 200, 0, PI * 2);
   
  
  float xm = mouseX;
  float ym = mouseY;
  int newRadius;
  
  // CHECK FOR SLOW DOWN POWER-UP
  if(isSlowingDown){
      slowdownCurr++;
      if(slowdownCurr >= slowdownMax){
         isSlowingDown = false; 
      }
  }
  
  // Home
  home.draw();
  
  // Trails!
  int totalTrails = trails.size();
  float trailX = 0;
  float trailY = 0;
  int t;
  for (t = 0; t < totalTrails; t = t+1) {
      Trail currentTrail = trails.get(t);
      String trailID = currentTrail.id;
      
      if(trailID == Constants.PLAYER){
          trailX = xm;
          trailY = ym;  
      }else if(trailID == Constants.RIGHT_REFLEX){
          trailX = width/2+((width/2)-xm);
          trailY = height/2 +((height/2)-ym);
      }else if(trailID == Constants.UP_REFLEX){
          trailX = width/2+((width/2)-xm);
          trailY = ym;
      }else if(trailID == Constants.DOWN_REFLEX){
          trailX = xm;
          trailY = height/2+((height/2)-ym); 
      }
      currentTrail.update(trailX, trailY);
      currentTrail.draw();

  }
  
  
  // Enemies
  for (int i = 0; i < total; i = i+1) {
    Enemy c = circles[i];
    
    float distToCenter = dist(c.x, c.y, width/ 2, height / 2);
    
    // Distance to the center 
    if(distToCenter < home.radius * .5 + c.radius * .5  && !c.isDead()){
       c.kill();
       newRadius = int(home.radius - 3);
       home.update(newRadius);
       home.setAlpha(50);
    }
    
    
    if(!c.isDead()){
      boolean enemyHit = false;
      
      // Check collision to any of the trails
      for (t = 0; t < totalTrails; t = t+1) {
          Trail currentTrail = trails.get(t);
          float distToTrail = dist(c.x, c.y, currentTrail.x(), currentTrail.y());
          if( distToTrail < trail.radius * .5 ){
             enemyHit = true; 
             hitDistance = dist(c.x, c.y, currentTrail.x(), currentTrail.y());
          }          
      }
      
      // Check the hit type
      if(enemyHit){
         if(c.id == Constants.POWER_UP){
           trail.powerUp();  
         }else if(c.id == Constants.SLOW_DOWN){
             doSlowDown(); 
         }else{
            c.crashSound();       
         }
         
         c.explode();
         int amountEarned = 0;
         //println("dist :" + distToCenter);
         if(distToCenter > 260){
             amountEarned = 1000;
         }else{
             amountEarned = 1; 
         }
         punctuation+=amountEarned;
      }
      
    }
    
      
    c.update(isSlowingDown);
    c.draw();
  }
  
  
  // Update the home radius
  newRadius = int(home.radius + .01);
  home.update(newRadius);
  home.setAlpha(home.getAlpha()+1);
  
  // Punctuation
  fill(#C8F5B1, 255);
  text("punctuation: " + punctuation, 10, 30);
  
  
  
  
  
}

void doSlowDown(){
  slowdownCurr = 0;
  isSlowingDown = true;
}  


class Circle {
  
   public float dist, x, y;
   public int radius;
   protected color colour;
   protected float alpha;
   
   
   Circle(float _x, float _y, color _colour, int _radius){
      x = _x;
      y = _y;
      colour = _colour;
      radius = _radius;
      alpha = 100;
   }
   
   public void update(int _dist){
      radius = _dist;
   }
   
   
   public void decreaseAlphaBy(float qty){
     //println("decreaseAlpha: " + qty);
      alpha -= qty;
      
      /*
      if(alpha < 0) alpha = 0;
      if(alpha > 255) alpha = 255;
      */
   }
   
   public float getAlpha(){
      return alpha; 
   }
   
   public void setAlpha(float _alpha){
      if(_alpha >= 0 && _alpha <= 255){
        alpha = _alpha;  
      }
       
   }
   
  
   public void draw(){
     noStroke();
     fill(colour, alpha);
     ellipse(x, y, radius, radius);
   } 
   
   public void updateColor(int _colour){
     colour = _colour;
   }
}
static class Constants{
    public static String POWER_UP = "powerUp";
    public static String SLOW_DOWN = "slowDown";
    public static String ENEMY = "enemy";
    public static String PLAYER = "player";
    public static String RIGHT_REFLEX = "rightReflex";
    public static String UP_REFLEX = "upReflex";
    public static String DOWN_REFLEX = "downReflex";
     
}
class Enemy extends Circle{
  
   
   private float vel;
   private boolean dead;
   private boolean exploding;
   private ArrayList<Integer> explosionAngles = new ArrayList();
   private ArrayList<Circle> explosionTrails = new ArrayList();
   private ArrayList<Point> explosionPositions = new ArrayList();
   private int totalExplosionTrails = 10;
   private int explodingRadius = 3;
   private int explosionDuration = 200;
   private int currentTimeExplosion = 0;
   private int currentExplosionDist = 2;
   private int explosionSpeed = 4;
   private int explosionInc = 1;
   
   private float angle;
   private float dist;
   private color colorOriginal;
   
   public String id;
   //AudioPlayer crashSound;
   
   Enemy(String _id, float _x, float _y, color _colour, int _radius, int _angle, int _distancia){
       super(_x, _y, _colour, _radius);
       
       float rnd = 3 + random(1);
       id = _id; 
       vel = rnd;
       dist = _distancia;
       
       angle = _angle;
       colorOriginal = _colour;
       
       /*
       crashSound = maxim.loadFile("explosion.wav");
       crashSound.setLooping(false);
        */
       
       dead = false;
       exploding = false;
    }
    
    public void update(boolean isSlowingDown){
        
        if(exploding){
            
            for (int i = 0; i < totalExplosionTrails; i = i+1) {
              int angle = explosionAngles.get(i);
              float expX = x + currentExplosionDist*cos(radians(angle));
              float expY = y + currentExplosionDist*sin(radians(angle)); 
              
              Circle c = explosionTrails.get(i);
              Point p = explosionPositions.get(i);
              
              p.x = expX;
              p.y = expY;
              
              float currentAlpha = c.getAlpha();
              currentAlpha -= 7;
              c.setAlpha(currentAlpha);
              //c.draw();
            }
            
            currentTimeExplosion += explosionSpeed;
            currentExplosionDist += explosionInc;
            
            if(currentTimeExplosion >= explosionDuration){
                // End of the explosion, get back to normal enemy behavior
                reset();
            }
            
        }else{
           float modifier = 1;
          if(isSlowingDown){
             modifier = .25; 
          }
          
          //println("modifier: " + modifier);
          
          dist -= vel * modifier;
        
          x = int((width / 2) + dist*cos(radians(angle)));
          y = int((height / 2) + dist*sin(radians(angle)));
          
          if(dead && dist > RADI){
            dead = false;
            vel *= -1;
            
          }  
        }
    }
    
    private void reset(){
        clearLists();  
        exploding = false;
        dead = false; 
        dist = int(width + random(width * 10));
        angle = random(360);
        currentExplosionDist = 0;
        x = (width / 2) + dist*cos(radians(angle));
        y = (height / 2) + dist*sin(radians(angle));
         
    }
    
    public void draw(){
      if(exploding){
           
          for (int i = 0; i < totalExplosionTrails; i = i+1) {
            Circle c = explosionTrails.get(i);
            Point p = explosionPositions.get(i);
           // if(i == 0) println("alpha : " + c.getAlpha());
            noStroke();
            fill(colorOriginal, c.getAlpha());
            ellipse(p.x, p.y, explodingRadius, explodingRadius);
            
          }
      }else{
         super.draw(); 
      }
    }
    
    private void clearLists(){
      for (int i = 0; i < totalExplosionTrails; i = i+1) {
          explosionAngles.remove(0);
          explosionTrails.remove(0);
          explosionPositions.remove(0);
      }
    }
    
    public void explode(){
        exploding = true;
        dead = true;
        
        for (int i = 0; i < totalExplosionTrails; i = i+1) {
          explosionAngles.add(int(random(360)));
          Circle c = new Circle(x, y, colorOriginal, 10);
          c.setAlpha(255);
          explosionTrails.add(c);
          explosionPositions.add(new Point(x, y));
        }
        
        currentTimeExplosion = 0;
        currentExplosionDist = 0;
    }
    
    public boolean isDead(){
       return dead; 
    }
    
    public void kill(){
      dist = int(width + random(width * 10));
    }
    
    public void reflect(){
      updateColor(#FF3300);
      vel *= -1;
      dead = true;
    }
    
    public void crashSound(){
       //crashSound.play(); 
    }
}
class Point {
  public float x,y;
  
  Point(float _x, float _y){
     x = _x;
     y = _y; 
  }
    
}
class Trail {
  
   private ArrayList<Point> positions = new ArrayList();
   private int len = 60;
   private Circle cabeza;
   private float trailX, trailY;
   private float vel = 10;
   private color colour = #FFF540;
   public int radius = 30;
   public String id;
   private Circle home;
   private boolean isPowerUp = false;
   private int powerUpMaxTime = 200;
   private int powerUpCounter = 0;
   
   Trail(Circle _home, String _id){
      for (int i = 0; i < len; i = i+1) {
        positions.add(new Point(mouseX, mouseY));
        //positions[i] = new Point(random(width), random(height));
      }
      
      id = _id;
      
      trailX = mouseX;
      trailY = mouseY;
      home = _home;  
      
      cabeza = new Circle(mouseX, mouseY, colour, radius);
   } 
   
   public void update(float _mouseX, float _mouseY){
      positions.remove(0);     
      
      trailX = ((trailX*vel) + _mouseX)/(vel+1);
      trailY = ((trailY*vel) + _mouseY)/(vel+1);
      
      // Avoid intersect home
      
      float distToHome = dist(trailX, trailY, home.x, home.y);
      float minDistance = home.radius * .5 + radius * .5; 
      
      //println("distToHome: " + distToHome + " minDistance: " + minDistance);
      
      if(distToHome < minDistance){
        
        float angle = atan2(trailY-height/2, trailX-width/2);
        //println("angle: " + angle);
         trailX = width/2 + minDistance*cos(angle);
         trailY = height/2 + minDistance*sin(angle);  
      }
         
      positions.add(new Point(trailX, trailY));
      
      if(isPowerUp){
         powerUpCounter += 1;
        
         if(powerUpCounter >= powerUpMaxTime){
            isPowerUp = false; 
            radius = 30;
            cabeza.update(radius);
         }
      }
   }
   
   public void draw(){
     for (int i = 1; i < len; i = i+1) {
         Point currentPoint = positions.get(i);
         Point prevPoint = positions.get(i-1);
         
         float alpha = map(i, 0, len, 0, 255);
         int lineColour = colour;// + 10*i;
         stroke(lineColour, alpha);
         strokeWeight(2);
         line(prevPoint.x, prevPoint.y, currentPoint.x, currentPoint.y);
     }
     
     
     // La cabeza
     cabeza.x = trailX;
     cabeza.y = trailY;
     cabeza.draw();
   }
   
   public void powerUp(){
     radius = 60;
     isPowerUp = true;
     powerUpCounter = 0;
     cabeza.update(radius);
   }
   
   public float x(){
     return trailX;
   }
   
   public float y(){
     return trailY;
   }
}

