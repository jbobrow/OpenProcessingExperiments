
// Circle of Squares illusion
// by Jonathan Bobrow

// Really liked this optical illusion I saw the other day, 
// so I thought I would recreate it and allow myself to understand 
// the sweetspot of the illusion, as well as see what other kinds 
// of illusions could arrise from changing parameters.  

// Please explore and change the number of rings, density of squares, colors...

// NOTE: the illusion is not an original creation, but this code is 100% from my finger tips
//       in interest of learning more about illusions and in search of more! "question everything" 

// Inspiration http://blogs.discovermagazine.com/badastronomy/2009/08/18/square-circle-spiral/
//
// maybe this is next on the list:
// http://blog.ted.com/2009/06/25/amazing_illusio/

ArrayList circles;
int numRings = 4;

boolean bAnimate = false;

int increment = 0;

void setup(){
  size(400,400);
  smooth();
  
  circles = new ArrayList();
  
  // create n rings of squares
  for(int i=0; i<numRings; i++){
    Circle c = new Circle(55 + 40*i, 18 + 14*i);    // replicates radius and square num of original
    c.setPosition(width/2,height/2);
    circles.add( c );
  }
}

void draw(){
  background(125);
    
  if(bAnimate)            // in case you want to see the circles rotate, it adds another layer
    rotateCircles();
  
  for(int i=0; i<circles.size(); i++){
    Circle c = (Circle) circles.get(i);
    int direction = i%2==0 ? -1 : 1;
    c.rotateSquares(direction*PI*mouseX/width);
    c.display();
  }
  
  // some instructions to help yall
  fill(175);
  text("press spacebar to animate", 20, 390);
  noStroke();
  ellipse(167,10,8,8);
  text("place cursor here for original illusion", 175, 14 );
}

void rotateCircles(){
  
  increment++;
  
  for(int i=0; i<circles.size(); i++){
    Circle c = (Circle) circles.get(i);
    int direction = i%2==0 ? -1 : 1;
    c.setRotation(direction*PI*increment/1000.f);
  }
}

void keyPressed(){
  if( key == ' ' ){
    bAnimate = !bAnimate;
  }
}

//-------------------------------------------------------------------------------------
// create circles with properties such as radius, position, rotation
class Circle{
  
 ArrayList squares;
 vec2D position;
 float rotation = 0.f;
  
 Circle(int radius){
   
   squares = new ArrayList();
   position = new vec2D();
   
   int numSquares = (int)(radius * 5/16.f);
   
   for(int i=0; i<numSquares; i++){
     Square s = new Square();
     float angle = TWO_PI*i/(float)numSquares;
     s.setPosition( radius*cos(angle), radius*sin(angle));
     s.setColor(i%2==0 ? 0 : 255 );
     //s.setRotation(angle);
     squares.add( s );
   }
 } 
  
  
 Circle(int radius, int numSquares){
   
   squares = new ArrayList();
   position = new vec2D();
   
   for(int i=0; i<numSquares; i++){
     Square s = new Square();
     float angle = TWO_PI*i/(float)numSquares;
     s.setPosition( radius*cos(angle), radius*sin(angle));
     s.setColor(i%2==0 ? 0 : 255 );
     squares.add( s );
   }
 }
 
 void setPosition(float _x, float _y){
   position.x = _x;
   position.y = _y;
 }
 
 void setRotation(float a){
   rotation = a;
 }
 
 void rotateSquares(float a){
   for(int i=0; i<squares.size(); i++){
     Square s = (Square) squares.get(i);
     float angle = TWO_PI*i/(float)squares.size();
     s.rotation = a + angle; 
   }
 }
 
 void update(){
 }
 
 void display(){
   
   pushMatrix();
     translate(position.x, position.y);
     rotate(rotation);
     for(int i=0; i<squares.size(); i++){
       Square s = (Square) squares.get(i);
       s.display();
     }
   popMatrix();
 }
  
}

//-------------------------------------------------------------------------------------
// create squares with properties such as size, position, rotation, and colour
class Square{
 
  float side;
  vec2D position;
  float rotation;
  color colour;
  
 Square(){
   side = 10.f;
   position = new vec2D();
   colour = color(255,255,255);
   rotation = 0.f;
 }

 Square(float s){
   side = s;
   position = new vec2D();
   colour = color(255,255,255);
   rotation = 0.f;
 }
 
 void setPosition(float _x, float _y){
   position.x = _x;
   position.y = _y;
 }
 
 void setColor(int v){
   colour = color(v,v,v);  // kind of looks like a nest of baby owls :)
 }
 
 void setColor(int r, int g, int b){
   colour = color(r,g,b);
 }
 
 void setRotation(float a){
   rotation = a;
 }
 
 void update(){
 }
 
 void display(){
   pushMatrix();
     stroke(colour);
     strokeWeight(2);
     noFill();
     translate(position.x, position.y);
     rotate(rotation);
     rect(-side/2.f, -side/2.f, side, side); 
   popMatrix();
 }
  
}

//-------------------------------------------------------------------------------------
// keeps things like position a little more organized
class vec2D{
  float x = 0.f;
  float y = 0.f;
  
  vec2D(){
  }
  
  vec2D(float _x, float _y){
    this.x = _x;
    this.y = _y;
  }
}
