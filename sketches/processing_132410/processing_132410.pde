
//positie object

int posScore;   //aantal gevangen objecten
int negScore;  //levens 

object OBJECT1;
object OBJECT2;
object OBJECT3;
object OBJECT4;
object OBJECT5;      //verander de objecten in variabelen

void setup() {
  size(800, 800);
  smooth();

  OBJECT1 = new object();
  OBJECT2 = new object();
  OBJECT3 = new object();
  OBJECT4 = new object();
  OBJECT5 = new object();  //geef de variabele objecten een waarde

  negScore = 10;     //levens
  posScore = 0;     //aantal gevangen objecten
}

void draw() {
  background(0);
  drawCatcher();   // Teken de speler

    OBJECT1.drawObject();
  OBJECT1.objectFall();
  OBJECT1.objectCaught();
  OBJECT1.objectDropped();
  OBJECT1.levelUP();           //teken in totaal 5 keer het object

  OBJECT2.drawObject();
  OBJECT2.objectFall();
  OBJECT2.objectCaught();
  OBJECT2.objectDropped();
  OBJECT2.levelUP();

  OBJECT3.drawObject();
  OBJECT3.objectFall();
  OBJECT3.objectCaught();
  OBJECT3.objectDropped();
  OBJECT3.levelUP();

  OBJECT4.drawObject();
  OBJECT4.objectFall();
  OBJECT4.objectCaught();
  OBJECT4.objectDropped();
  OBJECT4.levelUP();

  OBJECT5.drawObject();
  OBJECT5.objectFall();
  OBJECT5.objectCaught();
  OBJECT5.objectDropped();
  OBJECT5.levelUP();


  loseGame();      //al je levens op is GAME OVER
}

void drawCatcher() {              //tekent de player
  noStroke();
  fill(175);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 50, 50);
}

void loseGame() {                //als al je levens op zijn verdwijnt het spel achter een zwart scherm dat GAME OVER zegt
  if (negScore < 1) {
    fill(0);
    noStroke();
    rect(0, 0, 800, 800);
    textSize(80);
    fill(255, 0, 0);
    text("GAME OVER", 200, 400);
  }
}

class object {
  float posx;    //
  float posy;   //positie object

  float speed;  //snelheid object


  object() {
    posx = random(width);    //
    posy = 0;               //positie object
    speed = random(1,4);    //snelheid object
  }

  void drawObject() {           //tekend het object
    noStroke();
    fill (random(255), random(255), random(255));
    ellipseMode(CENTER);  
    ellipse(posx, posy, 30, 30);
  }

  void objectFall() {          //zorgt ervoor dat het object valt
    posy = posy +speed;
  }


  void objectCaught() {        //als het object wordt gevangen wordt dan begint hij bovenaan en je krijgt een punt.
    if (posy < mouseY+25 && posy > mouseY-25  && posx < mouseX+25 && posx > mouseX-25) {
      posy = 0;
      posx = random(0, width);
      posScore = posScore +1;
      println(posScore);
      speed = random(1,3);
    }
  }

  void objectDropped() {    //als je het object niet vangt begint hij bovenaan en verlies je een leven
    if (posy > height) {
      posx = random(0, width);
      posy = 0;
      negScore = negScore -1;
    }
  }

  void levelUP() {        //als je 25 objecten vangt gaat de snelheid omhoog.
    if (posScore > 25) {
      speed = random(3,5);
      println("level up!");
      negScore = 10;
    }
  }
}



