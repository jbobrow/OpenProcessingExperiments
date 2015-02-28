
monstertje mijnMonstertje;
monstertje mijnMonstertje2;
monstertje mijnMonstertje3;


void setup() {
  size(400, 400);
  mijnMonstertje = new monstertje (200, 30, 5);
  mijnMonstertje2= new monstertje (80, 80, 10);
  mijnMonstertje3= new monstertje (300, 200, 12);


  //monstertjeX = 100;//aan doen voor alleen omhoog
}

void draw () {
  background(255);


  mijnMonstertje.update();
  mijnMonstertje.testRand();
  mijnMonstertje.drawMonster();

  mijnMonstertje2.update();
  mijnMonstertje2.testRand();
  mijnMonstertje2.drawMonster();


  mijnMonstertje3.update();
  mijnMonstertje3.testRand();
  mijnMonstertje3.drawMonster();
}

class monstertje {
  int monstertjeX;
  int monstertjeY;
  int richting;
  int teller;
  boolean test;

  monstertje(int tempX, int tempY, int tempRichting) {
    monstertjeX = tempX;
    monstertjeY = tempY;
    richting = tempRichting;
    test= true;
  }



void update() {
  monstertjeY = monstertjeY + richting;
}

void testRand() {
  if (monstertjeY < 0 || monstertjeY > height) {
    richting=-richting;

    if (teller == 10) {
      teller = 0;
      test = !test;
    }
    teller = teller + 1;
  }
}

void drawMonster () {

  if (test == true) {
    fill(0);
  } 
  else {
    fill(255, 0, 0);
  }
  stroke(1);
  ellipseMode(CENTER);
  ellipse (monstertjeX-40, monstertjeY-60, 20, 50); //oor links
  ellipse (monstertjeX+40, monstertjeY-60, 20, 50); //oor rechts
  ellipse (monstertjeX-40, monstertjeY-60, 10, 20); //binnen oor links

  ellipse (monstertjeX+40, monstertjeY-60, 10, 20); //binnen oor rechts


  if (test == true) {
    fill(0);
  } 
  else {
    fill(255, 0, 0);
  }
  rectMode(CORNER);
  strokeWeight(2);
  noStroke();
  ellipse (monstertjeX, monstertjeY+10, 120, 160); //lichaam
  rect (monstertjeX-60, monstertjeY+20, 120, 70);  //lichaam


  stroke(1);
  strokeWeight(1);

  if (test == true) {
    fill(0);
  } 
  else {
    fill(100, 0, 0);
  }
  ellipse(monstertjeX, monstertjeY, 70, 20);   //mond



  if (test == true) {
    fill(0);
  } 
  else {
    fill(255);

    rect(monstertjeX-10, monstertjeY-10, 10, 10); //tand
    rect(monstertjeX, monstertjeY-10, 10, 10);//tand
    rect(monstertjeX+10, monstertjeY-9, 10, 10);//tand
    rect(monstertjeX-20, monstertjeY-9, 10, 10);//tand
  }

  if (test == true) {
    fill(0);
  } 
  else {
    fill(255, 0, 0);
  }
  fill(0);
  ellipse(monstertjeX+30, monstertjeY-30, 5, 20); //oog rechts

  ellipse(monstertjeX-20, monstertjeY-30, 5, 20); //oog links


  strokeWeight(2);

  if (test == true) {
    fill(0);
  } 
  else {
    fill(255, 0, 0);
  }

  ellipse(monstertjeX-40, monstertjeY+90, 70, 10);//linkervoet
  ellipse(monstertjeX+40, monstertjeY+90, 70, 10);//rechtervoet

  ellipse (monstertjeX-50, monstertjeY+20, 40, 10); //arm links
  ellipse (monstertjeX+50, monstertjeY+20, 40, 10); //arm rechts
}
}
