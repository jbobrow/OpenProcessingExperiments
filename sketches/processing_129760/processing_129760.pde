
int monstertjeX;
int monstertjeY = 100;
int richting = 5;
int teller = 0;
int balletjeY = 100;
int balletjeX= 100;
boolean test;
float kleur;
int breedte=200;
int hoogte=200;

void setup() {
  size(200, 200);
  //monstertjeX = 100;//aan doen voor alleen omhoog
}

void draw () {
  background(255);
  achtergrond ();
  oor();
  lichaam ();
  mond ();
  tand ();
  ogen ();
  voeten ();
  richting ();



  if (test == true) {
    fill(0);
  } 
  else {
    fill(255, 0, 0);
  }
}


void achtergrond () {
  while (breedte > 0) {
    rectMode(CENTER);
    fill(breedte);

    noStroke();
    rect (width/2, height/2, breedte, hoogte);
    breedte=breedte-5;
    hoogte=hoogte-5;
  }

  breedte=200;
  hoogte=200;
  kleur=255;
}


void oor () {
  if (test == true) {
    fill(0);
  } 
  else {
    fill(255, 0, 0);
  }
  //colorMode(RGB);
  stroke(1);
  ellipseMode(CENTER);
  ellipse (monstertjeX-40, monstertjeY-60, 20, 50); //oor links
  ellipse (monstertjeX+40, monstertjeY-60, 20, 50); //oor rechts
  ellipse (monstertjeX-40, monstertjeY-60, 10, 20); //binnen oor links

  ellipse (monstertjeX+40, monstertjeY-60, 10, 20); //binnen oor rechts
}

void lichaam () {
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
}

void mond () {
  stroke(1);
  strokeWeight(1);

  if (test == true) {
    fill(0);
  } 
  else {
    fill(100, 0, 0);
  }
  ellipse(monstertjeX, monstertjeY, 70, 20);   //mond
}


void tand () {
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
}

void ogen () {

  fill(0);
  ellipse(monstertjeX+30, monstertjeY-30, 5, 20); //oog rechts

  ellipse(monstertjeX-20, monstertjeY-30, 5, 20); //oog links
}

void voeten () {
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

void richting () {
  monstertjeX=monstertjeX+richting;

  //als monstertje de rand raakt dan omkeren
  if (monstertjeX > width ||monstertjeX<0) { 
    richting=-richting;
    tellertje();
  }
}

void tellertje () {

  if (teller==10) {
    teller=0;
    test=!test;
  }

  teller = teller+1;
  println(teller);
}

