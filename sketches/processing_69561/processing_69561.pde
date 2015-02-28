
int x=400;
int y=400;
float angle = 0; //angle starts at 0
float speed = 1;
float speed2= 1;
float radius1 =0; 

void setup() {
  size(800, 800);
  background(0);
  smooth();
  translate(400,400); //change coordination to center

}
void draw() {
circles(); //function : draws circles from the center

}

void keyPressed(){
background(0);
  angle=0;
  speed=1;
  speed2=2;
  radius1 =0;
  x += sin(angle)  * radius1;//instead of radius, scalar will increase.
  y += cos(angle)  * radius1;//radius will increase.
  stroke(random(1, 255), random(1, 255), random(1, 255));
  line(x, y, width/2, height/2);

  fill(random(255), random(255), random(255));
  stroke(255);

  angle += speed;
  radius1 += speed2;
  ellipse(x, y, 14, 14);
}


void circles(){
  x += sin(angle)  * radius1;//radius1 will increase. (space between circles)
  y += cos(angle)  * radius1;//radius1 will increase.
  stroke(random(1, 255), random(1, 255), random(1, 255));
  line(x, y, width/2, height/2); //from center it will drawy a lines for each circles

  fill(random(255), random(255), random(255));
  stroke(255);

  angle += speed; //angle speed goes up(distance from center)
  radius1 += speed2;
  ellipse(x, y, 14, 14);
}

