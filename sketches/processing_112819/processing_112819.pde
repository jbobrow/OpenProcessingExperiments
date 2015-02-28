
PImage car1;
PImage car2;

void setup() {
  car1 = loadImage( "car1.png" );
  car2 = loadImage("car2.png");
  
  size(600,540);
frameRate(random(5));
imageMode(CENTER);

}
void draw(){
  background(248);

 float x= random (width/2);
  float y= random (height/2);
  float c= random (width/2);
  float d = random (height/2);
  
   stroke(0);
   strokeWeight(2);
   noFill();
    rect(x,y, 300,100);
   rect(x+100,y,400,400);
   rect(x,y, 300,300);
   
  image(car2,c+300,d+50);
   image(car1, c+50, d+200);
   
  }


