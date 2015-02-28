
void draw() {
    size (400, 400);
    background (0, 120, 0);
    ellipse (200, 200, 200, 200);
    ellipse (180, 180, 20,20);
    ellipse (220, 180, 20, 20);
    line (160, 225, 240, 225);
   if (mousePressed == true) {
      background (0, 20, 130);
    ellipse (mouseX+50, mouseY+-50, 200, 200);
    ellipse (mouseX+80, mouseY+-80, 20, 20);
    ellipse (mouseX+20, mouseY+-80, 20, 20);
    line (mouseX+-1, mouseY+-51, mouseX+100, mouseY+-51);
    arc (mouseX+50, mouseY+-50, 80, 70, 0, PI);  
    }
}
