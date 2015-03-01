
PFont f;                         
void setup(){
size(900, 700);
background(0);
f = createFont("New Agsana",50, true);  
}
void draw(){
  if (mousePressed){
  background(0);
  }
  if (mousePressed){
  textFont(f,50);
  fill(255);
  text("???OD DID OUY DID TAHW",10,100);
  }
  textFont(f,50);                
  fill(255);                         
  text("ERASE ME?!??",10,100);
  if (mouseY < 100){
    PImage img=loadImage("FACE.png");
  image(img, 200, 200);
  image(img,200, 100);
   image(img,200, 300);
   image(img,200, 400);
   image(img,200, 500);
   image(img,200, 600);
   image(img,200, 700);
   image(img, 300, 200);
  image(img,300, 100);
   image(img,300, 300);
   image(img,300, 400);
   image(img,300, 500);
   image(img,300, 600);
   image(img,300, 700);
   image(img, 100, 200);
  image(img,100, 100);
   image(img,100, 300);
   image(img,100, 400);
   image(img,100, 500);
   image(img,100, 600);
   image(img,100, 700);
   image(img, 400, 200);
  image(img,400, 100);
   image(img,400, 300);
   image(img,400, 400);
   image(img,400, 500);
   image(img,400, 600);
   image(img,400, 700);
   image(img, 500, 200);
  image(img,500, 100);
   image(img,500, 300);
   image(img,500, 400);
   image(img,500, 500);
   image(img,500, 600);
   image(img,500, 700);
   image(img, 600, 200);
  image(img,600, 100);
   image(img,600, 300);
   image(img,600, 400);
   image(img,600, 500);
   image(img,600, 600);
   image(img,600, 700);
   image(img, 700, 200);
  image(img,700, 100);
   image(img,700, 300);
   image(img,700, 400);
   image(img,700, 500);
   image(img,700, 600);
   image(img,700, 700);
   image(img, 800, 200);
  image(img,800, 100);
   image(img,800, 300);
   image(img,800, 400);
   image(img,800, 500);
   image(img,800, 600);
   image(img,800, 700);
   image(img,0, 200);
  image(img,0, 100);
   image(img,0, 300);
   image(img,0, 400);
   image(img,0, 500);
   image(img,0, 600);
   image(img,0,700);
  }
  
PImage img=loadImage("FACE.png");
image(img,mouseX,mouseY);  
  fill(200,150,0,50);
  stroke(200,150,0,50);
ellipse(mouseX,mouseY,50,80);
fill(255,0,0);
stroke(0);
rectMode(CENTER);
rect(mouseX,mouseY,10,25);
fill(0);
line (200,150, mouseX, mouseY); 
}


