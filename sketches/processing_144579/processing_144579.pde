
int x=0;//where does the center of the circle start?
int speed =2;//how fast does the circle move?
 
void setup() {  //setup function called initially, only once
  size(250, 250);//how big is the screen?
  
}
 
void draw() {  //draw function loops
  float r =random(10,30);// I want the radius of the circle to be random.
   
  background(0);// black background
    ellipse(x,height/2,r,r);// circle starts at 0, is middle of height with random radius.
  x=x+speed;// circle moves forward at determined speed.
  if (x>width || x<0)// if the circle reaches either end
  speed= speed*-1;}// reverse it.
