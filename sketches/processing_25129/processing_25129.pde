
float x=10;
float y=100;
float yspeed =-1;
float xspeed = 1;


void setup() {
  size(500,300);
  background(0);
  x = random(300);
  y=random(300);
  xspeed = random(30);
  yspeed = random(10);
}
void draw() {
  background(random(17),random(52),random(72));

  if(x >= 300-30) {

    xspeed =xspeed*-1 ;
  }
  if(x<=30){
  xspeed = xspeed*-1;
}

if(y >= 300-10) {
  yspeed = yspeed* -1;
 
}

if(y<=10){
yspeed= yspeed*-1;
}

x = x + xspeed;
y = y + yspeed;


fill(random(101),random(183),random(232),100);
ellipse(50,y,20,x);
 rect(random(10),random(200),random(20),random(100));
  rect(random(500),random(250),random(250),random(50));
  rect(random(50),random(100),random(10),random(20));
}

  
  
