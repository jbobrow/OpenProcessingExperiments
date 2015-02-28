
void setup() {
  size(500, 500);
  background(255, 255, 255);
}
void draw() {
  background(255, 255, 255);
  strokeWeight(3);
  stroke(96, 0, 0);
  fill(100, 30, 20);
  triangle(mouseX-100, mouseY+280, mouseX-50, mouseY+60, mouseX-30, mouseY+60); //linkerbeen
  triangle(mouseX+100, mouseY+280, mouseX+50, mouseY+60, mouseX+30, mouseY+60); //rechterbeen
  ellipse(mouseX-100, mouseY+280, 20, 20);
  ellipse(mouseX+100, mouseY+280, 20, 20);
  strokeWeight(2);
  fill(100, 30, 20);
  ellipse(mouseX, mouseY, 200, 200); //lichaam
  fill(80,0,0);
  triangle(mouseX-15, mouseY-15, mouseX-25, mouseY-30, mouseX-60, mouseY-30); //linkeroog
  triangle(mouseX+15, mouseY-15, mouseX+25, mouseY-30, mouseX+60, mouseY-30); //rechteroog
  fill(0);
  stroke(0);
  ellipse(mouseX-30, mouseY+30, 30, 30); //mond1 (van links)
  ellipse(mouseX-10, mouseY+30, 30, 30); //mond2
  ellipse(mouseX+10, mouseY+30, 30, 30); //mond3
  ellipse(mouseX+30, mouseY+30, 30, 30); //mond4
  stroke(96, 0, 0); 
  fill(60, 0, 0);
  triangle(mouseX-40, mouseY-12, mouseX-30, mouseY-30, mouseX-25, mouseY-50); //litteken oog
  triangle(mouseX-40, mouseY-85, mouseX-35, mouseY-130, mouseX-25, mouseY-95);  //linkerhoorn
  triangle(mouseX+40, mouseY-85, mouseX+35, mouseY-130, mouseX+25, mouseY-95); //rechterhoorn
  strokeWeight(5);
  line(mouseX-100, mouseY-5, mouseX-150, mouseY-5); //linker'arm'
  line(mouseX+100, mouseY-5, mouseX+150, mouseY-5); //rechter'arm'
}

