
int a= 0;
float x2 = 400;
float x = 0;
float y = 200;
float speed = 1.5;



void setup() {
  size (400, 400);
  smooth();
}

void draw(){
  
if (x <0 || x >400){
  speed = speed * -1; 
}

  background(a);
  x += speed; //increase the value of x
  
  fill(200,250,10);
  ellipse(x, 200, 30, 30);
  x2-= speed;
  fill(255);
 ellipse (x2, y, 30, 30);
 
if (dist(x, 200, x2, 200)<=30){
  a = 0;
}
 if (dist(x,200, x2, y)>=30){
 a= 250;
 }
if (keyPressed && keyCode == DOWN){
  y = y +12;
}
if (keyPressed && keyCode == UP) {
  y = y -12;
}

}
                
                
