
float rot=0;
float d=dist(mouseX, mouseY, pmouseX, pmouseY);
float grow=0;
float boom=0;
float wobble=0;
float speed=0.98;
int y;
  float rad;

void setup() {
  size(500, 500);
  smooth();
}
void snowflake(float x, float y, float s, float d) {
  rad=dist(mouseX, mouseY, x, y);
  int i=0;
   translate(x+wobble, y+wobble);
      if(rad<100){
  rotate(rot);
      }
  translate(-x+wobble, -y+wobble);
  layer(x, y, s+grow, 10+boom); 
  layer(x, y, s+grow, 10+boom); 
  layer(x, y, s+grow, 10+boom); 
  layer(x, y, s+grow, 10+boom); 
  layer(x, y, s+grow, 10+boom); 
  layer(x, y, s+grow, 10+boom);
}

void layer (float x, float y, float s, float gap) {

  rect(x+gap, y, s, s);
  rect(x-gap, y, s, s);
  rect(x, y+gap, s, s);
  rect(x, y-gap, s, s);
  ellipse(x-gap+(s/2), y-gap+(s/2), s, s);
  ellipse(x+gap+(s/2), y-gap+(s/2), s, s);
  ellipse(x-gap+(s/2), y+gap+(s/2), s, s);
  ellipse(x+gap+(s/2), y+gap+(s/2), s, s);
}

void draw() {

  float x=25;
  background(255);
  float d=dist(mouseX, mouseY, pmouseX, pmouseY);


  for (int across=0; across< 10; across=across+1) {
    int y=25;
    for (int downwards=0; downwards<10; downwards=downwards+1) {
     
       pushMatrix();
        snowflake(x, y, 2, dist(mouseX, mouseY, pmouseX, pmouseY));
        popMatrix();
      y=y+50;
    }
    x=x+50;
  }
  speed = speed+d/580;
  speed = speed * 0.97;
  rot=rot+speed;
}


