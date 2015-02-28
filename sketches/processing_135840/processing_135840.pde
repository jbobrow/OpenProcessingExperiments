
void setup() {
  size(500,500);
  background(255);
}
float x=0;
float y=0;
float a_radius = 100;
float a_angle = 0;
float a_x = cos(a_angle*PI/180)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;

void draw() {
background(255);

a_angle = a_angle + 5;
float a_x = cos(a_angle*PI/180)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;
strokeWeight(5);
fill(255,0,0);
rect(x, y, x+a_x, y+a_y);
rect(500-x,y,x+a_x,y+a_y);
rect(x,500-y,x+a_x,y+a_y);
rect(500-x,500-y,x+a_x,y+a_y);
rect(250-x,y,x+a_x,y+a_y);
rect(250-x,500-y,x+a_x,y+a_y);
rect(x,250-y,x+a_x,y+a_y);
rect(500-x,250-y,x+a_x,y+a_y);
fill(255,255,0);
rect(x,y,x-a_x,y-a_y);
rect(500-x,y,x-a_x,y-a_y);
rect(x,500-y,x-a_x,y-a_y);
rect(500-x,500-y,x-a_x,y-a_y);
rect(250-x,y,x-a_x,y-a_y);
rect(250-x,500-y,x-a_x,y-a_y);
rect(x,250-y,x-a_x,y-a_y);
rect(500-x,250-y,x-a_x,y-a_y);
fill(0,0,255);
rect(x,y,y-a_y,x-a_x);
rect(500-x,y,y-a_y,x-a_x);
rect(x,500-y,y-a_y,x-a_x);
rect(500-x,500-y,y-a_y,x-a_x);
rect(250-x,y,y-a_y,x-a_x);
rect(250-x,500-y,y-a_y,x-a_x);
rect(x,250-y,y-a_y,x-a_x);
rect(500-x,250-y,y-a_y,x-a_x);
x=x+0.5;
y=y+0.5;

}

