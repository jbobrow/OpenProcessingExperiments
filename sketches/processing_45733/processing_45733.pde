
/* Author: ASH
   Date: 5/19/11
   Title: Create a cirlce by pushing the create button in the center
   of the screen.
*/
  
int x = 150;
int y = 150;
int r = 5;//starting radius
int n = 8;//number of recurisions
int rs = 125;//random seed value
  
void setup() {
  background(0);
  size(300,300);
  noStroke();
  smooth();
  randomSeed(rs);
String s = "Click Me!!!!";
text(s, 125, 125, 140, 140);
}
  
void draw(){
drawCircle(x,y,r,n);
}
  
void drawCircle(float x, float y, int radius, int num) {
  float h = random(100); //gives the hue, saturation, and brightness
  float s = random(100); // random properties
  float b = random(255);
  fill(h,s,b);
  ellipse(x,y,radius*2,radius*2); //draw ellipse
  if(num >1){
    num = num - 1;
    int branches = int(random(2,4)); // determines the growth
    for(int i = 0; i < branches; i++){// by using recursion
      float a = random(0,TWO_PI);
      float newx = x + cos(a) * 12.0 * num;
      float newy = y + sin(a) * 12.0 * num;
      if(mousePressed){ // if mouse pressed draw new
      drawCircle(newx, newy, radius/2,num);
      }
    }
  }
}
 
                

                
                                                                                                                
