

Thing[] thing;

void setup(){
  size (600,600);
  smooth();
  thing = new Thing[200]; 
  for(int i = 0; i < thing.length; i++){
    thing[i] = new Thing(random(width),random(height),10,random(.08));
  background(50);
  }
}

void draw(){
  background(25);
for(int i = 0; i <thing.length; i++){
  thing[i].display();
  thing[i].move();
  thing[i].collisions();
 }
}

// class 1
class Thing {
float id;
float x,y;
float angle = 0; // Current angle
float speed = .05; // Speed
float radius = 39; // Range of motion
 
int trailNum = 20; //keep track of last 20 spots
int prevx[];
int prevy[]; //declare arrays
 
 
//constructor
Thing (float _x, float _y, float _angle, float _speed){
x = _x;
y = _y;
angle = _angle;
speed = _speed;

//prevx = new int[trailNum]; //make new array with trailNum spots (20)
//prevy = new int[trailNum];
}
 
//methods

void move(){
 x -= angle;
 y -= speed;
 
 if(x> width || x <0){
   angle = -angle;
 }
 
 if (y >height || y < 0){
   speed = -speed;
   }
}
 

void display(){
  //p 291
  if ((x >0 && x<600) && (y>0 && y<600)){
angle += 1*speed; // Update the angle
float x2 = y;
float y2 = y;
float sinval = sin(angle);
float cosval = cos(angle);
float x =  x2+(cosval * 200);
float y =  y2+(sinval * 600);
fill(234,random(15),random(35),100);
strokeWeight(1.5);
stroke(200);
ellipse(x, y, 30, 29);
     }
  }
  
  void collisions(){
    if(dist(x,y,40,20)<500){
     stroke(random(255),random(255),random(255),100);
       line(x,y,0,0);
      // fill(40,40,40,40);
       //ellipse(y,x,40,40);
        }
      }
    }




