
//Project I

//Variables
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;
PImage img16;
PImage img17;
PImage img18;
PImage img19;
PImage img20;

void setup() {
  size(600,600);
  
 
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  img4 = loadImage("img4.jpg");
  img5 = loadImage("img5.jpg");
  img6 = loadImage("img6.jpg");
  img7 = loadImage("img7.jpg");
  img8 = loadImage("img8.jpg");
  img9 = loadImage("img9.jpg");
  img10 = loadImage("img10.jpg");
  img11 = loadImage("img11.jpg");
  img12 = loadImage("img12.jpg");
  img13 = loadImage("img13.jpg");
  img14 = loadImage("img14.jpg");
  img15 = loadImage("img15.jpg");
  img16 = loadImage("img16.jpg");
  img17 = loadImage("img17.jpg");
  img18 = loadImage("img18.jpg");
  img19 = loadImage("img19.jpg");
  img20 = loadImage("img20.jpg");
}
  
  void draw(){ 
  background(random(0,255),random(0,255),random(0,255));
  int CT = millis()/100;
  if(CT >= 58){
  background(0);
  if(CT >= 60){
    image(img1,0,0);
  if(CT >= 62){
   image(img2,0,0);
  if(CT >= 64){
    image(img3,0,0);
  if(CT >= 66){
   image(img4,0,0);
  if(CT >= 68){
    image(img5,0,0);
  if(CT >= 70){
   image(img6,0,0);
  if(CT >= 72){
    image(img7,0,0);
  if(CT >= 74){
   image(img8,0,0);
  if(CT >= 76){
    image(img9,0,0);
  if(CT >= 78){
   image(img10,0,0);
  if(CT >= 80){
    image(img11,0,0);
  if(CT >= 82){
   image(img12,0,0);
  if(CT >= 84){
    image(img13,0,0);
  if(CT >= 86){
   image(img14,0,0);
   if(CT >= 88){
    image(img15,0,0);
  if(CT >= 90){
   image(img16,0,0);
  if(CT >= 92){
    image(img17,0,0);
  if(CT >= 94){
   image(img18,0,0);
   if(CT >= 96){
    image(img19,0,0);
  if(CT >= 98){
   image(img20,0,0);
  if(CT>=104){
    background(0);{
  if (CT>=110){
   background(255);
   if (key == BACKSPACE) {
   String s = "SORRY, YOU ARE NOT AUTHORIZED TO BRING BACK THE PAST"; 
    fill(255,0,0);
    textSize(18);
   text(s, 40, 150);
   String u= "Press Any Key To Continue";
   textSize(12);
    fill(0);
   text(u, 220, 200);
  }else{
  String s = "To Go Back Press The Backspace Key";
   fill(0);
   text(s, 300, 300, 300, 300);
  }
  }
  
   }
   }
  }
  }
  }
   }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }
  }




