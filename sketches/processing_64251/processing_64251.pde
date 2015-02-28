
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;

int grenze = 200;

void setup() {
 size(500,500);
smooth(); 
noCursor();

img = loadImage("olive_tree.jpg");
img1 = loadImage("artischocken.png");
img2 = loadImage("feigen.png");
img3 = loadImage("orange.png");
img4 = loadImage("Ziege1.png");
img5 = loadImage("Ziege2.png");
img6 = loadImage("Ziege11.png");
img7 = loadImage("Ziege22.png");

}

void draw() {
   image(img,0,0);
if(mousePressed){
  
  if (mouseX >= grenze) {
   image(img6,280,310);
  }
  else {
    image(img7,180,310);
  }
  
  image(img1,90,230);
  image(img2,110,180);
  image(img3,140,250);
  image(img1,230,160);
  image(img2,145,270);
  image(img3,145,120);
  image(img1,270,160);
  image(img2,190,210);
  image(img3,200,190);
  image(img1,220,270);
  
  image(img2,280,230);
  image(img3,320,130);
  image(img1,340,170);
  image(img2,350,210);
  image(img3,370,260);
  image(img1,310,250);
  image(img2,270,110);
  image(img3,420,180);
  image(img1,440,150);
 
}else{
  
  
  if (mouseX >= grenze) {
   image(img4,280,310);
  }
  else {
    image(img5,180,310);
  }


  color c = img.get(mouseX, mouseY);
  
  fill(c);
  noStroke();
  ellipse(100,250,8,16);
  ellipse(120,200,8,16);
  ellipse(150,270,8,16);
  ellipse(240,180,8,16);
  ellipse(155,290,8,16);
  ellipse(155,140,8,16);
  ellipse(280,180,8,16);
  ellipse(200,230,8,16);
  ellipse(210,210,8,16);
  ellipse(230,290,8,16);
  
  ellipse(290,250,8,16);
  ellipse(330,150,8,16);
  ellipse(350,190,8,16);
  ellipse(360,230,8,16);
  ellipse(380,280,8,16);
  ellipse(320,270,8,16);
  ellipse(280,130,8,16);
  ellipse(430,200,8,16);
  ellipse(450,170,8,16);
  


}}

