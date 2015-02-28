
int monsterposX;
int monsterposY;

int richting;
int teller;

boolean test;

int y;
int spatie;
int stop;
int breedte;
int hoogte;

float i = 50;

void setup() {
  size(500, 500);
  background(100);
  monsterposX = 250;
  monsterposY = 400;
  richting = 5;
  teller = 0;
  test = true;
  y = 0;
  spatie = 30;
  stop = height;
  breedte = 10;
  hoogte = 10;
   frameRate(60);
}
void draw() {
  background(255);
  strokeWeight(3);
  stroke(96, 0, 0);
  fill(100, 30, 20);

  if (test == true) {
    fill(0);
  }
  else if (test == false) {
    fill(55, 0, 0);
  }
  strokeWeight(1);
      for(int i=0; i < 100; i ++){
    stroke(random(255), random(255), random(255));
  ellipse(random(0,500),random(0,500),1,75);
   
   }
  while (i > 500) { i = 0; }
  
  strokeWeight(3);

 stroke(96, 0, 0);

  triangle(monsterposX-100, monsterposY+280, monsterposX-50, monsterposY+60, monsterposX-30, monsterposY+60); //linkerbeen
  triangle(monsterposX+100, monsterposY+280, monsterposX+50, monsterposY+60, monsterposX+30, monsterposY+60); //rechterbeen
  ellipse(monsterposX-100, monsterposY+280, 20, 20); //linkervoet
  ellipse(monsterposX+100, monsterposY+280, 20, 20); //rechtervoet

  strokeWeight(2);
  if (test == true) {
    fill(0);
  }
  else if (test == false) {
    fill(100, 30, 20);
  }
  ellipse(monsterposX, monsterposY, 200, 200); //lichaam

  if (test == true) {
    fill(0);
  }
  else if (test == false) {
    fill(80, 0, 0);
  }

  triangle(monsterposX-15, monsterposY-15, monsterposX-25, monsterposY-30, monsterposX-60, monsterposY-30); //linkeroog
  triangle(monsterposX+15, monsterposY-15, monsterposX+25, monsterposY-30, monsterposX+60, monsterposY-30); //rechteroog

  fill(10);
  stroke(0);

  ellipse(monsterposX-30, monsterposY+30, 30, 30); //mond1 (van links)
  ellipse(monsterposX-10, monsterposY+30, 30, 30); //mond2
  ellipse(monsterposX+10, monsterposY+30, 30, 30); //mond3
  ellipse(monsterposX+30, monsterposY+30, 30, 30); //mond4

  stroke(96, 0, 0); 
  if (test == true) {
    fill(0);
  }
  else if (test == false) {
    fill(60, 0, 0);
  }

  triangle(monsterposX-40, monsterposY-12, monsterposX-30, monsterposY-30, monsterposX-25, monsterposY-50); //litteken oog
  triangle(monsterposX-40, monsterposY-85, monsterposX-35, monsterposY-130, monsterposX-25, monsterposY-95);  //linkerhoorn
  triangle(monsterposX+40, monsterposY-85, monsterposX+35, monsterposY-130, monsterposX+25, monsterposY-95); //rechterhoorn
  
  line(monsterposX-100, monsterposY-5, monsterposX-150, monsterposY-5); //linker'arm'
  line(monsterposX+100, monsterposY-5, monsterposX+150, monsterposY-5); //rechter'arm'
  



  monsterposX = mouseX;
  monsterposY = monsterposY - richting;

  println(teller);

  if (teller == 10) {
    teller = 0;
    test = !test;
  }
  if (monsterposY < 0 + 100) {
    richting = -richting;
    teller = teller +1;
  }
  if (monsterposY > 500 - 100) {
    richting = -richting;
  }
  



}

