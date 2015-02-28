
PImage img;
ArrayList brains;
class brain{
  float x;
  float y;
  float object_x_speed;
  float object_y_speed;
void display(){
  imageMode(CENTER);
  image(img,x,y); 
  x+=object_x_speed;
  y+=object_y_speed;
  
  if(x+50 > width || x-50< 0) {
    object_x_speed*=-1;
  } 
  if(y+50 > height || y-50< 0) {
    object_y_speed*=-1;
  }
  if (20> dist(x,y,mouseX,mouseY)) {
    object_x_speed*=-1;
    object_y_speed*=-1;
  }
} 

brain(float tempx,float tempy, float tempobxspd,float tempobyspd){
  x= tempx;
  y= tempy;      
  object_x_speed= tempobxspd;
  object_y_speed= tempobyspd;

}}
  


void setup() {
  size(800,600);
  background(0);
  img = loadImage("img.png");
  noStroke();
  smooth();
  frameRate(30);
  brains = new ArrayList();  
}

void draw() {
  background(255);
  brains.add(new brain(width/2,height/2, random(-2,2),random(-2,2)));
   for(int i=0; i<brains.size(); i++){  
     ((brain)brains.get(i)).display();
   }
}

