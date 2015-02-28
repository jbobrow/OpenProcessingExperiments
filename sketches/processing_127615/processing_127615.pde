
//DECLARE VARS

int monsterposX;
int monsterposY;
int monsterDirectionY;



int counter;
boolean tenCounts;

color bodyColor;

int strokeX;

int strokeRectHeight;
int strokeRectWidth;

int strokeSpace;




//SETUP

void setup() {
  size(800, 800);
  background(255);
  
//SET VARS

  //MOVEMENT
  monsterposX = width/2;
  monsterposY = height;
  monsterDirectionY = 10;
  
  
  //kleurtjes
  counter = 0;
  tenCounts = true;
  
  bodyColor = color(200, 200, 100);
  
  //strokeloop
  
  strokeX = 0;
  
  strokeRectHeight = 10;
  strokeRectWidth = width;
  
  strokeSpace = strokeRectHeight + 10;
}



//DRAW
void draw() {
  background(0,150,0);
  
  
  //streepjes
   for(int i = 10; i < height; i = i +20)  {
   fill(0,200,0);
   noStroke();
   rect(strokeX, i, strokeRectWidth, strokeRectHeight);
   }
  
 //monster
 monster();
 movement();
 kleurverandering();
  
  //UPDATE VARS
  
  
  //beweging
  
 
 //kleurtjes veranderen

     
  println(monsterposY);
  println(counter);
  println(tenCounts);
  
  
  
}

void monster() {
  //LICHAAM


  stroke(0);
  fill(bodyColor);
  ellipse(monsterposX+110, monsterposY+30, 35, 35);

  stroke(0);
  fill(bodyColor);
  ellipse(monsterposX+90, monsterposY+40, 45, 45);

  stroke(0);
  fill(bodyColor);
  ellipse(monsterposX+70, monsterposY+50, 50, 50);

  stroke(0);
  fill(bodyColor);
  ellipse(monsterposX+50, monsterposY+50, 50, 50);

  stroke(0);
  fill(bodyColor);
  ellipse(monsterposX+30, monsterposY+30, 50, 50);


  //HOOFDJE

  stroke(0);
  fill(bodyColor);
  ellipse(monsterposX, monsterposY, 80, 80);

  stroke(0);  //oog li
  fill(240);
  ellipse(monsterposX-20, monsterposY-10, 20, 25);
  
  stroke(0); //pupil li
  fill(0);
  ellipse(monsterposX-20, monsterposY-15, 3,3);

  stroke(0);  //oog re
  fill(240);
  ellipse(monsterposX+20, monsterposY-10, 20, 25);
  
  stroke(0); //pupil re
  fill(0);
  ellipse(monsterposX+20, monsterposY-15, 3,3);

  stroke(0);
  fill(200, 100, 100);
  ellipse(monsterposX, monsterposY, 20, 20);
  
  stroke(0);
  fill(200);
  triangle(monsterposX-25,monsterposY-30,monsterposX+25,monsterposY-30,monsterposX,monsterposY-70);
}


void movement() {
  monsterposX = mouseX;
  
  monsterposY = monsterposY - monsterDirectionY;
  
 if (monsterposY < 0 || monsterposY > height) {
   monsterDirectionY = -monsterDirectionY;
   counter = counter +1;
 }
}

void kleurverandering() { if (counter == 10) {
   counter = 0;
   tenCounts = !tenCounts;
 }
 
 if (tenCounts) { 
   bodyColor = color(200, 200, 100);
 }
 
 else if (!tenCounts) {
   bodyColor = color(200, 0, 0);
 }}
