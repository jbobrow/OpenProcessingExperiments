
class Boer {
  float x;
  float y;
  int k;
  String farmer;
  PFont font;
  boolean button = false;
 
 
  Boer(float newx, float newy, int newk, String sfarmer) {
    x = newx;
    y = newy;
    k = newk;
    farmer = sfarmer;
    
    
    font = loadFont("Times-Italic-48.vlw");     

 }
 
 
  void display() {
    rect(x, y, 35, k);
    fill(255);
    textFont(font, 14);
    text(farmer, x+2, y+15);
    stroke(255, 50);
    for (int x = 113; x <= 233; x += 20) {
    line(330, x, 365, x);
    }  
    stroke(255, 50);
    for (int x = 70; x <= 130; x += 20) {
    line(428, x, 463, x);
    }  
    stroke(255, 50);
    for (int x = 263; x <= 423; x += 20) {
    line(263, x, 298, x);
     }  
    stroke(255, 80);
    for (int x = 260; x <= 340; x += 20) {
    line(393, x, 428, x);
}
    
  }
}

