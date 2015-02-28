
float decolores = random(1);
float angle = random(0.0,40.0);

void setup() {
  size(screen.width,screen.height);
  smooth();
  //frameRate(70);
}

void draw() {
  background(0,0,255);




  for(int i=0;i<100;i=i+1) {
    //constrain(mouseX/2,100,100);
    rotate(2);
    fill(0,random(100,255),0);
    triangle(300,300,i*19,600,500,300);

    translate(mouseX,mouseY);
    fill(200,random(0,100),0);
    rotate(1.1);
    triangle(250,250,200,400,i-2,300);

    //noStroke();
    fill(random(25,255),0,200);
    //245,7,214 pink

    angle += 0.9;
    ellipse(800,600,30,30);
  }
}




void keyPressed() {

  //if (key=='s');{
  //saveImage();
  //}
  if(key == 'i') {
    filter(INVERT);
  }
  if(key == 'b') {
    filter(BLUR, 2);
  }
  if(key == 'g') {
    filter(GRAY);
  }

  if(key == 'e') {
    filter(ERODE);
  }
}


