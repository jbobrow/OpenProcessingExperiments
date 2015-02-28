
/* IMAGE1: 95, IMAGE4: 347, TYPE1 111, 
TYPE2: 327, TYPE3: 333, TRANS1: 133, TRANS2: 137
*/

PImage room1;
PImage room2;
PImage room3;
PImage bottles1;
PImage bottles2;
PImage bottles3;
PImage bottles4;
PImage chaise;
PImage cheesecake;
PImage cheesewheel;
PImage dvd;
PImage falsa1;
PImage falsa2;
PImage falsa3;
PImage falsa4;
PImage falsa5;
PImage falsa6;
PImage giraffe;
PImage gjollygreen;
PImage gpigchef;
PImage grooster;
PImage gweirdcat;
PImage lamp1;
PImage lamp2;
PImage lamp3;
PImage lamp4;
PImage pencil;
PImage pencil2;
PImage pencil3;
PImage pencil4;
PImage pencil5;
PImage pencil6;
PImage pencil7;
PImage pencil8;
PImage pencil9;
PImage pencil91;
PImage pencil92;
PImage pencil93;
PImage pencil94;
PImage table;
PImage turtle1;
PImage turtle2;
PImage turtle3;
PImage turtle4;
PImage turtle5;
PImage turtle6;
PImage turtle7;
PImage unicorn1;
PImage unicorn2;
PImage unicorn3;
PImage unicorn4;
PImage unicorn5;
PImage unicorn6;
PImage unicorn7;
PImage unicorn8;

float x, y, r; 

void setup() {
  size(640, 480);
  noLoop();
  smooth();
  room1 = loadImage("room1.png");
  room2 = loadImage("room2.png");
  room3 = loadImage("room3.png");
  bottles1 = loadImage("bottles1.png");
  bottles2 = loadImage("bottles2.png");
  bottles3 = loadImage("bottles3.png");
  bottles4 = loadImage("bottles4.png");
  chaise = loadImage("chaise.png");
  cheesecake = loadImage("cheesecake.png");
  cheesewheel = loadImage("cheesewheel.png");
  dvd = loadImage("dvd.png");
  falsa1 = loadImage("falsa1.png");
  falsa2 = loadImage("falsa2.png");
  falsa3 = loadImage("falsa3.png");
  falsa4 = loadImage("falsa4.png");
  falsa5 = loadImage("falsa5.png");
  falsa6 = loadImage("falsa6.png");
  giraffe = loadImage("giraffe.png");
  gjollygreen = loadImage("gjollygreen.png");
  gpigchef = loadImage("gpigchef.png");
  grooster = loadImage("grooster.png");
  gweirdcat = loadImage("gweirdcat.png");
  lamp1 = loadImage("lamp1.png");
  lamp2 = loadImage("lamp2.png");
  lamp3 = loadImage("lamp3.png");
  lamp4 = loadImage("lamp4.png");
  pencil = loadImage("pencil.png");
  pencil2 = loadImage("pencil2.png");
  pencil3 = loadImage("pencil3.png");
  pencil4 = loadImage("pencil4.png");
  pencil5 = loadImage("pencil5.png");
  pencil6 = loadImage("pencil6.png");
  pencil7 = loadImage("pencil7.png");
  pencil8 = loadImage("pencil8.png");
  pencil9 = loadImage("pencil9.png");
  pencil91 = loadImage("pencil91.png");
  pencil92 = loadImage("pencil92.png");
  pencil93 = loadImage("pencil93.png");
  pencil94 = loadImage("pencil94.png");
  table = loadImage("table.png");
  turtle1 = loadImage("turtle1.png");
  turtle2 = loadImage("turtle2.png");
  turtle3 = loadImage("turtle3.png");
  turtle4 = loadImage("turtle4.png");
  turtle5 = loadImage("turtle5.png");
  turtle6 = loadImage("turtle6.png");
  turtle7 = loadImage("turtle7.png");
  unicorn1 = loadImage("unicorn1.png");
  unicorn2 = loadImage("unicorn2.png");
  unicorn3 = loadImage("unicorn3.png");
  unicorn4 = loadImage("unicorn4.png");
  unicorn5 = loadImage("unicorn5.png");
  unicorn6 = loadImage("unicorn6.png");
  unicorn7 = loadImage("unicorn7.png");
  unicorn8 = loadImage("unicorn8.png");
}



