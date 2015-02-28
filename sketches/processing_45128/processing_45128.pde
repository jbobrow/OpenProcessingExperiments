
/* 403 Reddit Clouds
* Coded by: Rodrigo Amaya
* 
* I was inspired by "clouds" in the 403 reddit mantainance mode page, 
* so I tried to emulate the algorithm that generates the clouds, and
* here it is, enjoy!
*
*/

int PIXEL_SIZE = 25;

class Cloud{
  int top = 0;
  int left = 0;
  Puff[] puff = new Puff[100];
  
  Cloud(Puff[] _arr){
    puff = _arr;
  }
  
  void draw(){
    //println("drawing cloud");    
    for(int i = 0; i < puff.length; i++){
      puff[i].draw(top, left);
    }
  }
  
}

class Puff{
  int width = 15;
  int height = 15;
  color c = color(255, 255, 255, 127);
  int top = 0;
  int left = 0;
  
  Puff(int _top, int _left){
    top = _top;
    left = _left;
  }
  
  void draw(int _top, int _left){
    fill(c);
    rect(left + _left, top + _top, width, height);
  }    
}

Cloud[] clouds = new Cloud[0];

int randomInt(int mini, int maxi){
  float r = random(mini, maxi);
  return round(r);
}

float randomPosition(int maxi){
  return round(randomInt(-400, maxi) / PIXEL_SIZE) *  PIXEL_SIZE;
}

Puff[] makeCloud(){
  int w = 8;
  int h = 5;
  float maxr = sqrt(w*w+h*h);
  float density = 0.4;
  
  Puff[] arr = new Puff[0];
  int index = 0;

  for(int x = -w; x <= w; x++){
    for (int y= -h; y <= h; y++){
      float r = sqrt(x*x+y*y);
      if(r/maxr < pow(random(r/maxr), density)){
        int left = (x + w) * PIXEL_SIZE;
        int top = (y + h) * PIXEL_SIZE;
        Puff p = new Puff(top, left);
        arr = (Puff[])append(arr, p);
      }
    }
  }
  
  //println("puffs: " + arr.length);
  return arr;
}

void animateClouds(){
  //println("animating clouds");
  
  int speed = 25;
  addCloud(-1);
  
  Cloud[] nuevas = new Cloud[0];
  for(int i = 0; i < clouds.length; i++){
    Cloud cloud = clouds[i];
    cloud.left += speed;
    if(cloud.left > screen.width){
      cloud = null;
      clouds[i] = null;
    } else {
      nuevas = (Cloud[]) append(nuevas, cloud);
    }
  }
  
  clouds = nuevas;
  
  //println("finish animation clouds " + clouds.length);
}

void addCloud(int randomLeft){
  float cloudiness = 0.3;
  if(random(1) < cloudiness){
    int x = randomLeft > -1  ? (int)randomPosition(screen.width) : -400;
    Cloud cloud = new Cloud(makeCloud());
    cloud.top = (int)randomPosition(screen.height);
    cloud.left = x;
    //for testing
    //cloud.top = 100;
    //cloud.left = 200;
    clouds = (Cloud[])append(clouds, cloud);
    //println("added a cloud on " + cloud.top + ", " + cloud.left + " with " + cloud.puff.length + " puffs");
  }
}

void setup(){
  size(900, 640);
  
  noStroke();
  smooth();
      
  background(#083a7f);
  
  for (int n=0; n<50; n++) {
    addCloud(1);
    //println("clouds added");
  }
  
  frameRate(2);
}

void draw(){
  //println("drawing clouds " + clouds.length);
  animateClouds();
  
  background(#083a7f);
  
  for(int i = 0; i < clouds.length; i++){
    clouds[i].draw();
  }
}

