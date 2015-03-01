
import ddf.minim.*;

AudioPlayer song;
Minim minim;

class star { 
  int x, y, z; 
  color c; 
  float size;
  star() {
    x = (int)random(0, 1000);
    y = (int)random(0, 1000);
    z = (int)random(0, -10000);
    c = color(255); 
    size = random(1, 3);
  }
  void render() { 
    stroke(c); 
    strokeWeight(size); 
    point(x, y, z);
  }
  void move() {
    z += 1;
  }
} 
star[] stars;
int MAX_STARS = 10000;

int w =100;

int h =100;

void setup() {
  size(1000,800, P3D);

  minim = new Minim(this);

  song = minim.loadFile("2.mp3");
  song.play();


  stars = new star[MAX_STARS]; 
  for (int i=0; i< MAX_STARS; ++i) {
    stars[i] = new star();
  }
}

void draw() {
  background(0);
  noStroke();



  specular(255, 255, 255);
  ambientLight(150, 150, 150);
  lightSpecular(255, 255, 255);
  directionalLight(150, 150, 150, -1, 1, 1);

  pushMatrix();

  translate(width/2, height/2, 0);
  //rotateX(radians(((mouseY/(float)width)*180)-90));
  //rotateY(radians(((mouseX/(float)height)*180)-90)); 

  rotateY(radians(frameCount));
  rotateX(radians(frameCount));

  //body
  pushMatrix();
  scale(1, 1.3, 0.5);
  fill(255, 255, 255);
  sphere(70);
  noStroke();
  popMatrix();


  translate(0, -105, 0);

  //head
  pushMatrix();   
  scale(1.0, 0.8, 0.8);
  sphere(60);
  popMatrix();

  //tear
  pushMatrix();  
  translate(-50, -30, 50); 
  fill(#20D3F5);
  scale(0.15, 0.15, 0.15);
  sphere(40);
  popMatrix();

  pushMatrix();  
  translate(-70, -50, 70); 
  scale(0.15, 0.15, 0.15);
  sphere(50);
  popMatrix();

  pushMatrix();  
  translate(-90, -35, 100); 
  scale(0.15, 0.15, 0.15);
  sphere(50);
  popMatrix();

  pushMatrix();  
  translate(-200, 160, -150); 
  translate(mouseX/80, mouseY/80, 0);
  scale(0.15, 0.15, 0.15);
  sphere(60);
  popMatrix();

  pushMatrix();  
  translate(150, -100, -100); 
  translate(mouseX/80, mouseY/80, 0);
  scale(0.15, 0.15, 0.15);
  sphere(60);
  popMatrix();

  pushMatrix();  
  translate(-150, 80, 100); 
  translate(mouseX/80, mouseY/80, 0);
  scale(0.15, 0.15, 0.15);
  sphere(70);
  popMatrix();

  pushMatrix();  
  translate(250, 300, 100); 
  translate(mouseX/80, mouseY/80, 0);
  scale(0.15, 0.15, 0.15);
  sphere(70);
  popMatrix();

  pushMatrix();  
  translate(500, 500, -100); 
  translate(mouseX/80, mouseY/80, 0);
  scale(0.15, 0.15, 0.15);
  sphere(70);
  popMatrix();

  pushMatrix();  
  translate(-300, 300, 300); 
  translate(mouseX/80, mouseY/80, 0);
  scale(0.15, 0.15, 0.15);
  sphere(70);
  popMatrix();




  //leg1
  pushMatrix();
  translate(-30, 195, 0);
  fill(255);
  rotateX(radians(-sin(mouseY/100)*25));
  scale(0.2, 0.5, 0.2);
  sphere(110);
  popMatrix();

  //leg2 
  pushMatrix();

  translate(30, 195, 0);
  rotateX(radians(sin(mouseX/100)*25));
  scale(0.2, 0.5, 0.2);
  sphere(110);
  popMatrix(); 




  //arm 1
  pushMatrix();
  translate(-85, 100, 0);
  rotateX(radians(-sin(mouseX/100)*25));
  rotate(PI/6);
  scale(0.2, 0.5, 0.2);
  sphere(100);
  popMatrix(); 

  //arm 2 
  pushMatrix();
  translate(85, 100, 0);  
  rotateX(radians(sin(mouseY/100)*25));
  rotate(PI/-6);
  scale(0.2, 0.5, 0.2);
  sphere(100);
  popMatrix();


  //eye
  pushMatrix();
  translate(30, -50, 40);
  translate(-5, 40, 0);
  rotate(PI/-6);
  scale(0.1, 0.1, 0.1);
  fill(random(0, 255), random(0, 255), random(0, 255));
  sphere(100);
  popMatrix(); 

  pushMatrix();
  translate(30, -50, 40);
  translate(-60, 40, 0);
  rotate(PI/-6);
  scale(0.1, 0.1, 0.1);
  fill(random(0, 255), random(0, 255), random(0, 255));
  sphere(100);


  popMatrix(); 




  //mouth
  pushMatrix();
  translate(60, -20, 40);
  translate(-60, 40, 0);
  rotate(PI/-6);
  scale(0.2, 0.05, 0.1);
  fill(185, 0, 0);
  box(100);

  popMatrix(); 


  pushMatrix();
  translate(60, -20, 40);
  translate(-60, 40, 0);
  rotate(PI/6);
  scale(0.2, 0.05, 0.1);
  fill(185, 0, 0);
  box(100);

  popMatrix(); 




  //right ear
  pushMatrix();
  translate(30, -70, 10);
  rotateX(radians(-sin(mouseY/100)*15));
  scale(0.2, 0.5, 0.2);
  fill(185, 0, 0);
  sphere(100);

  popMatrix();   


  //left ear
  pushMatrix();
  translate(-30, -70, 10);
  rotateX(radians(-sin(mouseX/100)*15));
  scale(0.2, 0.5, 0.2);
  fill(185, 0, 0);
  sphere(100);

  popMatrix(); 


  //tail
  pushMatrix();
  translate(-1, 150, -30);
  scale(0.2, 0.2, 0.2);
  fill(255, 120, 0);
  box(100);

  popMatrix();
  popMatrix();

  for (int i=0; i< MAX_STARS; ++i) {
    stars[i].render();
    if (mousePressed) stars[i].move();
  }
}



