
//dist - check the distance between 2 points
//can you convert this into a function?
//or apply dist to array of bouncing balls

int s = 100;
int posXa = 20;
int posYa = 60;
int velXa = 5;
int velYa = 4;

int posXb = 40;
int posYb = 10;
int velXb = 9;
int velYb = 3;

void setup(){
  size(400, 400);
}

void draw(){
background(50);
noStroke();
float d = dist(posXa, posYa, posXb, posYb);

fill(200, 200, 0);
  ellipse(posXa, posYa, s, s);
fill(100, 200, 0);
  ellipse(posXb, posYb, s, s);

posXa = posXa + velXa;
posYa = posYa + velYa;
posXb = posXb + velXb;
posYb = posYb + velYb;

//ball1

if (posXa > width || posXa < 0){
  velXa = velXa * -1;
}
if (posYa > height || posYa < 0){
  velYa = velYa * -1;
}
//ball2
if (posXb > width || posXb < 0){
  velXb = velXb * -1;
}
if (posYb > height || posYb < 0){
  velYb = velYb * -1;
}
  //here is the question about the position
  if(d < s){
  background(100);
  text("TOUCH!!!", 10, 20);
  }
}
