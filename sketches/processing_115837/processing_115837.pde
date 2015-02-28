

PImage[] img = new PImage[20]; 
int copy = 50 ; 

PImage img1, img2, img3; 
float angle = 0; 
float angle2 = 0.2;
float angle3 = 0.1;

float x, y; 
float r = 35;
float diff = 1; 
float a = 150;


void setup() {
  size(800, 500); 
  background(0);
   img1 = loadImage("6.jpg");
  img2 = loadImage("14.jpg");
  img3 = loadImage("8.jpg");
  
  for (int i = 1; i < 20; i ++) {
    img[i] = loadImage( i+".jpg");
  }
}
void draw() {

    x = r * cos(angle); 
  y = r * sin(angle);
  
 
  
  float r = random(mouseX/2, mouseY/2); 
  for (int i = 1; i < 20; i ++) {
    tint(255, 50); 
     if (i< 7) {
     tint(255, 100);
   }
     
     image(img[i], copy*i, r);
  }

  image(img[10], mouseX, mouseY);
 pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img1, 0,0,100,100);
  popMatrix();  

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle3);
  image(img2, 150,50,50,100);
  popMatrix();  


  pushMatrix();
  translate(width/2, height/2);
  rotate(angle2);
  image(img3, 300, 0,100,100);
  popMatrix();  
  
  angle += 0.01;
  angle2 += 0.01;
  angle3 += 0.08;

angle = angle +a;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
  
   if (mousePressed && mouseX>20 && mouseX<90 && mouseY>20 && mouseY<90) {
  tint(random(255));
  image(img[8],20,20,500,500);
}
 
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img[3],0,0, 20,20);
  popMatrix(); 
 
  image(img[10], mouseX, mouseY);
  angle += 0.1;
   
    if (mousePressed == true) {
    tint(255,100);
    image(img[8],mouseX,mouseY,600,600);
    image(img[8],mouseX+100,mouseY+100,80,80);
    image(img[8],mouseX-100,mouseY-100,80,80);
    image(img[8],mouseX+100,mouseY-100,80,80);
    
  }

}

void keyPressed() {
  saveFrame("_######.png");
}



