
float radiusB; 
float radiusA;

float radiansV;
float radiansH;

float VBx;
float VBy;
float HBx;
float HBy;
float VAx;
float VAy;
float HAx;
float HAy;

float rv;
float rh ;

boolean min;
boolean spagat;
boolean tid;

String snakke;

float[] tall = new float[100];
int teller = 0;

void setup() {
  //size må være 500,500
  size(500, 500);
  radiusB = (height/1.5) - (height/3);
  radiusA = ((height/1.5) - (height/3)) / 1.5;
}

void draw() {
  //Denne kodesamlingen gjør at armer og ben går automatisk
  //med intensitet styrt av musens y verdi
  //For å bruke denne konden må radiansV og radiansH
  //bytte ut mouseY med rv og rh som map argumenter
  /*
  // Bytter mellom true og false verdi på rv 
   if (rv <= 0) {
   min = true;
   }
   else if (rv >= height) {
   min = false;
   }
   
   // Automatisk radians med intensitet styrt av mouseY 
   if (min == true) {
   rv += 0.1 + (mouseY/5);
   rh += 0.1 + (mouseY/5);
   }
   else {
   rv -= 0.1 + (mouseY/5);
   rh -= 0.1 + (mouseY/5);
   }
   */
  
  float check = radiansV;
  // Ramme for radianse/roteringsverdier
  radiansV = map(mouseY, 0, height, PI + QUARTER_PI, HALF_PI);
  radiansH = map(mouseY, 0, height, -QUARTER_PI, HALF_PI);
  
  if(check != radiansV){
    tid = false;
  }

  tall[teller] = radiansV; 
  teller += 1;
  if (teller == 100) {
    float first = tall[0];
    for (int i = 1; i < tall.length; i++) {
      float next = tall[i];
      if (first != next) {
        tid = false;
        break;
      }
      if (i == 99) {
        tid = true;
      }
    }
    teller = 0;
  }
  
  //println(teller);

  // Roteringsverdier
  VBx = width/2 + cos(radiansV) * radiusB;
  VBy = height/1.5 + sin(radiansV) * radiusB;
  HBx = width/2 + cos(radiansH) * radiusB;
  HBy = height/1.5 + sin(radiansH) * radiusB;
  VAx = width/2 + cos(radiansV) * radiusA;
  VAy = height/2 + sin(radiansV) * radiusA;
  HAx = width/2 + cos(radiansH) * radiusA;
  HAy = height/2 + sin(radiansH) * radiusA;

  // Bytter uttrykk på sketchen på grunnlag av radianseverdi
  if (radiansV >= 3.14) {
    spagat = true;
  }
  else {
    spagat = false;
  }

  background(255);

  // Kropp
  line(width/2, height/3, width/2, height/1.5);

  // Hode
  ellipse(width/2, (height/3), 80, 120);

  // Hår
  line(width/2, (height/3) - 60, width/2, (height/3) - 80);
  pushStyle();
  beginShape();
  curveVertex(width/2.03, (height/3) - 70);
  curveVertex(width/2, (height/3) - 60);
  curveVertex(width/2.12, (height/3) - 70);
  curveVertex(width/2, height/2);
  endShape();
  beginShape();
  curveVertex(width/1.9, (height/3) - 70);
  curveVertex(width/2, (height/3) - 60);
  curveVertex(width/1.9, (height/3) - 70);
  curveVertex(width/2, height/2);
  endShape();
  popStyle();

  // Nese
  pushStyle();
  strokeWeight(6);
  point(width/2, height/2.8);
  strokeWeight(2);
  popStyle();

  // Snakkeboks
  beginShape();
  curveVertex(width/1.4, height/1);
  curveVertex(width/2.5, height/2.5);
  curveVertex(width/3.5, height/4.5);
  curveVertex(width/15, height/4.5);
  curveVertex(width/15, height/20);
  curveVertex(width/2.3, height/20);
  curveVertex(width/2.3, height/4.5);
  curveVertex(width/2.8, height/4.5);
  curveVertex(width/2.5, height/2.5);
  endShape(CLOSE);

  if (spagat == true) {
    // Øyne
    ellipse((width/2)-15, (height/3)-10, 20, 25);
    ellipse((width/2)+15, (height/3)-10, 20, 25);
    pushStyle();
    strokeWeight(3);
    point((width/2)-15, (height/3)-10);
    point((width/2)+15, (height/3)-10);
    strokeWeight(2);
    popStyle();

    // Munn
    pushStyle();
    beginShape();
    curveVertex((width/2)-15, height/1.8);
    curveVertex((width/2)-15, height/2.5);
    curveVertex((width/2), height/2.4);
    curveVertex((width/2)+15, height/2.5);
    curveVertex((width/2)+15, height/1.8);
    endShape();
    popStyle();

    // Tekst
    snakke = "AU!!! Faen til strekk i lysken da";
  }
  else {
    // Øyne
    ellipse((width/2)-15, (height/3)-10, 20, 15);
    ellipse((width/2)+15, (height/3)-10, 20, 15);
    pushStyle();
    strokeWeight(4);
    point((width/2)-15, (height/3)-8);
    point((width/2)+15, (height/3)-8);
    strokeWeight(2);
    popStyle();

    // Munn
    pushStyle();
    beginShape();
    curveVertex((width/2)-15, height/2.7);
    curveVertex((width/2)-15, height/2.5);
    curveVertex((width/2), height/2.4);
    curveVertex((width/2)+15, height/2.5);
    curveVertex((width/2)+15, height/2.7);
    endShape();
    popStyle();

    // Tekst
    snakke = "Føler meg meget bra må jeg si";
  }

  if (tid == true) {
    // Tekst
    snakke = "ZZZZZZzzzz...";
  }
  
  // Teksttil
  pushStyle();
  fill(0);
  textSize(20);
  text(snakke, width/13, height/18, width/2.7, height/4.7);
  popStyle();
  
  // Ben og armer
  line(width/2, height/1.5, VBx, VBy);
  line(width/2, height/1.5, HBx, HBy);
  line(width/2, height/2, VAx, VAy);
  line(width/2, height/2, HAx, HAy);
}



