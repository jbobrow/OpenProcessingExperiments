
import netscape.javascript.*;  

/*  
 
 Used codes from:  
 
 DrivingCirclesDemo by Michael Ferraro, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.  
 
 Work: http://openprocessing.org/visuals/?visualID=28570  
 
 License:  
 
 http://creativecommons.org/licenses/by-sa/3.0/  
 
 http://creativecommons.org/licenses/GPL/2.0/  
 
 Also from:  
 
 http://processing.org/discourse/yabb2/YaBB.pl?num=1276644884/4  
 
 */



final int MOVE_DIS = 1;  

Snake S1;  

boolean gameOver = false;  

boolean gameStart = false;  

boolean up = false;  

boolean down = false;  

boolean left = false;  

boolean right = false;  

boolean ini = true;  

ArrayList<RoadBorder> roads;  

PVector tmpLoc;  

ArrayList<PVector> apples;  

PVector apple;  

int plus;  

int score;  

boolean re = true;

void reset() {
  S1 = new Snake(width/2, height/2, color(255));  

  roads = new ArrayList<RoadBorder>();  

  initRoads(roads);  

  apples = new ArrayList<PVector>();

  plus = 0;
  score = 0;
}


void setup() {  

  size(400, 400);  

  S1 = new Snake(width/2, height/2, color(255));  

  roads = new ArrayList<RoadBorder>();  

  initRoads(roads);  

  apples = new ArrayList<PVector>();
}  





void makeApple() {  

  apple = new PVector(random(20, width-20), random(20, height-20));  

  apples.add(apple);
}  



void drawApple(PVector p) {  

  fill(color(0, 255, 0));  

  ellipse(p.x, p.y, 20, 20);
}  



void draw() {  

  if (gameStart == false) {  

    background(0);  

    fill(255);  

    text("As the snake eats more and more apples,", width/5, 2*height/7);  

    text("he moves faster and faster.", width/5, 3*height/7);  

    text("Total score is how many apple he eats.", width/5, 4*height/7);  

    text("press ENTER to start the game", width/5, 4*height/5);
  } 
  else if (gameStart == true && gameOver == false) {  

    background(0);  

    S1.render();  

    auto();
    

    for ( RoadBorder border : roads ) {  

      border.render();
    }  



    for (PVector a: apples) {  

      drawApple(a);
    }  



    if (apples.size()==0) {  

      makeApple();
    }  



    for (int i = 0 ; i < apples.size() ; i++) {  

      if (S1.getLoc().dist(apples.get(i)) < 20) {  

        plus++;  

        score++;  

        apples.remove(i);
      }
    }
  }
  else if (gameOver == true) {  

    background(255);  

    fill(25);  

    text("Game Over", width/2, width/3);  
    
    text("press 'r' to restart the game " ,  width/2, (height/2));  

    text("Score: " + score, width/2, 2*(height/3));  

    re= false;
  }
}



void auto() {  

  PVector moveV = new PVector(0, 0);  

  if (ini) {  

    moveV.y = -MOVE_DIS - plus;
  }  

  if (up) {  

    moveV.y = -MOVE_DIS - plus;
  }  

  if (down) {  

    moveV.y = MOVE_DIS + plus;
  }  

  if (right) {  

    moveV.x = MOVE_DIS + plus;
  }  

  if (left) {  

    moveV.x = -MOVE_DIS - plus;
  }  

  S1.move( moveV );
}  





void keyPressed() {  

  if (key == ENTER) {  

    gameStart=true;
  } 
  
  if (gameOver==true){
    if (key == 'r') {
      gameStart = true;
      gameOver = false;
      reset();
    }
  }

  PVector moveV = new PVector(0, 0);  

  switch (keyCode) {  

  case UP:  

    ini = false;
    up = true;
    down = false;
    left = false;
    right = false;  

    break;  

  case DOWN:  

    ini = false;
    up = false;
    down = true;
    left = false;
    right = false;  

    break;  

  case LEFT:  

    ini = false;
    up = false;
    down = false;
    left = true;
    right = false;  

    break;  

  case RIGHT:  

    ini = false;
    up = false;
    down = false;
    left = false;
    right = true;  

    break;
  }
}  



class Snake {  

  color c;  

  PVector loc;  

  Snake(float tempX, float tempY, color col) {  

    c = col;  

    loc = new PVector(tempX, tempY);
  }  

  void render() {  

      fill(c);  

      rectMode(CENTER);  

      rect(loc.x, loc.y, 20, 20);
    
  }   

