
//DECLARE VARS

int monsterposX;
int monsterposY;


//SETUP

void setup() {
  size(800, 800);
  background(255);
  
  monsterposX = width/2;
  monsterposY = height;
}



//DRAW
void draw() {
  background(0,150,0);
  

  //LICHAAM


  stroke(0);
  fill(200, 200, 100);
  ellipse(monsterposX+110, monsterposY+30, 35, 35);

  stroke(0);
  fill(200, 200, 100);
  ellipse(monsterposX+90, monsterposY+40, 45, 45);

  stroke(0);
  fill(200, 200, 100);
  ellipse(monsterposX+70, monsterposY+50, 50, 50);

  stroke(0);
  fill(200, 200, 100);
  ellipse(monsterposX+50, monsterposY+50, 50, 50);

  stroke(0);
  fill(200, 200, 100);
  ellipse(monsterposX+30, monsterposY+30, 50, 50);


  //HOOFDJE

  stroke(0);
  fill(200, 200, 100);
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
  
  monsterposY = monsterposY - 1;
  
  monsterposX = mouseX;
  
}

