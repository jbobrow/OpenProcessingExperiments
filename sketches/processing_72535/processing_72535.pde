
float rect_x =100.5;
float rect_y =103.7;
float rect_w =200;
float rect_h =230.5;

void setup() {
    size(400,600);
}

void draw() {
    background(30, 30, 60);
    rect(rect_x, rect_y, rect_w, rect_h);

if ((mouseX > rect_x) && (mouseX < rect_x + rect_w))
if ((mouseY > rect_y) && (mouseY < rect_y + rect_h)) {
  textSize(20);  
  text("inside of rectum", 30, 30);
  }
}