void draw() {
  background(255);
  int whichface = int(random(0, 3));
if (whichface == 0) {
  image(room1, 0, 0);
  
  image(falsa1, random(150, 400), random(80, 180));
  image(falsa5, random(150, 400), random(80, 180));
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(cheesecake, -cheesecake.width/2, -cheesecake.height/2, 40, 86);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(bottles1, -bottles1.width/2, -bottles1.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(lamp1, -lamp1.width/2, -lamp1.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(giraffe, -giraffe.width/2, -giraffe.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(turtle5, -turtle5.width/2, -turtle5.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(turtle6, -turtle6.width/2, -turtle6.height/2);
  popMatrix();
  

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil, -pencil.width/2, -pencil.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil4, -pencil4.width/2, -pencil4.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil7, -pencil7.width/2, -pencil7.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil91, -pencil91.width/2, -pencil91.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(unicorn1, -unicorn1.width/2, -unicorn1.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(unicorn2, -unicorn2.width/2, -unicorn2.height/2);
  popMatrix();
  
  
} else if(whichface == 1) {
  image(room2, 0, 0); 
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(chaise, -chaise.width/2, -chaise.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(falsa3, -falsa3.width/2, -falsa3.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(falsa4, -falsa4.width/2, -falsa4.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(bottles2, -bottles2.width/2, -bottles2.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(bottles4, -bottles4.width/2, -bottles4.height/2);
  popMatrix();
  
  image(lamp3, 220, 0, 200, 200);
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(gpigchef, -gpigchef.width/2, -gpigchef.height/2);
  popMatrix();
 
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(gjollygreen, -gjollygreen.width/2, -gjollygreen.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(turtle1, -turtle1.width/2, -turtle1.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(turtle2, -turtle2.width/2, -turtle2.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil2, -pencil2.width/2, -pencil2.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil5, -pencil5.width/2, -pencil5.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil8, -pencil8.width/2, -pencil8.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil93, -pencil93.width/2, -pencil93.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(unicorn3, -unicorn3.width/2, -unicorn3.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(unicorn4, -unicorn4.width/2, -unicorn4.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(unicorn5, -unicorn5.width/2, -unicorn5.height/2);
  popMatrix();

  
  

} else if(whichface == 2) {
  image(room3, 0, 0);
  
  image(table, random(130, 500), 300);
  
  image(falsa6, random(150, 400), random(80, 180));
  image(falsa2, random(150, 400), random(80, 180));
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(cheesewheel, -cheesewheel.width/2, -cheesewheel.height/2, 80, 80);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(bottles3, -bottles3.width/2, -bottles3.height/2);
  popMatrix();
  
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(lamp2, -lamp2.width/2, -lamp2.height/2, 200, 200);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(lamp4, -lamp4.width/2, -lamp4.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(gweirdcat, -gweirdcat.width/2, -gweirdcat.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(grooster, -grooster.width/2, -grooster.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(turtle3, -turtle3.width/2, -turtle3.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(turtle4, -turtle4.width/2, -turtle4.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  image(turtle7, -turtle7.width/2, -turtle7.height/2, 150, 98);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil3, -pencil3.width/2, -pencil3.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil6, -pencil6.width/2, -pencil6.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil9, -pencil9.width/2, -pencil9.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pencil94, -pencil94.width/2, -pencil94.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(unicorn6, -unicorn6.width/2, -unicorn6.height/2, 71, 131);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(unicorn7, -unicorn7.width/2, -unicorn7.height/2);
  popMatrix();
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(unicorn8, -unicorn8.width/2, -unicorn8.height/2);
  popMatrix();
  
}
  
}

