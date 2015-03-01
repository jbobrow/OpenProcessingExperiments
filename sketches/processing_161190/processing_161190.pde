
int x= 100;
int y= 30;
float xspeed= 3.5;
float yspeed= 3.5;

void setup(){
  size (600,500);
}
void draw() {
  background (200,0,0);
for( int i = 70; i < 250; i+= 70){
  fill(210,160,0);
  ellipse(x+i,y,50,50);
if ( x+i > width || x+i < 0){
  xspeed= -xspeed;
}
if (y > height || y < 0){
  yspeed= -yspeed;
 }
}
x+=xspeed;
y+=yspeed;
}
