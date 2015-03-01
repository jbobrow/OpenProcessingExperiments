
PImage sphere;
int radius =40;
float x = -radius;



  void setup(){
  size(900,600);
  imageMode(CENTER);
 sphere =loadImage("Metal_Sphere 2 copy.png");
  smooth();
  frameRate(30);
  ellipseMode (RADIUS);
  background(0);


  }
void draw(){
  float speed = mouseX/50+1;
fill(0,15);
rect(0,0,width,height);

for (int y=75/2; y<height+45; y+=75) {

//for( int x=75/2; x<width+45; x+=75) {
  x+=speed;
  if(x>width+75){
    x=-75;
  }
tint(mouseY/2.35,175,230);
 image(sphere,x,y);
   
}
}





  





