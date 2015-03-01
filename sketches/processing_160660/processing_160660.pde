
PImage frenchPress;
PImage frenchPress2;
void setup(){
  size (620,431);
  String url = "http://wp.stumptowncoffee.com/assets/presspot_06.jpg";
  frenchPress = loadImage (url, "jpeg");  
  String url2 = "http://wp.stumptowncoffee.com/assets/presspot_08.jpg";
      frenchPress2 = loadImage (url2, "jpeg");

}


void draw() {
     image (frenchPress, 0 , 0);
     textSize(75);
     text("Coffee Tutorial",10,75);
     textSize(30);
     text("Monday, September 15th",10,390);
     text("Ground Zero",10,425);
     }
 void mouseDragged() {
     image (frenchPress2, 0 , 0);
     textSize(75);
     text("Coffee Tutorial",10,75);
     textSize(30);
     text("Monday, September 15th",10,390);
     text("Ground Zero",10,425);
     }
