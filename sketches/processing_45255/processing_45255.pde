
PImage myImage;
PImage myImage2;
void setup(){
  size(500,500);
  myImage = loadImage("390564_10150346455962665_503402664_8341746_416289169_n.jpg");
  myImage2 = loadImage("300865_10150481192779622_809329621_11221544_2045631219_n.jpg");
}
void draw(){
  tint(mouseX,mouseX,mouseX,150);
  image(myImage,0,0,500,500);
  tint(117,178,176,60);
  image(myImage2,0,0,700,700);
}

