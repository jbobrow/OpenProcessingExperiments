
int x=300;
int y=300;
int vX=1;
int vY=1;
int diam = 1;
boolean petit= true;

void setup(){

  size(800,900);
  smooth();
 

}

void draw(){
fill(random(255),random(255),random(255),150);
ellipse(x,y,diam,diam);
if (x < 0) {
vX = -vX;
}

if (y < 0) {
vY = -vY;
}

if (x > width-mouseX/2) {
vX = -vX;
}
if (y > height-mouseX/2) {
vY = -vY;
}
while(diam < 60){
petit = true;
}


if(petit = true) {
diam ++;
} else {
diam -= 1;
}


x += 2*vX;
y += 2*vY;



  
}


