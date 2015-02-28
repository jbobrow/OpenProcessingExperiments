
//drawing vars for AutoGrow
 int maxCells = 6000; // reaching max no of cells (circles) terminates growth
float startradius = random(25);
int alpha=100;
color red=int(random(10));
color green=int(random(75));
color blue =int(random(170));
float minRadius = .25; // reaching minRadius terminates growth
float maxRadius=40;
float pii = TWO_PI;

//AutoGrow Class
ArrayList AutoGrow = new ArrayList();

//SensorGrow Class
ArrayList SensorGrow = new ArrayList();


 
void setup(){
size(displayWidth, displayHeight, P2D);
  background(60);
  frameRate(10); // slow frame rate to better see growth steps (every frame each cell has an opportunity to grow)
  noStroke();
  smooth();
  
  
  AutoGrow AG = new AutoGrow(new PVector(width/2, height/3), null, startradius, pii, alpha, red, green, blue);
  SensorGrow SG = new SensorGrow(new PVector(mouseX,mouseY),null, startradius, pii,  alpha, red, green, blue);
 
}
 
 
void draw(){
    println(frameCount);
     
  //test loop for AutoGrow 
   for (int c=0; c<AutoGrow.size(); c++){
    AutoGrow AG = (AutoGrow) AutoGrow.get(c); // get each cell from the arraylist
    AG.render(); // draw the cell
    if (AutoGrow.size() < maxCells && AG.radius > minRadius){ // if the maximum number of cells has not been reached and if the cell is greater than the minimum radius
     AG.grow(); // give the cell the opportunity to grow
    }
    AG.die(); // run the die function
  }
 
  //test loop for SensorGrow 
   for (int c=0; c<SensorGrow.size(); c++){
    SensorGrow SG = (SensorGrow) SensorGrow.get(c); // get each cell from the arraylist
    SG.render(); // draw the cell
    if (SensorGrow.size() < maxCells && SG.radius > minRadius){ // if the maximum number of cells has not been reached and if the cell is greater than the minimum radius
     SG.grow(); // give the cell the opportunity to grow
    }
    SG.die(); // run the die function
 
  }
}
  

void mouseReleased(){ // if mouse clicked
 //this var changes the shape/direction of growAngle in grow()
 pii=random(TWO_PI, -PI);
 startradius=random(15);
     red = int(random(0, 255));
      green = int(random(0, 255));
      blue = int(random(0, 255));
  SensorGrow.clear(); // clear arraylist (delete all cells)
  SensorGrow SG = new SensorGrow(new PVector(mouseX,mouseY),null, startradius, pii,  alpha, red, green, blue); // make new start cell at mouse position
}

void keyPressed() {
  
  if (key == 's') {
saveFrame();
  }
} 


// -- -- -- AutoGrow cell Class
 
class AutoGrow{
 
 
 //drawing vars

  PVector pos; // vector for position
  float radius; // variable for radius
    int a;//variable for alpha
  color r, g, b; //variables for fill colors
  float age; // age counter
  int maxAge = 50; // variable to set age that die function resets cell
  
  //controls shape of growth in grow()
  //  float growAngle; // select angle for growth attempt (random angle between 0 and 360)
  float pi;
  
  
 

  
 
  AutoGrow parent; // parent
 
 
  // - - - Constructor
 
  AutoGrow(PVector _pos, AutoGrow _parent, float _radius, float _pi, int _a, color _r, color _g, color _b){ 
    // feed in reference for position, parent cell and radius and fill colors
     // feed in reference for position, parent cell and radius and fill colors
    pos = _pos;
    parent = _parent;
    radius = _radius;
    a=_a;
    r =_r;
    g=_g;
    b=_b;
    age = 0; // start age counter at 0
    pi = _pi;
    AutoGrow.add(this); // add cell to arraylist 
  }
 
 
  // - - - Render Function
 
  void render (){
 
    noStroke();
    fill(r+age*7, g+age*10, b+age*5,a); // change circle fill colour with cell age
    ellipse(pos.x,pos.y,radius*2,radius*2); // draw circle at cell position
 
    strokeWeight(radius*0.12); // change stroke weight relaive to radius
    stroke(0);
 a=a++;
  }
 
 
  // - - - Grow Function
 
  void grow(){
 
    float nextradius = radius*.95; // set radius of growth cell (related to radius of parent cell)
 
    for (int i=0; i<5; i++){ // attempt to grow 5 times
      boolean collide = false; // boolean switch for collisions
 
     float growAngle = random(pi); // select angle for growth attempt (random angle between 0 and 360)
      // determine position for growth cell (boundary touches boundary of parent cell)
      PVector growPos = new PVector( pos.x +  cos(growAngle)*(radius+nextradius), pos.y + sin(growAngle)*(radius+nextradius));
 
      // check all cells in arraylist for collisions
      for  (int c=0; c<AutoGrow.size(); c++){
        AutoGrow AG = (AutoGrow)  AutoGrow.get(c);
        if (AG != this  && growPos.dist(AG.pos) < radius+AG.radius) { // if boundary of growth cell overlaps boundary of an existing cell
          collide = true; // set boolean switch for collisions to true
          nextradius*= .95; // and set new radius for next attempt
        }
      }
      // if there are no collisions then grow
      if (! collide) { // if boolean switch is false
        AutoGrow newAutoGrow = new AutoGrow(growPos,this,  nextradius, pi, alpha, red, green, blue); // make new cell
        return; // return to call function (let next cell attempt to grow)
      }
    }
  }
 
 
 //Change color after each cluster
 
