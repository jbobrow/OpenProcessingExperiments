


int x = 300;
float n;
float y;
 

void setup(){
  size (300, 300);
  background(255);
  frameRate (50);
}
 

void draw(){

  x ++;
  float n = norm (x, 0.0, 300.0);
  float y = pow(n, 8);
  y *= 300;
stroke(random(255), random(50), random(255));
strokeWeight(y+1);
  line(x ,y, x/2, y/2);

 
  if (x>300){
     background(255);
   x = 0;
  }

}


