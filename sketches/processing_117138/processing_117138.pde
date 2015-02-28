
PImage img1, img2, img3, img5, img6, img7, img8, img10, img11, img12;
float a = 0;
int i;
 
void setup(){
  size(1000,1000);
  background(0);
  img1 = loadImage("06.png");
  img2 = loadImage("01.png");
  img3 = loadImage("02.png");
  
  img5 = loadImage("02 2.png");
  img6 = loadImage("01-2.png");
  img7 = loadImage("04.png");
  img8 = loadImage("10.png");
 
  img10 = loadImage("11.png");
  img11 = loadImage("011.png");
  img12 = loadImage("08.png");
}
 
void draw() {
  image(img11, 10,1);
  image(img12, 1,300);
  
  pushMatrix();
  translate(height/2, width/2);
  rotate(a);
   
  image(img1, 1,1);
  image(img2, 40,40);
  image(img5, 200,200);
  image(img6, 400,100);
  image(img7, 800,800);
  
  pushMatrix();
  translate(height/2, width/2);
  rotate(a);
  image(img8, 400,400);
  
  image(img10,400,400);
  
   
  for (int i = 0; i < 10; i++) {
    image(img8, mouseX * i, mouseY * i);
  }
  popMatrix();
  a += 0.2;
}
 
void keyPressed(){
   
  if(keyCode == ENTER){
    save("image01.png");
  }
   

     
}



