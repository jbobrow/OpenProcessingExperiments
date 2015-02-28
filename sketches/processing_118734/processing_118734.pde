
float rectX=225;
float rectY=440;
float j=0;
float bombeX = 500;
float bombeY = -200;
float l=random(20,480);
float i;
PImage img;
float dis = abs(sqrt((rectX-bombeX)*(rectX-bombeX)+(rectY-bombeY)*(rectY-bombeY)));
void setup()
{
  size(500, 500);
img = loadImage("images.jpg");
  frameRate(60);
}
void draw() {
  j = j +100;
  background(img);
  if (rectX < 5)
  { 
    rectX = 5;
  }
  if (rectX > 445)
  { 
    rectX = 445;
  }
  display();
  i=i+10;
  if (i>=530)
  { 
    i=-30;
    l=random(20, 480);
  }

  if (key == CODED) {
    if (keyCode == LEFT) {
      rectX=rectX-10;
    }

    if (key == CODED) {
      if (keyCode == RIGHT) {
        rectX=rectX+10;
      }
      if (j==100)
      {

        j=0;
      }
      if (dis==0)
{
  dis = 0;
}
if (dis > 2)
{
  ;
}

    }
  }
}
void display() 
{
  rect(rectX, rectY, 30, 30);

  ellipse(l, i+50, 30, 30);
}




float point_direction(float rectX, float rectY, float bombeX, float bombeY) {
  float dir = 180+atan2(-(rectY-bombeY), (rectX-bombeX))*180/PI;
  return  dir;
}
float point_distance(float rectX, float rectY, float bombeX, float bombeY) {
  float dis = abs(sqrt((rectX-bombeX)*(rectX-bombeX)+(rectY-bombeY)*(rectY-bombeY)));
  return dis;
}
float lengthdir_x(float len, float dir) {
  float lengthdir = cos(dir*PI/180)*len;
  return lengthdir;
}
float lengthdir_y(float len, float dir) {
  float lengthdir = -sin( dir*PI/180)*len;
  return lengthdir;
}
