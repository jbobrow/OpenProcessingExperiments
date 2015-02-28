
PImage myimage;
PImage elizimage; 
PImage moonimage;


void setup(){
  size(1000,1000);
  myimage= loadImage("girl.jpg"); 
  elizimage= loadImage("pinkchiffon.jpg");
  moonimage= loadImage("moon.jpg");
 
}

void draw() {
  //image(image name, top left x, lop left y);
  tint(140, 89); //changes brightness
  image(myimage, random(200), random(300), 400, 400);
 
  tint(200, 49);
  image(elizimage, 500, 55, mouseX, mouseY);
  
 tint(255, 80);
 image(moonimage, 0, 80);


  
}

