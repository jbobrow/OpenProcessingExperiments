
int nuages = 4;
int etat;

final int ON = 1;
final int OFF = 0;

float[] x;
float[] y;
float[] v;

void setup() {
  size(400, 400);
  smooth();

  etat = OFF;


  x = new float[nuages];
  y = new float[nuages];
  v = new float[nuages];

  for ( int i =0; i < nuages; i++ ) {
    x[i] = random(width);
    y[i] = random(0, 200);
    v[i] = random(0.5, 0.1);
  }
}



void draw() {



  //Ciel
  background(13, 83, 255);


  //Soleil
  noStroke();
  float rayonSoleil = 112.5 ;

  float distanceSoleil = dist( mouseX, mouseY, 270, 85 );
  if ( distanceSoleil < rayonSoleil/2 ) {
    // mouseOver
    fill(255, 200, 0);
  } 
  else {
    fill(232, 84, 47);
  }
  //ellipse( x , y , rayonSoleil * 2 , rayonSoleil * 2);

  ellipse( 270, 85, rayonSoleil, rayonSoleil );



  //nuages
  for ( int i =0; i < nuages; i++ ) {
    x[i] = x[i] + v[i];
    if ( x[i] > width + 176 ) {
      x[i] = -30;
      y[i] = random(height/2);
    }
    nuage(x[i], y[i]);
  }



  float x = width/2;
  float y = height/2;






  //Gazon
  fill(22, 137, 0);
  rect(0, 200, 400, 200);

  //moutarde
  noStroke();
  fill(255, 235, 3);
  rect(10, 150, 40, 110);
  rect(15, 140, 30, 10);
  triangle(20, 140, 30, 110, 40, 140);



  //Corps
  stroke(255, 3, 19);
  strokeWeight(85);
  strokeJoin(ROUND);

  line(x-125, y+100, x+125, y+100);

  //Pattes
  stroke(0);
  strokeWeight(2);
  for (int j =  65; j < 340; j += 10) {
    line(j, y+142, j, y+150);

    //pieds
    fill(0);
    ellipse(j, 351, 3, 2);
  }


  //yeux


  noStroke();
  fill(255);
  ellipse(x-80, y+60, 50, 50);
  ellipse(x+80, y+60, 50, 50);


  //pupilles
  float xOeilG = x-80;
  float yOeilG = y+60;
  float xOeilD = x+80;
  float yOeilD = y+60;


  float anglePupilleG = atan2(mouseY- yOeilG, mouseX-xOeilG);
  float anglePupilleD = atan2(mouseY- yOeilD, mouseX-xOeilD);

  xOeilG = cos ( anglePupilleG ) * 15 + x-80;
  yOeilG = sin ( anglePupilleG ) * 15 + y+60;

  xOeilD = cos ( anglePupilleD ) * 15 + x+80;
  yOeilD = sin ( anglePupilleD ) * 15 + y+60;


  fill(0);



  float distanceOeilG = dist(x-80, y+60, mouseX, mouseY);
  if (distanceOeilG < 15)
    ellipse(mouseX, mouseY, 20, 20);
  else
    ellipse(xOeilG, yOeilG, 20, 20);



  float distanceOeilD = dist(x+80, y+60, mouseX, mouseY);
  if (distanceOeilD < 15)
    ellipse(mouseX, mouseY, 20, 20);
  else
    ellipse(xOeilD, yOeilD, 20, 20);


  //moustache
  noStroke();
  fill(57, 44, 1);
  beginShape();
  curveVertex(x-69, y+87);
  curveVertex(x+69, y+123);
  curveVertex(x, y+98);
  curveVertex(x-75, y+123);
  curveVertex(x, y+84);
  curveVertex(x+69, y+123);
  curveVertex(x-51, y+158);
  endShape();

  //nose
  fill(173, 133, 0);
  ellipse(x, y+87, 20, 20);

  fill(0);
  ellipse(x-5, y+87, 5, 5);
  ellipse(x+5, y+87, 5, 5);

  //bouche

  noFill();
  stroke(0);
  strokeWeight(4);

  if ( etat == ON ) {
    arc(x, y+115, 50, 40, 0, PI);
  } 
  else {


    arc(x, y+127, 50, 40, PI, 6.20);
  }




  //arc(x, y+115, 50, 40, 0, PI);

  if (mousePressed) {
    if ( mouseX > 10 && mouseX < 50 && mouseY > 150 && mouseY < 260 ) {
      noStroke();
      fill(255, 235, 3);
      rect(0, 0, 400, 400);
    }
  }


  fill(0);
  text("must\nard", 15, 175);
}



//  nuage
void nuage(float x, float y) {


  noStroke();
  fill(255, 255, 255, 160);
  beginShape();
  curveVertex(x+7, y-196);
  curveVertex(x+40, y-131);
  curveVertex(x-49, y-109);
  curveVertex(x-121, y-71);
  curveVertex(x-176, y-140);
  curveVertex(x+40, y-131);
  curveVertex(x-72, y+48);
  endShape();
}




void mousePressed() {

  if ( mouseX > 175 && mouseX < 225 && mouseY > 305 && mouseY < 340 ) {
    if ( etat == OFF ) {
      etat = ON;
    }
    else {
      etat = OFF;
    }
  }
}



