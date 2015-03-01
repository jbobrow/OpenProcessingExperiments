
//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////Citlali Hernández Sánchez//////
//////////////////////////////////////////////////////////////////////MUAD 2014/////////////////////
////////////////////////Basado en la teoría de L-Systems de Lindenmayer, descrito en "The Algorithimc Beauty of Plants"
///////////////////////y en el capítulo 8.5 "Trees" de "The Nature of Code" de Daniel Shiffman
///////////////////////Basado en el sketch en OpenProcessing disponible en: http://www.openprocessing.org/sketch/103748

////////////////////////////////// V A R I A B L E S 

int levelsMin = 2;
int levelsMax = 4;

int levelsMin2 = 1;
int levelsMax2 = 3;

int levelsMin3 = 2;
int levelsMax3 = 5;

float initialLength = 22;

float miAngulo;
float ruido1= 0.0047;
float variacion1;

float miAngulo2;
float ruido2= 0.002;
float variacion2;

float miAngulo3;
float ruido3= 0.009;
float variacion3;

//extra_no_uso
float ang_tod;
float ruid_tod= 0.0015;
float var_tod;

float sw;
float col;
float col2;

int currentLevels;
int currentLevels2;
int currentLevels3;

float currentAngle;
float currentAngle2;
float currentAngle3;

float currentLength;
float currentLength2;
float currentLength3;

//////////////////////////////////////// S E T U P

void setup() {
  //size(800, 800, P2D);
  size(800, 600);
  //stroke(pointColor);
  strokeWeight(2);
  smooth();
  //frameRate(5);
}


//////////////////////////////////////////// D R A W 

void draw() {
  background(150);
  noStroke();
  fill(173, 191, 189);
  ellipse(width/2, height/2, 380, 380);

  definicion_parametros();
  las_algas();
  /* noStroke();
   //fill(247,246,230,120);
   fill(173, 191, 189);
   //fill(173, 191, 189, 200);
   ellipse(width/2, height/2, ang_tod, ang_tod);*/
}


void las_algas() {
  pushMatrix(); ///////////////////// 
  translate(width/2, height/2); 
  String rules = recursiveFractalPlant(currentLevels, "X");  
  //println(rules);

  ///ALGA 1
  pushMatrix();
  drawFractalPlantBranch (currentLength, currentAngle, rules, frameCount/*%rules.length()*/);
  popMatrix();
  ///ALGA 2
  pushMatrix(); ///////////////////// save the world transformation matrix
  //translate(width/2, height/2);
  rotate(radians(miAngulo-120));
  drawFractalPlantBranch (currentLength, -currentAngle, rules, frameCount/*rules.length()*/); 
  popMatrix();
  //ALGA3
  pushMatrix(); ///////////////////// save the world transformation matrix
  //translate(width/2, height/2);
  rotate(radians(miAngulo+120));
  drawFractalPlantBranch (currentLength, -currentAngle, rules, frameCount/*%rules.length()*/); 
  popMatrix();


  ///////////////////
  ///ALGA 4
  pushMatrix();
  rotate(radians(miAngulo+60));
  drawFractalPlantBranch (currentLength2, -currentAngle2, rules, frameCount/*%rules.length()*/); 
  popMatrix();
  //Alga 5
  pushMatrix();
  rotate(radians(miAngulo+180));
  drawFractalPlantBranch (currentLength2, currentAngle2, rules, frameCount/*%rules.length()*/); 
  popMatrix();
  //Alga6
  pushMatrix();
  rotate(radians(miAngulo+300));
  drawFractalPlantBranch (currentLength2, -currentAngle2, rules, frameCount/*%rules.length()*/); 
  popMatrix();

  ///////////////////
  ///ALGA 7
  pushMatrix();
  rotate(radians(miAngulo+30));
  drawFractalPlantBranch (currentLength3, currentAngle3, rules, frameCount/*%rules.length()*/); 
  popMatrix();

  //Alga 8
  pushMatrix();
  rotate(radians(miAngulo+90));
  drawFractalPlantBranch (currentLength3, currentAngle3, rules, frameCount/*%rules.length()*/); 
  popMatrix();

  //Alga 9
  pushMatrix();
  rotate(radians(miAngulo+150));
  drawFractalPlantBranch (currentLength3, currentAngle3, rules, frameCount/*%rules.length()*/); 
  popMatrix();

  ///ALGA 10
  pushMatrix();
  rotate(radians(miAngulo+210));
  drawFractalPlantBranch (currentLength3, -currentAngle3, rules, frameCount/*%rules.length()*/); 
  popMatrix();

  //Alga 11
  pushMatrix();
  rotate(radians(miAngulo+270));
  drawFractalPlantBranch (currentLength3, -currentAngle3, rules, frameCount/*%rules.length()*/); 
  popMatrix();

  //Alga 12
  pushMatrix();
  rotate(radians(miAngulo+330));
  drawFractalPlantBranch (currentLength3, currentAngle3, rules, frameCount/*%rules.length()*/); 
  popMatrix();


  popMatrix(); //////////////////////fin_primer_pushMatrix
}


