

class bubble{ //creates custom class called 'bubble'
  PVector pos; //the bubbles position
  PVector vel; //velocity, described as change in position per frame
  color c; //colour
  float s; //size
  
  bubble( PVector  _pos, color _c, float _s){ //the function that will make the new object.
    pos = _pos;
    c = _c;
    s = _s;
    vel = new PVector(0,random(-4,-3)); //sets the direstion and speed of the bubbles, bubbles rise directly upward with a slight variation in speed
 }
 
   void run() { // master function 
    render(); // draws the bubble
    move(); //describes the movement
    }
 
 void render(){ //created the bubble
 fill (c); //fill the bubble with colour "c"
 ellipse (pos.x, pos.y, s, s); //makes the bubble size "s" and position "pos"
 }
 
 void move(){
   pos.add(vel); //adds direction and velocity to the position

 }
 
 
}

