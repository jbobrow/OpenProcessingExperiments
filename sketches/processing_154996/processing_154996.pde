
float theta = 0.1;
float y = 1000;
float ex = 250;
float randcol1;
float randcol2;
float randcol3;
float limit;
int w = 1;

void setup(){
  size(500, 1000);
  smooth();
  background(0);
  frameRate(500);
}
void draw(){
  stroke(255);
  strokeWeight(w);
  point(250+ex*cos(theta), y+10*sin(theta));
  theta += 10000;
  y -= 0.05;
  ex -= 0.1;
  limit = random(50, 250);
  if(ex <= -250){
    limit = random(50, 250);
    ex = ex*-1;
  }

}

void mousePressed(){
if( mouseButton == LEFT ) {
   w++;
} else if( mouseButton == CENTER ) {
   w =0;
} else if( mouseButton == RIGHT ) {
   w--;
  }
}


  


