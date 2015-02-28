
int x, y;
float speedx, speedy;

//watch out!! seizure inducing!!!

void setup (){
  size(800, 800);
 // background(mouseX, 154, 134);
  smooth();
  noStroke();
  x=200;
  y=200;
  speedx = 1;
  speedy = 1;
}

void draw(){
  fill(mouseX,mouseY,255);
  x += speedx;
  y += speedy;
  fill(random(255), random(255), random(255));
  ellipse(x, y, 400, 400);
  translate(300,300);
    for (int i=0; i<360; i++){
    ellipse(mouseX,mouseY,300,300);
    line(mouseX,mouseY,1000,1000);
    rotate(radians(3));
    rotate (radians(5));
  }
  if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  //  rect (width/2, height/2, 180, 180);
  }




}





