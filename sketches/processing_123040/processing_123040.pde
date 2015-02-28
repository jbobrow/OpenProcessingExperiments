
int monsterposX;
int monsterposY;

void setup() {
  size(500, 500);
  background(0);
  monsterposX = 250;
  monsterposY = 500;

}
void draw() {
  background(0);
  strokeWeight(3);
  stroke(96, 0, 0);
  fill(100, 30, 20);
  triangle(monsterposX-100, monsterposY+280, monsterposX-50, monsterposY+60, monsterposX-30, monsterposY+60); //linkerbeen
  triangle(monsterposX+100, monsterposY+280, monsterposX+50, monsterposY+60, monsterposX+30, monsterposY+60); //rechterbeen
  ellipse(monsterposX-100, monsterposY+280, 20, 20);
  ellipse(monsterposX+100, monsterposY+280, 20, 20);
  strokeWeight(2);
  fill(100, 30, 20);
  ellipse(monsterposX, monsterposY, 200, 200); //lichaam
  fill(80,0,0);
  triangle(monsterposX-15, monsterposY-15, monsterposX-25, monsterposY-30, monsterposX-60, monsterposY-30); //linkeroog
  triangle(monsterposX+15, monsterposY-15, monsterposX+25, monsterposY-30, monsterposX+60, monsterposY-30); //rechteroog
  fill(0);
  stroke(0);
  ellipse(monsterposX-30, monsterposY+30, 30, 30); //mond1 (van links)
  ellipse(monsterposX-10, monsterposY+30, 30, 30); //mond2
  ellipse(monsterposX+10, monsterposY+30, 30, 30); //mond3
  ellipse(monsterposX+30, monsterposY+30, 30, 30); //mond4
  stroke(96, 0, 0); 
  fill(60, 0, 0);
  triangle(monsterposX-40, monsterposY-12, monsterposX-30, monsterposY-30, monsterposX-25, monsterposY-50); //litteken oog
  triangle(monsterposX-40, monsterposY-85, monsterposX-35, monsterposY-130, monsterposX-25, monsterposY-95);  //linkerhoorn
  triangle(monsterposX+40, monsterposY-85, monsterposX+35, monsterposY-130, monsterposX+25, monsterposY-95); //rechterhoorn
  strokeWeight(5);
  line(monsterposX-100, monsterposY-5, monsterposX-150, monsterposY-5); //linker'arm'
  line(monsterposX+100, monsterposY-5, monsterposX+150, monsterposY-5); //rechter'arm'
  
  monsterposX = mouseX;
  monsterposY = monsterposY - 1;
}

