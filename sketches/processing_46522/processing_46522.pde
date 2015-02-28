
PImage pattern;
PImage klimt2;
PImage klimt3;
PImage klimt4;
PImage klimt5;
PImage face;
PImage face2;
PImage face3;
PImage image1;
PImage image2;
void setup () {
  size(800,800);
  pattern = loadImage ("DSC01015 - Version 6.jpg");
  klimt2 = loadImage ("DSC01015 - Version 9.jpg");
  klimt3 = loadImage ("DSC00886.jpg"); 
  klimt4 = loadImage ("DSC01015 - Version 10.jpg");
  klimt5 = loadImage ("DSC01015 - Version 14.jpg");
  face = loadImage ("Screen Shot 2011-11-19 at 2.31.15 PM 3.png");
  face2 = loadImage ("Screen Shot 2011-11-19 at 2.31.15 PM 3.png");
  face3 = loadImage ("DSC01015 - Version 2.jpg");
  image1 = loadImage ("DSC01016 - Version 4.jpg");
  image2 = loadImage ("DSC00886 - Version 2.jpg");
}

void draw () {
  tint(240,250,250,7);
  image(image1,mouseX,50,70,70);
  image(pattern,mouseX,200,100,100);
  image(klimt2,mouseX,300,100,100);
  image(klimt3,mouseX,140,100,60);
  image(image1,mouseX,0,20,20);
  image(klimt4,mouseX,400,100,80);
  image(pattern,mouseX,480,100,50);
  image(klimt2,mouseX,100,100,50);
  image(klimt5,mouseX,530,100,20);
  image(klimt3,mouseX,550,100,40);
  image(pattern,mouseX,80,100,20);
  image(klimt5,mouseX,220,100,20);
  image(klimt5,mouseX,390,100,20);
  image(klimt4,mouseX,120,100,20);
  image(klimt2,mouseX,0,100,80);
  image(klimt4,mouseX,590,100,60);
  image(pattern,mouseX,650,100,150);
  image(pattern,mouseX,mouseY,mouseX,mouseY);
  tint(242,201,225,7);
  image(face,400,mouseX,mouseX,mouseY);
  image(face2,mouseY,mouseX,100,120);
  image(face3,mouseX,mouseY,mouseX,140);
  image(image2,mouseX,250,70,70);
  image(image2,mouseX,420,20,20);
  image(image2,mouseX,320,50,50);
  image(image2,mouseX,520,30,30);
  image(klimt4,mouseX,300,30,30);
  image(face3,mouseX,150,50,50);
  image(face3,mouseX,0,50,50);
}

