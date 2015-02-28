
int radius = 70;
float x = 110;
float speed = 5;
int direction = 1;

void setup (){
  size (700, 200);
  ellipseMode(RADIUS);
}
void draw (){
background(77,255,198);
noStroke();
x += speed * direction;
if ((x>width - radius) || (x<radius)){
direction = -direction;
}
fill(255,248,0);
if (direction ==1){
arc (x, 100, radius, radius, 0.52, 5.76);
}else{
  arc (x, 100, radius, radius, 3.67, 8.9);
}

if((x<150)||(x>500)){
arc(x, 100, radius, radius, 0.00, TWO_PI);
}
}
