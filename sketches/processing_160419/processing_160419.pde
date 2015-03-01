
//Without the help of these guys I wouldnt' understand this
//http://processing.org/discourse/beta/num_1262100117.html

float x;
float y;
float yS = 200;
float ySpeed; 

float eMouseX;
float ease = 0.1;

float gravity = 1;
float fric = 0.85;
float diam;

void setup() {
  y=yS;
  size(1000, 1000);
  smooth();
}

void draw() {
  
background(255);

float targetX = mouseX;
float dx = targetX - eMouseX;
if(abs(dx) > 1) {
  eMouseX +=dx * ease;
  }

fill(0);
ellipse(x, y, diam, diam);

 ySpeed += gravity - (mouseY/250);
 
 y += ySpeed;
 
 if ((eMouseX/10) < (width/10)){
  diam=(width/10)+(eMouseX/10);
}

//impact Y

  if (y > height-(diam/2)) {
    ySpeed *= -fric;
    y = height-diam/2;
  }
  if (y < diam/2){
    ySpeed *= -fric;
    y = diam/2;
  }
  
  if (eMouseX < (width-(diam/2)) && eMouseX > (diam/2)) {
    x=eMouseX;
}

}

