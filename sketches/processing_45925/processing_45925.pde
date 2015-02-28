
//ideally color will change at ra

The[] the;

void setup(){
  size (600,600);
  smooth();
  the = new The[100]; //gives the array 100 spaces
  for(int i = 0; i < the.length; i++){
    the[i] = new The(random(width),random(height),1,1);
  background(50);
  }
}

void draw(){
  background(50);
for(int i = 0; i <the.length; i++){
  the[i].display();
  the[i].move();
  the[i].collisions();
 }
}

// class The
class The {
float x,y;
float directionx, directiony;
float id;
 
//constructor
The (float _x, float _y, float _directionx, float _directiony){
x = _x;
y = _y;
directionx = _directionx;
directiony = _directiony;
}
 
//methods

void move(){
 x += directionx;
 y += directiony;
 
 if(x> width || x <0){
   directionx = -directionx;
 }
 
 if (y >height || y < 0){
   directiony = -directiony;
   }
}
 

void display(){
//fill(400,55,99,100);
stroke(255);
 ellipse(x,y,60,60);
 }
 
 
void collisions(){
  for(int i = 0; i < the.length; i++){
   if (id != i){
    if(dist(x,y,the[i].x,the[i].y)<60){
     fill(random(0,255),random(255),random(255),100);
  }
 }
  }
}
}
 

