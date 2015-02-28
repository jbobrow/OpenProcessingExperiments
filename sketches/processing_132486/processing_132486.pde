
                                  /*                                         */
                                Heart                                    myHeart ;
                            void setup() {                            size(600, 600) ;
                       myHeart = new Heart(new                     PVector(100, 100), 2) ;
                    }void draw(){background(#000000);        myHeart.display();if(absent(myHeart)){
                 myHeart.growFonder(new PVector(mouseX,   mouseY));}else{myHeart.growColder(new PVector(
             mouseX, mouseY)); /*We only want what we can't have*/}}boolean absent(Heart toCheck){if(!toCheck.
         containsPoint(new PVector(mouseX, mouseY))){return true;}else{return false;}}class Heart{PVector center;
     float fondness;public Heart() {this.center = new PVector(0, 0);this.fondness = 1;}public Heart(PVector newCenter, 
  int newFondness) {this.center = newCenter;this.fondness = newFondness;}PVector getCenter() { return this.center;} float 
getFondness() {return this.fondness;} boolean containsPoint(PVector toCheck) {float radius = this.getFondness()*5;float x = 
 abs(this.getCenter().x - toCheck.x);float y = toCheck.y - this.getCenter().y;if ((x >= 0 && x <= 10*this.getFondness()) && 
    (y >= 0 && y <= ((-1.5*x)+15*this.getFondness()))) { return true;}if (y <= 0 && (pow(x-radius, 2) + pow(y, 2)) <= 
       pow(radius, 2)) {return true;}return false;}void growFonder(PVector location) {this.fondness = this.fondness 
         + .1; float diffX = .05 * (location.x - this.getCenter().x);float diffY = .05 * (location.y - this.
           getCenter().y);this.center.x += diffX;this.center.y += diffY;}void growColder(PVector location)
             { this.fondness = this.fondness - 1;if (this.getFondness() >= 2) { this.fondness = 2; }  }
                 void display()  {  pushMatrix();  translate(this.getCenter().x, this.getCenter().y);
                    fill(#FF0099); noStroke(); arc(0-(5*this.fondness), 0, 10*this.getFondness(), 
                         10*this.getFondness(), PI, 2*PI, OPEN); arc(5*this.getFondness(), 0, 
                             10*this.getFondness(), 10*this.getFondness(), PI, 2*PI, OPEN);
                                  triangle( 0 - ( 10*this.getFondness()), 0, 10 * this.
                                     getFondness(), 0, 0, 15 * this.getFondness() ); /*
                                       \\\\\\\\\\  */ popMatrix();}} /*   ////////
                                          \\\\\\\\\\\\\\\\////////////////////
                                              \\\\\\\\\\\\\/////////////////
                                                  \\\\\\\\\/////////////
                                                       \\\\/////
                                                          */