 void change(){
    red = int(random(0, 255));
      green = int(random(0, 255));
      blue = int(random(0, 255));
 }

  // - - - Die Function
 
    void die(){
     
 
    age=age+.07; // age cell
    
 
    // if a cell reaches maxAge then clear all cells and start new drawing
    if (age > maxAge){
 
      AutoGrow.clear(); // clear arraylist (delete all cells)
  
      for (int j=0; j<random(5); j++){ // make multiple new start cells
        boolean collide = false; // boolean switch for collisions
        
 
         PVector newPos = new PVector(width/2+(random(-500,500)),height/4+(random(-100,100))); // determine position for new start cell
        float newradius = startradius+random(15); // determine radius for new start cell
 
        // check other new start cells in arraylist for collisions
        for  (int c=0; c<AutoGrow.size(); c++){
          AutoGrow AG = (AutoGrow)  AutoGrow.get(c);
          if (AG != this  && newPos.dist(AG.pos) < newradius+AG.radius) { // if boundary of growth cell overlaps boundary of an existing cell
            collide = true; // set boolean switch for collisions to true
           
}
         
        }
        if (! collide) {  // if there are no collisions
          AutoGrow AG = new AutoGrow(newPos,null, newradius, pii, alpha, red, green, blue); // make new start cell
       AG.change();
     }
      }
    }
     
  }
 
}
// -- -- -- AutoGrow cell Class
 
class SensorGrow{
 
 
 //drawing vars

  PVector pos; // vector for position
  float radius; // variable for radius
    int a;//variable for alpha
  color r, g, b; //variables for fill colors
  float age; // age counter
  int maxAge = 50; // variable to set age that die function resets cell
  
  //controls shape of growth in grow()
  //  float growAngle; // select angle for growth attempt (random angle between 0 and 360)
  float pi;
  
  
 

  
 
  SensorGrow parent; // parent
 
 
  // - - - Constructor
 
  SensorGrow(PVector _pos, SensorGrow _parent, float _radius, float _pi, int _a, color _r, color _g, color _b){ 
    // feed in reference for position, parent cell and radius and fill colors
     // feed in reference for position, parent cell and radius and fill colors
    pos = _pos;
    parent = _parent;
    radius = _radius;
    a=_a;
    r =_r;
    g=_g;
    b=_b;
    age = 0; // start age counter at 0
    pi = _pi;
    SensorGrow.add(this); // add cell to arraylist 
  }
 
 
  // - - - Render Function
 
  void render (){
 
    noStroke();
    fill(r+age*7, g+age*10, b+age*5,a); // change circle fill colour with cell age
    ellipse(pos.x,pos.y,radius*2,radius*2); // draw circle at cell position
 
    strokeWeight(radius*0.12); // change stroke weight relaive to radius
    stroke(0);
 a=a++;
  }
 
 
  // - - - Grow Function
 
  void grow(){
 
    float nextradius = radius*.95; // set radius of growth cell (related to radius of parent cell)
    for (int i=0; i<5; i++){ // attempt to grow 5 times
      boolean collide = false; // boolean switch for collisions
     float growAngle = random(pi); // select angle for growth attempt (random angle between 0 and 360)
      // determine position for growth cell (boundary touches boundary of parent cell)
      PVector growPos = new PVector( pos.x +  cos(growAngle)*(radius+nextradius), pos.y + sin(growAngle)*(radius+nextradius));
 
      // check all cells in arraylist for collisions
      for  (int c=0; c<SensorGrow.size(); c++){
        SensorGrow SG = (SensorGrow)  SensorGrow.get(c);
        if (SG != this  && growPos.dist(SG.pos) < radius+SG.radius) { // if boundary of growth cell overlaps boundary of an existing cell
          collide = true; // set boolean switch for collisions to true
          nextradius*= .95; // and set new radius for next attempt
        }
      }
      // if there are no collisions then grow
      if (! collide) { // if boolean switch is false
        SensorGrow newSensorGrow = new SensorGrow(growPos,this,  nextradius, pi, alpha, red, green, blue); // make new cell
        return; // return to call function (let next cell attempt to grow)
      }
    }
  }
 
 
 //Change color after each cluster
 
 void change(){
    red = int(random(0, 255));
      green = int(random(0, 255));
      blue = int(random(0, 255));
 }

  // - - - Die Function
 
    void die(){
     
 
    age=age+.07; // age cell
    
    // if a cell reaches maxAge then clear all cells and start new drawing
    if (age > maxAge){
 
      SensorGrow.clear(); // clear arraylist (delete all cells)
  
      for (int j=0; j<random(5); j++){ // make multiple new start cells
        boolean collide = false; // boolean switch for collisions
        
 //need to change this to reflect the pos of each sensor - hard code?/DELETE "newPos"?
         PVector newPos = new PVector(width/2+(random(-500,500)),height/4+(random(-100,100))); // determine position for new start cell
        float newradius = startradius+random(15); // determine radius for new start cell
 
        // check other new start cells in arraylist for collisions
        for  (int c=0; c<SensorGrow.size(); c++){
          SensorGrow SG = (SensorGrow)  SensorGrow.get(c);
          if (SG != this  && newPos.dist(SG.pos) < newradius+SG.radius) { // if boundary of growth cell overlaps boundary of an existing cell
            collide = true; // set boolean switch for collisions to true
           
}
         
        }
        if (! collide) {  // if there are no collisions
          SensorGrow SG = new SensorGrow(newPos,null, newradius, pii, alpha, red, green, blue); // make new start cell
       SG.change();
     }
      }
    }
     
  }
 
}


