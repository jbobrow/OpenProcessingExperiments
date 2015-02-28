
void setup() {
size(250, 250);
smooth();
background(20, 30, 30);
strokeWeight(2);

}
void draw(){
  frameRate(60);
  int overlap=120;//how much the lines overlap
  int x_intercept=width;
  stroke((200),random(180),random(255));//red colour
  float x = random(x_intercept);
   //determines the other end of the line 
  //aka (point NOT starting from centre)
  line(0, 0, x+random(overlap), boundary_line(x,x_intercept)+random(overlap));
  stroke(random(80),random(150),120);//blue colour
  float x2 = random(x_intercept);
  line(width, height, x2-random(overlap), boundary_line(x2,x_intercept)-random(overlap));
}

float boundary_line(float x,int x_intercept){
  return -x+x_intercept;//boundary line equals this code line

}




