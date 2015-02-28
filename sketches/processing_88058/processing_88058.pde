
Pimage img;
Pimage img2;
Pimage img3;
Pimage img4;
float x = 50;
float y = 600;
int a = 400;
int b = 900;
int radius = 12;
float easing = .0001;

void setup(){
  size(800,800);
  smooth();
  frameRate(90);
  ellipseMode(RADIUS);
  img = loadImage("bear_test.png");
  img2 = loadImage("hello.png");
  img3 = loadImage("buildings.jpg");
  img4 = loadImage("mirror.png");
  textSize(20);
  textAlign(LEFT);
}

void draw(){
  background(255);
  image(img3,0,50);
  image(img4,mouseX,mouseY);
   float d = dist(pmouseX,pmouseY,a,b);
  if (d>radius){
    radius++;
    fill(251,215,15,100);
  } else {
    fill(251,215,15,100);
    radius;
  }
  ellipse(-100,-100,radius,radius);
  if (keyPressed && (key == CODED)){
    if (keyCode == LEFT) {
      x--;
    } else if (keyCode == RIGHT){
      x++;
    }
  }
    if(mousePressed){
    (y = 540) && image(img2,x,y-50); 
  } else {
    (y = 600);
    }
  image(img,x,y)*easing;
  fill(117,105,0);
  rect(0,700,800,200);
  fill(0);
  text("Run From The Sun and Hold It Back With Your Mirror!",50,740);
  text("(Right or Left to run and Click the Mouse to jump)",50,770);
}
  
  
  
  