////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////// NIVELES Y LENGTHS

void definicion_parametros() {
  /// Perlin Noise aplicado al ángulto
  variacion1+= ruido1;
  miAngulo= noise(variacion1)*PI/3;

  variacion2+= ruido2;
  miAngulo2= noise(variacion2)*PI/4;

  variacion3+= ruido3;
  miAngulo3= noise(variacion3)*PI/5;

  currentAngle = miAngulo;
  currentAngle2 = miAngulo2; 
  currentAngle3 = miAngulo3; 

  currentLevels = (int) map(mouseY, height, 0, levelsMin, levelsMax); // mouse control of the generations count
  currentLevels2 = (int) map(mouseY, height, 0, levelsMin2, levelsMax2); // mouse control of the generations count
  currentLevels3 = (int) map(mouseY, height, 0, levelsMin3, levelsMax3); // mouse control of the generations count

  currentLength =  map(currentAngle%(height/currentLevels), height/currentLevels, 0, initialLength/(currentLevels+1), initialLength/(currentLevels)); // mouse control of the generations count
  currentLength2 =  map(currentAngle2%(height/currentLevels2), height/currentLevels2, 0, initialLength/(currentLevels2+1), initialLength/(currentLevels2)); // mouse control of the generations count
  currentLength3 =  map(currentAngle3%(height/currentLevels3), height/currentLevels3, 0, initialLength/(currentLevels3+1), initialLength/(currentLevels3)); // mouse control of the generations count

}


String recursiveFractalPlant(int levels, String sentence) {  //prepare rules for the turtle graphics
  //    http://en.wikipedia.org/wiki/L-system
  //    variables : X F
  //    constants : + - [ ]
  //    start  : X
  //    rules  : (X -> F-[[X]+X]+F[+FX]-X), (F -> FF)
  //    angle  : 25°

  String next = "";
  if (levels > 0) { // check if there are any levels left to render
    char[] characters = sentence.toCharArray();
    for (char c : characters) {
      switch (c) {  //interprets the rules derived from the nature
      case 'X':
        //  next+=recursiveFractalPlant(levels-1, "F-[[X]+X]+F[+FX]-X");
        next+=recursiveFractalPlant(levels-1, "F-[XX]+X+F[+FX]-XX");

        break;
      case 'F':
        if (mousePressed){next+=recursiveFractalPlant(levels-1, "FF");} else{
        next+=recursiveFractalPlant(levels-1, "X");}
        break;
      default:
        next+=String.fromCharCode(c);  //only works in JavScript mode!
        //next+=c;                       //only works in Java mode!
        break;
      }
    }
  }
  else {
    next=sentence;
  }
  return next;
}


void drawFractalPlantBranch(float length, float angle, String sentence, int which) {  //draw turtle graphics
  //    http://en.wikipedia.org/wiki/L-system
  //    variables : X F
  //    constants : + - [ ]
  //    angle  : 25°
  //    Here, F means "draw forward", - means "turn left 25°", and + means "turn right 25°".
  //    X does not correspond to any drawing action and is used to control the evolution of the curve.
  //    [ corresponds to saving the current values for position and angle, which are restored when
  //    the corresponding ] is executed.
  char[] characters = sentence.toCharArray();
  int i=0;

  col=255; // valor de color inicial
  sw=7; // strokeWeight Inicial

  for (char c : characters) {
    switch (c) {    //interprets the rules derived from the nature
    case '-':

      rotate(angle);
      //ellipse(0,0, 10,10);
      break;
    case '+':

      rotate(-angle);
      break;
    case '[':
      pushMatrix();
      // variable con grosor de línea aquí lo aumento y abajo lo bajo.
      //sw=max(sw-0.98, 0.1);
      sw=sw+0.9;
      col=col-35; 
      break;
    case ']':
      popMatrix();
      sw=max(sw-0.9, 0.01);
      //sw=sw+0.98;
      col=col+35; 
      break;
    case 'F':

      if (i<=which) {
        noStroke();
        strokeCap(ROUND);
        stroke(col, 0, 0, col);
        strokeWeight(sw);
        line(0, 0, 0, -length); // draw line "forwards"
        if (mousePressed) {
          noStroke();
          fill(0, col, 100, 100);
          ellipse(0, 0, 10, 10);
        }
      }
      translate(0, -length); // move the origin to the branch end
      break;
    }
    i++;
  }
}





