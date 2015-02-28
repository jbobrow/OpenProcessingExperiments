
PImage myImage1;
PImage myImage2;
PImage myImage3;

void setup(){
  size(1000,1000);
  myImage1 =loadImage("images1.jpg");
  myImage2 =loadImage("flo.jpg");
  myImage3 =loadImage("lol.jpg");
  background(0,0,0,225);
}

void draw(){
   
  image(myImage1, mouseX, 530, 100 ,100);
  image(myImage2, 250, 250, 500, 500);
  image(myImage3, random(0, 255), 400, random (90, 255), 80);
  fill(50, 0, 50, 150);
  rect(random(0,1000), 0, 100, 100);
  
  
}