  void move(PVector moveV) {  

    loc.add(moveV);  

    if ( isCollision() ) {
      println("helloafhajkfhjasfasjfsjkafhlfjkasfhas");  
      gameOver = true;
    }
  }  

  /*float getX(){  
   
   tmpLoc = loc;  
   
   return tmpLoc.x;  
   
   }  
   
   float getY(){  
   
   tmpLoc = loc;  
   
   return tmpLoc.y;  
   
   }*/

  PVector getLoc() {  

    tmpLoc = loc;  

    return loc;
  }  



  /*  
   
   DrivingCirclesDemo by Michael Ferraro, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.  
   
   Work: http://openprocessing.org/visuals/?visualID=28570  
   
   License:  
   
   http://creativecommons.org/licenses/by-sa/3.0/  
   
   http://creativecommons.org/licenses/GPL/2.0/  
   
   */

  public boolean isCollision() {  

    //go through each RoadBorder in roads to see if the circle's distance from the  

    //line segment is less than or equal to radius; if so, there's a collision  

      //  

    //possible ways to strike:    

    //* circle tangent to line somewhere between endpts  

    //* circle touches either endpt  

    for ( RoadBorder seg : roads ) {  

      PVector A = seg.ptA;  

      PVector B = seg.ptB;  

      if ( A.dist(loc) <= 10 ) return true;  

      if ( B.dist(loc) <= 10 ) return true;  

      //see if closest pt to circle is on segment and if   

      //dist too close  

        PVector distResult = getDistance(A.x, A.y, B.x, B.y, loc.x, loc.y);  

      PVector closest = new PVector( distResult.x, distResult.y );  

      float dist = distResult.z;  

      float lesserX = A.x, greaterX = B.x;  

      if ( A.x > B.x ) { 
        float tmp = lesserX; 
        lesserX = greaterX; 
        greaterX = tmp;
      }  

      float lesserY = A.y, greaterY = B.y;  

      if ( A.y > B.y ) { 
        float tmp = lesserY; 
        lesserY = greaterY; 
        greaterY = tmp;
      }  

      if ( closest.x >= lesserX && closest.x <= greaterX   

        && closest.y >= lesserY && closest.y <= greaterY ) {  

        //closest pt to circle is on the RoadSegment  

        if ( closest.dist(loc) <= 10 ) {   

          return true;
        }
      }
    } //no segments (RoadBorders) had a collision w/circle  

      return false;
  }
}  



class RoadBorder {  

  PVector ptA, ptB;  

  public RoadBorder(int x1, int y1, int x2, int y2) {  

    ptA = new PVector(x1, y1);  

    ptB = new PVector(x2, y2);
  }  

  public void render() {  

    stroke(255, 0, 0);  

    line(ptA.x, ptA.y, ptB.x, ptB.y);
  }
}  



void initRoads(ArrayList<RoadBorder> r) {  

  //edges of screen first  

  int a = 4;  

  r.add( new RoadBorder(a, a, width-a, a) );  

  r.add( new RoadBorder(width-a, a, width-a, height-a) );  

  r.add( new RoadBorder(a, height-a, width-a, height-a) );  

  r.add( new RoadBorder(a, a, a, height-a) );  

  //r.add( new RoadBorder(width/2 - 3*10, 3*10, width/2 - 3*10, height) );  

  //r.add( new RoadBorder(width/2 + 3*10, 0, width/2 + 3*10, height-3*10) );
}  



/**  
 
 * from http://processing.org/discourse/yabb2/YaBB.pl?num=1276644884/4  
 
 *  
 
 * Returns a point on the line (x1,y1) -> (x2,y2)   
 
 * that is closest to the point (x,y)  
 
 *   
 
 * The result is a PVector.   
 
 * result.x and result.y are points on the line.   
 
 * The result.z variable contains the distance from (x,y) to the line,   
 
 * just in case you need it :)   
 
 */

PVector getDistance( float x1, float y1, float x2, float y2, float x, float y ) {  

  PVector result = new PVector();   

  float dx = x2 - x1;   

  float dy = y2 - y1;   

  float d = sqrt( dx*dx + dy*dy );   

  float ca = dx/d; // cosine  

  float sa = dy/d; // sine   

  float mX = (-x1+x)*ca + (-y1+y)*sa;   

  if ( mX <= 0 ) {  

    result.x = x1;   

    result.y = y1;
  }  

  else if ( mX >= d ) {  

    result.x = x2;   

    result.y = y2;
  }  

  else {  

    result.x = x1 + mX*ca;   

    result.y = y1 + mX*sa;
  }  

  dx = x - result.x;   

  dy = y - result.y;   

  result.z = sqrt( dx*dx + dy*dy );   

  return result;
} 


