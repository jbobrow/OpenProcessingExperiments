
PImage b, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10,b11, b12, b13, b14,b15, b16, b17, b18, b19, b20;
void setup(){
  background (0);
  size (600,600);
  b= loadImage("image1.png");
  b1= loadImage("image12.jpg");
  b2= loadImage("image6.png");
  b3= loadImage("image16.jpg");
  b4= loadImage("image3.jpg");
  b5= loadImage("image13.jpg");
  b6= loadImage("image7.png");
  b7= loadImage("image14.jpg");
  b8= loadImage("image8.jpg");
  b9= loadImage("image10.jpg");
  b10= loadImage("image2.png");
  b11= loadImage("image19.jpg");
  b12= loadImage("image4.png");
  b13= loadImage("image17.jpg");
  b14= loadImage("image5.png");
  b15= loadImage("image18.jpg");
  b16= loadImage("image9.png");
  b17= loadImage("image19.jpg");
  b18= loadImage("image8.jpg");
  b19= loadImage("image15.jpg");
  b20= loadImage("soso.jpg");



}
void draw() {
  if (frameCount<40){
image(b,random(0,1000),0);
  }

 if (frameCount<60){
   image(b2,0,random(0,500));

 } if (frameCount<80){
   image(b3,random(0,1500),0);

 }
     if (frameCount<100){
   image(b20,0,random(0,2000));

 }

}

