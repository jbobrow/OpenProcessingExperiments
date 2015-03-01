
 PImage photo;
float w = 50, h = 50;
void setup() {
  size(636, 966);
  photo = loadImage("dress.jpg");
  
  println(photo.width + ", " + photo.height);
  
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e > 0){
     
     w -= 10;
     h -= 10;
  }else{
     w += 10;
     h += 10;
  }
}

void keyPressed(){
    if(keyCode == UP){
        w += 10;
        h += 10;
    }else if(keyCode == DOWN){
        w -= 10;
        h -= 10;
    }
}


void draw() {
  image(photo, 0, 0);
  noStroke();
  color c = get(mouseX, mouseY);
  fill(c);
  ellipse(mouseX,mouseY, w,h);
  
  fill(0);
  int r = (c >> 16) & 0xFF;  
  int g = (c >> 8) & 0xFF;   
  int b = c & 0xFF;         
  
  text("R = " + r, 550, 30);
  text("G = " + g, 550, 40);
  text("B = " + b, 550, 50);
}



