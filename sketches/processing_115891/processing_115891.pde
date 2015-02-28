
PImage img0,img1,img2,img3,img4,img5,img6,img7,img8,img9;
float angle = 0;
void setup(){
  size(800,600);
  background(255);
  
  
  img0= loadImage("0.png");
  
  
  image(img0, 100, 0);
  img1= loadImage("1.png");
  img2= loadImage("2.png");
  img3= loadImage("3.png");
  img4= loadImage("4.png");
  img5= loadImage("5.png");
  img6= loadImage("6.png");
  img7= loadImage("7.png");
  img8= loadImage("8.png");
  img9= loadImage("9.png");
}


void draw(){
  

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img1, random(100,0), random(200,200));
  image(img2, random(200,200), random(300,300));
  image(img3, random(10,10), random (10,10));
  image(img5, random(5,5), random(5,5));
  image(img6, random(150,150),random(150,150));
  image(img7, random(170,170), random(170,170));
  image(img8, random(190,190), random(190,190));
 
  popMatrix();  

  image(img9, random(mouseX,mouseY), mouseY/2);
  image(img4, mouseX, random(mouseX,mouseY));

  

  angle += 0.08;
  // angle = angle +0.01;
  
  
  
}


void keyPressed() {
  saveFrame("_######.png");
}



