
PImage img0, img2, img3, img13, img14, img15, img16, img17, img18, img19; 
PImage img1, img4, img5, img6, img7, img8, img9, img10, img11, img12; 
float angle = 0;

void setup() {
  size(800,500); 
  background(0); 
  img0 = loadImage("0.png");
  img1 = loadImage("1.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
  img8 = loadImage("8.png");
  img9 = loadImage("9.png");
  img10 = loadImage("10.png");
  img11 = loadImage("11.png");
  img12 = loadImage("12.png");
  img13 = loadImage("13.png");
  img19 = loadImage("14.png");
  img14 = loadImage("19.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img15 = loadImage("15.png");
  img16 = loadImage("16.png");
  img17 = loadImage("17.png");
  img18 = loadImage("18.png");

}
void draw() {
  image(img19, 0, 0);
  image(img0, 0, -80);
  image(img14, 0, 0);
  image(img18, -80, 0);
  image(img17, -80, 200);
  image(img1,-80,300);
  image(img10,80,0);
  
  pushMatrix();
  translate(100, 300);
  rotate(angle);
  
  image(img7, 0, 0);
  image(img13, 0, 0);
  popMatrix();  
  
  
  image(img3, random(300,300), random(0,500) );
  image(img4, random(500,500), random(0,500) );
  image(img5, random(400,400), random(0,500) );
  image(img11, random(200,200), random(0,500) );
  image(img16, random(600,600), random(0,500) );
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  
  
  image(img8,0,0);
  image(img9, 0, 0);
  image(img2, 0, 0);
  popMatrix();  
  
  float a=random(150,350);
  image(img12,550,250,a,a);
  image(img6,0,0,a,a);


  image(img15, mouseX, mouseY);
  println(mouseX +":"+ mouseY);

  angle += 0.01;
  // angle = angle +0.01;
  

 


}
void keyPressed() {
  saveFrame("_####.png");
}



