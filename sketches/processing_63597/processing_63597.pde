
float rot=0;
float d=dist(mouseX, mouseY, pmouseX, pmouseY);
float explode=0;
float m=2;
float stop=0;
float i=20;
float count=0;
float grow=0;
float boom=0;
float countII=0;
float wobble=0;
float something=0;
float speed=0.97;

void setup() {
  size(500, 500);
  smooth();
}
void mouseReleased(){
  wobble=0;
  m=2;
}

void snowflake(float x, float y, float s, float d) {

    translate(x+wobble, y+wobble);
    rotate(rot);
    translate(-x+wobble, -y+wobble);
    layer(x, y, s+grow, 20+(d/7)+boom); 
    layer(x, y, s+grow, 20+(d/6)+boom); 
    layer(x, y, s+grow, 20+(d/5)+boom); 
    layer(x, y, s+grow, 20+(d/4)+boom); 
    layer(x, y, s+grow, 20+(d/3)+boom); 
    layer(x, y, s+grow, 20+(d/2)+boom);
if(mousePressed){
  wobble=random(m);
  m=m+0.001;
  grow=grow+0.001;
}
 
  if (d<100&&explode==0) {
    countII=countII+1;
  }

  if (d>100&&explode==0) {
    count=count+1;
    countII=0;
  }
  if (count>200&&d>100&&explode==0) {
    stop=1;
    boom=40;
  }

  if (count>500&&d>100&&explode==0) {
    boom=80;
    stop=2;
  }
  if(count>750&&d>100&&explode==0){
    boom=250;
    stop=4;
  }
  if(d>10){
    countII=0;
  }
  if (count>1000&&d>100) {
    boom=boom+10;
    stop=3;
    count=1001;
    d=101;
    countII=0;
    explode=1;
  }
  if (d<10&&countII>9000&&m==2) {
    count=0;
    boom=0;
    stop=0;
    
  }
  if(explode==1&&mousePressed){
    stop=0;
    grow=0;
    explode=0;
    count=0;
    boom=0;
    d=dist(mouseX, mouseY, pmouseX, pmouseY);
  }
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
  int x=50;
  if (stop==0) {
    fill(60,150,255);
    noStroke();
    background(10+d, 40+d, 200+d);
  }
  if (stop==1) {
    background(40+d, 200+d, 10+d);
    fill(20,70,50);
  }
  if (stop==2) { 
      background(200+d,200+d,50+d);
    fill(240+d,140+d,0+d); 
  }
  if(stop==4){
 
    background(200+d, 40+d, 10+d);
    fill(255);
  }
   if (stop==3) { 
    background(200-random(200),40, 10);
  }
  float d=dist(mouseX, mouseY, pmouseX, pmouseY);

  for (int across=0; across< 5; across=across+1) {
    int y=50;
    for (int downwards=0; downwards<5; downwards=downwards+1) {
      pushMatrix();
      snowflake(x, y, 10, dist(mouseX, mouseY, pmouseX, pmouseY));
      popMatrix();
      y=y+100;
    }
    x=x+100;
  }
  speed = speed+d/580;
  speed = speed * 0.97;
  rot=rot+speed;
}



