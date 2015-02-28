
int photos;
void setup() {
  size(600,450);
  photos = 1;
}
void draw() {
  fill(0,250,250);
  ellipse(300,300,(mouseX-600)*2,(mouseY-600)*2);
  fill(0,100,250);
   ellipse(300,300,(mouseX-600)*2,(mouseY-300)*2);
   fill(250,250,0);
    ellipse(300,300,(mouseX-600)*2,(mouseY-200)*2);
    fill(250,100,0);
    ellipse(300,300,(mouseX-500)*2,(mouseY-600)*2);
}
//void mousePressed() {
//save("myImage" + photos + ".jpg");
//photos = photos + 1;
//}

