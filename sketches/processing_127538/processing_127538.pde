
int x = 50;
int y = 50;

int dx = 9; //velocity
int dy = 5;


void setup() {  //setup function called initially, only once
  size(500, 250);
  background(255);  //set background white
  }

 void draw() { //draw function loops 
background(255);
noStroke();

fill(random(225), random(225), random(225));
ellipse(x,y,20,20); //ball

x = x + dx;
y = y + dy;

if (mousePressed){

x = mouseX;
y = mouseY;
}





if (x > 500){


dx = -9;

}

else if (x < 0) {

dx = 9;
}

if (y > 250) {

dy *= -1;
}

else if (y < 0) {
dy *= -1;

} 

}

