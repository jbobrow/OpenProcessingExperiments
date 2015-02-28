
/* 
 * perlin box scrpit
 * main class that generates an array of points, it then generates 
 * a bunch of perlin noise waves that form geometric boxes.
 *
*/

int count = 23; //number of particle spawns
Pointz[] pointers;
float xtime = 0.0; //seperate values to create variety between noise fields
float ytime = 100.0;
float increment = .0005;

void setup(){
  size(1200, 750);
  background(255);
  smooth();
   pointers = new Pointz[count]; //array of pointer class
   frameRate(60);
  
  for(int y = 0; y < count; y++){ //initializes the array with objects for the count number
   
  pointers[y] = new Pointz(noise(xtime)*width, noise(ytime)*height, 1.0, 1.0);
  xtime += increment;
  ytime += increment;
  }
}

void draw(){
  for(int i = 0; i < count; i++){
  pointers[i].update();
  pointers[i].draw();
  }
}

/* 
 * this is a class that generates a point series for drawing
 *
*/ 
class Pointz{
  //list of variables
  float x, y, h, w;
  float xdir = 100.0;
  float ydir = 0.0;
  int age = 0;
  float increment = 0.000002; //play with these 
  float increment2 = 0.001;
  
  //constructor
  Pointz(float posX, float posY, float sizeH, float sizeW) {
    x = posX;
    y = posY;
    h = sizeH;
    w = sizeW;
  }
  
  //updates varoooblies, because it's funny to call then varooblies
  void update(){
     if(age <= 8750){
    //update pos
    x += increment2;
    y += increment2;
    // update object size
   
      h -= increment;
      w -= increment;
      age++;
     }
     if(age == 8750){ //kills the particle
     h = 0;
     w = 0;
  }
  }
  
  //draw
  void draw(){   
    fill(0, 20);
    noStroke();
    ellipse(noise(x)*width, noise(y)*height, h, w);
  }
}

