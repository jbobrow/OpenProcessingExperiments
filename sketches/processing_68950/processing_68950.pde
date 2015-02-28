
int pointX, pointY, distance;

int ellipseX = 100;
int ellipseY = 200;
int ellipseR = 25;

int rectX = 250;
int rectY = 200;
int rectCote = 50;

int rectState = 0;
int circleState = 0;

int rectCounter = 0;
float circleCounter = 0;


void setup() {

  size(400, 400);
  background(135);
  smooth();
  frameRate(20);
  noStroke();
}

void draw() { 
  background(135);

  dessinerRect();
  dessinerEllipse();
}

//Detection du click de souris

void mousePressed() {

  if (mouseX > (rectX - (rectCote/2)) && mouseX < (rectX + (rectCote/2)) && mouseY > (rectY - (rectCote/2)) && mouseY < (rectY + (rectCote/2))) { 
    rectState = 1;
  }



  float distance = dist( mouseX, mouseY, ellipseX, ellipseY ) ;
  if ( distance < ellipseR ) {
    if (circleState == 0) {
      circleState = 1;
    }
    else circleState = 0;
  }
}

void mouseReleased() {

  rectState = 0;
}


// ************************************************* Fonction Carree 
void dessinerRect() {
  
  int i=0;
  while (i < rectCounter) {

    stroke(0);
    line(0, i, 400, i);
    i+=20;
  }

  if (rectState == 1) {


    rectMode(CENTER);
    fill(100, 0, 0);
    rect(rectX, rectY, rectCote, rectCote);

    if (rectCounter < 400) {
      rectCounter += 20;
      //println(rectCounter);
    }
  }


  else { 


    rectMode(CENTER);
    fill(0, 255, 0);
    rect(rectX, rectY, rectCote, rectCote);

    if (rectCounter > 0) { 
      rectCounter = rectCounter - 20;
      //println(rectCounter);
    }
  }

  
}

//************************************** Fonction ellipse
void dessinerEllipse() {

  if (circleState == 1) {

    ellipseMode(CENTER);
    fill(100, 0, 0);
    ellipse(ellipseX, ellipseY, ellipseR*2, ellipseR*2);
    if (circleCounter < TWO_PI) { 
      circleCounter += 0.1;
      
      
    }
  }



  else {

    ellipseMode(CENTER);
    fill(0, 255, 0);
    ellipse(ellipseX, ellipseY, ellipseR*2, ellipseR*2);
    if (circleCounter > 0) { 
      circleCounter -= 0.1;
    }
  }


  float j=0;
  while (j < circleCounter) {
    //println(circleCounter);

 j+= (TWO_PI/30);
    float x1 =  ellipseX + cos(j) * ellipseR *2;
    float y1 = ellipseY + sin(j) * ellipseR *2;
    float x2 =   ellipseX + cos(j) * ellipseR;
    float y2 = ellipseY + sin(j) * ellipseR;

    stroke(0);
    line(x1, y1, x2, y2);

   
  }
}


