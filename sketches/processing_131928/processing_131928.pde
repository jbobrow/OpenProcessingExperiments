
float angle;
float radius = 600;
float change = 0;
float speed = 1;
void setup(){
  size(750, 750);
  background(128);
  fill(0);
}
void draw(){
  angle+= speed * (PI / 102);
  radius=radius / (1 + .001 * speed);
  change+= 1;
  noStroke();
  fill(0, 200, 0);
  text(speed, 0, 10);
  translate(375, 375);
  rotate(angle);
    if (change%8 == 0){
    fill(255);
  }else if (change%8 == 4){
    fill(0);
  }else if (change%8 == 1){
    fill(210, 210, 0);
  }else if (change%8 == 5){
    fill(50, 50, 255);
  }else{
    noFill();
  }
  ellipse(radius, 0, radius / 5, radius / 3);
}
void keyPressed(){
  if (key == 's'){
    speed++;
    restart();
  }
  if (key == 'd'){
    speed--;
    restart();
  }
}
void restart(){
  background(128);
  angle = 0;
  radius = 600;
}

