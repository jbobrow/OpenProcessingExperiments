
float midaFulles = 50;
float arbust = 30;
float floretes = 5;
float semafor = 15; 
float xratlla = 100;
float yratlla = 10;

float hora = hour();
float minut = minute();
float segon = second ();

PFont lletra;

//////////////////////////////////////


void setup () {
  size(600, 500);
  lletra = loadFont("OratorStd-Slanted-48.vlw");
}

//////////////////////////////////////

void draw () {
  background(#8BD8F2);
  colorFons();

  //MONTE
  noStroke();
  fill (#81BF81);
  ellipse(350, 190, 370, 150);
  fill (#93D693);
  ellipse(500, 190, 220, 120);

  //CARRETERA
  fill (#999A9B);
  rect (0, 190, width, 310);

  //ARBRE
  fill(#8B725A);
  rect(80, 70, 50, 100);

  parche();
 
 //nido
  fill(#524437);
  ellipse (109, 115, 10, 12);

  //fulles arbre
  fill(#4A955F);
  ellipse(85, 75, midaFulles, midaFulles);
  ellipse(125, 75, midaFulles, midaFulles);
  ellipse(70, 55, midaFulles, midaFulles);
  ellipse(140, 55, midaFulles, midaFulles);
  ellipse(90, 35, midaFulles, midaFulles);
  ellipse(123, 35, midaFulles, midaFulles);
  ellipse(110, 45, midaFulles, midaFulles);

  //ARBUSTOS

  fill(#579B58);
  ellipse(28, 162, arbust, arbust);
  ellipse(53, 162, arbust, arbust);
  ellipse(25, 145, arbust, arbust);
  ellipse(55, 145, arbust, arbust);
  ellipse(40, 135, arbust, arbust);
  ellipse(40, 145, arbust, arbust);

  fill(#F59E9E);
  ellipse(29, 160, floretes, floretes);
  ellipse(40, 133, floretes, floretes);
  ellipse(25, 143, floretes, floretes);
  ellipse(57, 143, floretes, floretes);
  ellipse(53, 160, floretes, floretes);
  ellipse(41, 149, floretes, floretes);

  //vorera
  fill (#B4B8B9);
  rect (0, 170, width, 20);

  //RATLLES FILA 1
  fill(255);
  rect(0, 280, xratlla/2+20, yratlla);
  rect(155, 280, xratlla, yratlla);
  rect(340, 280, xratlla, yratlla);
  rect(520, 280, xratlla, yratlla);

  //RATLLES FILA 2
  rect(0, 390, xratlla/2+20, yratlla);
  rect(155, 390, xratlla, yratlla);
  rect(340, 390, xratlla, yratlla);
  rect(520, 390, xratlla, yratlla);

  //SEMÃ�ï¿½Ã¯Â¿Â½FOR
  fill(#1C4829);
  rect (540, 100, 7, 70);
  rect (530, 38, 26, 67);

  fill(#FF3B3F);
  ellipse(543, 51, semafor, semafor);
  fill(#F5DB92);
  ellipse(543, 71, semafor, semafor);
  fill(#4BE078);
  ellipse(543, 91, semafor, semafor);

  //CARTELL
  fill(#766A5D);
  rect (417, 140, 5, 30);
  rect (469, 140, 5, 30);
  rect (400, 105, 90, 45);


  String hora= str(hour());
  String minut= str(minute());
  String segon= str(second());

  if (hour() < 10) {
    hora = "0" + hora;
  }
  if (minute() < 10) {
    minut = "0" + minut;
  }
  if (second() < 10) {
    segon = "0" + segon;
  }

  if (mousePressed==true) {
    fill(255);
    textFont(lletra);
    textSize(28);
    text (hora+":"+minut, 409, 137 );
  }


  //DIBUIXAR FUNCIONS

  dibuixaCotxe();
  dibuixaTaxi ();
  dibuixaBeetle ();
  dibuixaSol();
}


///////////////////////// FUNCIONS /////////////////////////

//SEGONS
void dibuixaCotxe () {

  float segons = map (second(), 0, 59, -120, width);

  fill (#F74B51);
  rect(segons, 440, 120, 40);
  fill (#E5FFFD);
  stroke (#F74B51);
  strokeWeight(6);
  quad(segons+15, 441, segons+30, 411, segons+80, 411, segons+105, 441);
  strokeWeight(4);
  line (segons+70, 411, segons+70, 441);
  line (segons+39, 411, segons +39, 441);

  //rodes
  fill(0);
  noStroke();
  ellipse (segons+25, 480, 25, 25);
  ellipse (segons+95, 480, 25, 25);
}

//MINUTS
void dibuixaTaxi () {

  float minuts = map (minute(), 0, 59, -120, width);

  fill (#F5DA6D);
  rect(minuts, 334, 126, 35);
  fill (#EDFFFD);
  stroke (#F5DA6D);
  strokeWeight(6);
  quad(minuts+15, 335, minuts+30, 305, minuts+80, 305, minuts+110, 335);
  strokeWeight(4);
  line (minuts+72, 305, minuts+72, 335);
  line (minuts+39, 305, minuts +39, 335);

  //rodes
  fill(0);
  noStroke ();
  ellipse (minuts+25, 370, 25, 25);
  ellipse (minuts+100, 370, 25, 25);

  rect (minuts+53, 297, 15, 6);
  fill (#55C466);
  rect (minuts+59, 297, 5, 6);

  fill (0);
  rect (minuts+53, 340, 6, 6);
  rect (minuts+65, 340, 6, 6);
  rect (minuts+41, 340, 6, 6);
  rect (minuts+59, 346, 6, 6);
  rect (minuts+47, 346, 6, 6);
}

//HORES
void dibuixaBeetle () {

  float hores = map (hour(), 0, 23, -114, width);

  fill (#E5FFFD);
  stroke (#29669B);
  strokeWeight(6);
  ellipse (hores+59, 227, 84, 60);
  fill (#29669B);
  rect(hores, 227, 118, 30);
  strokeWeight(4);
  line (hores+50, 200, hores +50, 225);

  //rodes
  fill(0);
  noStroke();
  ellipse (hores+24, 260, 25, 25);
  ellipse (hores+95, 260, 25, 25);
}



void dibuixaSol () {

  fill(#F7F7C3);
  ellipse(255, 45, 60, 60);

  //NUVOLS

  fill(#BCBCBC);
  noStroke();
  ellipse(300, 50, 43, 43);
  ellipse(330, 50, 50, 50);
  ellipse(360, 50, 43, 43);

  fill(#D3D3D3);
  ellipse(270, 70, 36, 36);
  ellipse(300, 70, 43, 43);
  ellipse(330, 70, 36, 36);
}

///////////////////////////////////////

void colorFons () {
  if (hora<19 && hora> 6 == true ) {
    background (#8BD8F2);
  } else {
    background (#406798);
  }
}


void parche () {

  if (hora<19 && hora> 6 == true ) {

    fill(#8BD8F2);
    ellipse (60, 120, 60, 140);
    ellipse (150, 120, 60, 140);
  } else {

    fill(#406798);
    ellipse (60, 120, 60, 140);
    ellipse (150, 120, 60, 140);
  }
}

