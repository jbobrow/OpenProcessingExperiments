
PImage frenchPress;
PImage frenchPress2;
boolean mouseDown = false;
boolean textChange = false;

void setup(){
  size (620,431);
  String url = "http://wp.stumptowncoffee.com/assets/presspot_06.jpg";
  frenchPress = loadImage (url, "jpeg");  
  String url2 = "http://wp.stumptowncoffee.com/assets/presspot_08.jpg";
      frenchPress2 = loadImage (url2, "jpeg");

}


void draw() {
      if (mouseDown){
     image (frenchPress, 0 , 0);
      }
      else {
     image (frenchPress2, 0, 0);
      }
      if (textChange){
        whiteText();
      }
      else {
      image (frenchPress, 0, 0);
      }
     }
     
 void whiteText() {
     textSize(75);
     text("Coffee Tutorial",10,75);
     textSize(30);
     text("Monday, September 15th",10,390);
     text("Ground Zero",10,425);
 }
   
 void mousePressed() {
   mouseDown = !mouseDown;
    if (mouseX > 10 && mouseX < 580 && mouseY > 25 && mouseY < 100) {
      textChange = !textChange;
    }
    if (mouseX > 10 && mouseX < 500 && mouseY > 350 && mouseY < 450) {
      textChange = !textChange;
    }
 }
