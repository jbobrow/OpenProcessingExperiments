
//buik
int buikX;
int buikY;
int buikL;
int buikB;
//buiklicht
int buiklichtX;
int buiklichtY;
int buiklichtL;
int buiklichtB;
//hoofd
int hoofdX;
int hoofdY;
int hoofdL;
int hoofdB;
//mond
int mondX;
int mondY;
int mondL;
int mondB;
//oogwit
int oogwitX;
int oogwitY;
int oogwitL;
int oogwitB;
//oogzwart
int oogzwartX;
int oogzwartY;
int oogzwartL;
int oogzwartB;
//navel
int navelX;
int navelY;
int navelL;
int navelB;
//armL
int armLX;
int armLY;
int armLL;
int armLB;
//armR
int armRX;
int armRY;
int armRL;
int armRB;
//beenL
int beenLX;
int beenLY;
int beenLL;
int beenLB;
//beenR
int beenRX;
int beenRY;
int beenRL;
int beenRB;

void setup() {
  size(500, 500);
  //buik (250, 350, 200, 200)
buikX = 250;
buikY = 350;
buikL = 200;
buikB = 200;
//buiklicht (250, 400, 100, 100)
buiklichtX = 250;
buiklichtY = 400;
buiklichtL = 100;
buiklichtB = 100;
//hoofd (250, 200, 150, 150)
hoofdX = 250;
hoofdY = 200;
hoofdL = 150;
hoofdB = 150;
//mond (250, 250, 25, 35)
mondX = 250;
mondY = 250;
mondL = 25; 
mondB = 35;
//oogwit (250, 190, 50, 50)
oogwitX = 250;
oogwitY = 190;
oogwitL = 50;
oogwitB = 50;
//oogzwart (250, 190, 10, 10)
oogzwartX = 250;
oogzwartY = 190;
oogzwartL = 10;
oogzwartB = 10;
//navel (250, 420, 10, 10)
navelX = 250;
navelY = 420;
navelL = 10;
navelB = 10;
//armL (150, 250, 180, 280)
armLX = 150;
armLY = 250;
armLL = 180;
armLB = 280;
//armR (320, 280, 350, 250)
armRX = 320;
armRY = 280;
armRL = 350;
armRB = 250;
//beenL (190, 480, 220, 445)
beenLX = 190;
beenLY = 480;
beenLL = 220;
beenLB = 445;
//beenR (310, 480, 280, 445)
beenRX = 310;
beenRY = 480;
beenRL = 280;
beenRB = 445;
}

void draw() {
  background(255, 255, 255);

  //buik
  stroke(0);
  strokeWeight(5);
  fill(255, 155, 0);
  ellipse(buikX, buikY, buikL, buikB);

  //buik licht
  stroke(0);
  strokeWeight(2);
  fill(255, 200, 80);
  ellipse(buiklichtX, buiklichtY, buiklichtL, buiklichtB);

  //hoofd
  stroke(0);
  strokeWeight(5);
  fill(255, 155, 0);
  ellipse(hoofdX, hoofdY, hoofdL, hoofdB);
  
  //mond
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  ellipse(mondX, mondY, mondL, mondB);

  //oogwit
  stroke(0);
  strokeWeight(5);
  fill(255, 255, 255);
  ellipse(oogwitX, oogwitY, oogwitL, oogwitB);

  //oogzwart
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  ellipse(oogzwartX, oogzwartY, oogzwartL, oogzwartB);
 
  //navel
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  ellipse(navelX, navelY, navelL, navelB);

  //armlinks
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  line(armLX, armLY, armLL, armLB);

  //armrechts
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  line(armRX, armRY, armRL, armRB);

  //beenlinks
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  line(beenLX, beenLY, beenLL, beenLB);

  //beenrechts
  stroke(0);
  strokeWeight(5);
  fill(0, 0, 0);
  line(beenRX, beenRY, beenRL, beenRB);
  
  buikY = buikY -1;
  buiklichtY = buiklichtY -1;
  hoofdY = hoofdY -1;
  mondY = mondY -1; 
  oogwitY = oogwitY -1;
  oogzwartY = oogzwartY -1;
  navelY = navelY -1;
  armLY = armLY -1;
  armRY = armRY -1;
  beenLY = beenLY -1;
  beenRY = beenRY -1;
  armLB = armLB -1;
  armRB = armRB -1;
  beenLB = beenLB -1;
  beenRB = beenRB -1;
  buikX = mouseX;
  buiklichtX = mouseX;
  hoofdX = mouseX;
  mondX = mouseX;
  oogwitX = mouseX;
  oogzwartX = mouseX;
  navelX = mouseX;
  armLX = mouseX-100;
  armRX = mouseX+70;
  beenLX = mouseX-60;
  beenRX = mouseX+60;
  armLL = mouseX-70;
  armRL = mouseX+100;
  beenLL = mouseX-30;
  beenRL = mouseX+30;

  println("x" + mouseX);
  println("y" + mouseY);
}

