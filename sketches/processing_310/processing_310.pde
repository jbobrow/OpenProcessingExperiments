

/**
* TubularFlex font by Herbert Spencer, Nov. 2006
* This font was inspired by STUV font by Flor.o
* {http://www.profesores.ucv.cl/manuelsanfuentes/ .... press letter 't' for typefaces}
* and 'Supert Tipo Veloz' as an assembling principle of building font from discrete units
*/

Letter alphabet[];
Letter current;
Letter goal;
float opac;
float Q = HALF_PI;
PFont font;

void setup(){
  size(420,480);
  smooth();
  font = loadFont("font.vlw");
  alphabet = new Letter[26];
  initializeLetters();
}

void draw(){
  background(255);
  pushMatrix();
  {
    scale(2,2);
    grid();
    translate(70,80); //move everything to the upper corner of the grid  
    pushMatrix();
    {
      drawAndInterpolate();
    }
    popMatrix();
  }
  popMatrix();
}
class Letter {

  char c;
  float xlocs[], ylocs[];
  float rots[];

  Letter (char cin, 
  float xlocations[],
  float ylocations[],
  float rotations[]){

    xlocs = new float[6];
    ylocs = new float[6];
    rots = new float[6];

    c = cin;
    for (int i=0; i<6; i++){
      xlocs[i] = xlocations[i];
      ylocs[i] = ylocations[i];
      rots[i] = rotations[i];
    }
  }

  void render(){
    for (int i=0; i<6; i++){
      pushMatrix();
      {
        translate(xlocs[i],ylocs[i]);
        rotate(rots[i]);
        switch(i){
        case 0:
          p1();
          break;
        case 1:
          p2();
          break;
        case 2:
          p3();
          break;
        case 3:
          p4();
          break;
        case 4:
          p5();
          break;
        case 5:
          p6();
          break;
        }
      }
      popMatrix();
    }
  }
}
/* pieces order: _ _ L L J J  */

float[][] XL = {
     {60.0,60.0,50.0,20.0,20.0,20.0},   /* a */
     {0.0, 10.0,50.0,20.0,50.0,50.0},   /* b */
     {40.0,40.0,20.0,20.0,20.0,20.0},   /* c */
     {70.0,60.0,20.0,20.0,50.0,20.0},   /* d */
     {40.0,40.0,20.0,40.0,20.0,20.0},   /* e */
     {0.0,0.0,20.0,20.0,20.0,-10.0},    /* f */
     {70.0,60.0,20.0,20.0,50.0,50.0},   /* g */
     {10.0,0.0,80.0,50.0,20.0,20.0},    /* h */
     {40.0,40.0,50.0,50.0,20.0,20.0},   /* i */
     {60.0,60.0,40.0,40.0,40.0,40.0},   /* j */
     {60.0,10.0,50.0,50.0,20.0,-10.0},  /* k */
     {30.0,40.0,50.0,50.0,20.0,20.0},   /* l */
     {0.0,110.0,100.0,50.0,100.0,20.0}, /* m */
     {0.0,60.0,50.0,50.0,20.0,20.0},    /* n */
     {70.0,70.0,20.0,50.0,20.0,50.0},   /* o */
     {0.0,10.0,50.0,50.0,20.0,50.0},    /* p */
     {60.0,70.0,20.0,50.0,50.0,20.0},   /* q */
     {0.0,10.0,20.0,20.0,20.0,20.0},    /* r */
     {-40.0,-40.0,0.0,0.0,30.0,30.0},   /* s */
     {10.0,0.0,20.0,20.0,20.0,20.0},    /* t */
     {70.0,10.0,20.0,20.0,50.0,50.0},   /* u */
     {10.0,10.0,40.0,40.0,70.0,70.0},   /* v */
     {60.0,10.0,90.0,90.0,120.0,20.0},  /* w */
     {40.0,30.0,50.0,20.0,50.0,20.0},   /* x */
     {70.0,10.0,20.0,20.0,50.0,50.0},   /* y */
     {70.0,70.0,50.0,20.0,50.0,50.0}    /* z */
      };
      
float[][] YL = {
     {60.0,60.0,20.0,60.0,60.0,20.0},     /* a */
     {40.0,-30.0,20.0,60.0,20.0,60.0},    /* b */
     {70.0,70.0,20.0,60.0,20.0,60.0},     /* c */
     {-30.0,40.0,20.0,60.0,60.0,20.0},    /* d */
     {70.0,70.0,20.0,20.0,20.0,60.0},     /* e */
     {90.0,90.0,60.0,60.0,20.0,110.0},    /* f */
     {20.0,40.0,20.0,60.0,110.0,60.0},    /* g */
     {-30.0,60.0,60.0,20.0,20.0,20.0},    /* h */
     {20.0,20.0,60.0,60.0,60.0,60.0},     /* i */
     {60.0,20.0,110.0,110.0,110.0,110.0}, /* j */
     {60.0,-30.0,-10.0,20.0,20.0,60.0},   /* k */
     {30.0,-30.0,60.0,60.0,60.0,60.0},    /* l */
     {60.0,60.0,20.0,20.0,20.0,20.0},     /* m */
     {60.0,60.0,20.0,20.0,20.0,20.0},     /* n */
     {10.0,10.0,60.0,20.0,20.0,60.0},     /* o */
     {110.0,70.0,60.0,20.0,20.0,60.0},    /* p */
     {110.0,100.0,60.0,20.0,60.0,20.0},   /* q */
     {60.0,40.0,20.0,20.0,20.0,20.0},     /* r */
     {70.0,70.0,60.0,60.0,20.0,20.0},     /* s */
     {-30.0,40.0,60.0,60.0,-10.0,-10.0},  /* t */
     {20.0,20.0,60.0,60.0,60.0,60.0},     /* u */
     {40.0,20.0,60.0,60.0,20.0,20.0},     /* v */
     {40.0,20.0,60.0,60.0,20.0,60.0},     /* w */
     {30.0,50.0,60.0,20.0,20.0,60.0},     /* x */
     {20.0,20.0,60.0,60.0,60.0,110.0},    /* y */
     {70.0,70.0,60.0,20.0,60.0,60.0}      /* z */
      };
      
float[][] ROTS = {
     {-Q,-Q,2*Q,0,Q,-2*Q},    /* a */
     {-Q,Q,2*Q,0,-Q,0},       /* b */
     {0,0,Q,0,2*Q,Q},         /* c */
     {Q,-Q,Q,0,0,2*Q},        /* d */
     {0,0,Q,-Q,2*Q,Q},        /* e */
     {-Q,-Q,0,0,2*Q,0},       /* f */
     {Q,-Q,Q,0,0,0},          /* g */
     {Q,-Q,0,2*Q,2*Q,2*Q},    /* h */
     {Q,Q,0,0,0,0},         /* i */
     {Q,Q,-Q,-Q,0,0},         /* j */
     {-Q,Q,-Q,2*Q,2*Q,0},     /* k */
     {-Q,Q,0,0,0,0},          /* l */
     {-Q,-Q,2*Q,2*Q,-Q,2*Q},  /* m */
     {-Q,-Q,2*Q,2*Q,2*Q,2*Q}, /* n */
     {2*Q,2*Q,0,2*Q,2*Q,0},   /* o */
     {-Q,Q,-Q,2*Q,2*Q,0},     /* p */
     {-Q,Q,0,2*Q,0,2*Q},      /* q */
     {-Q,Q,Q,Q,2*Q,2*Q},      /* r */
     {0,0,-Q,-Q,2*Q,2*Q},     /* s */
     {Q,-Q,0,0,2*Q,2*Q},      /* t */
     {Q,Q,0,0,0,0},           /* u */
     {Q,Q,-Q,-Q,2*Q,2*Q},     /* v */
     {Q,Q,-Q,-Q,2*Q,Q},       /* w */
     {Q,-Q,0,2*Q,2*Q,0},      /* x */
     {Q,Q,0,0,0,0},           /* y */
     {0,0,0,2*Q,Q,Q}          /* z */
      };
void drawAndInterpolate(){
  float A = 0.925;
  float B = 1.0 - A;

  for (int i=0; i<6; i++){
    current.xlocs[i] = A*current.xlocs[i] + B*goal.xlocs[i];
    current.ylocs[i] = A*current.ylocs[i] + B*goal.ylocs[i];
    current.rots[i] = A*current.rots[i]  + B*goal.rots[i];
    opac = 200.0;
  }
  fill(0, opac);
  current.render();
}
void grid(){
  for (int i = 0; i < width; i += 10) {
    strokeWeight(0.3);
stroke(#CC0000,20);
    line (i,0, i,width);
    line (0,i, height,i);
  }

stroke(#CC0000,100);
  line (70,80, 140,80);
  line (70,160, 140,160);
  line (70,30, 70,210);
  line (140,30, 140,210);
  line (70,30, 140,30);
  line (70,210, 140,210);
  noStroke();
}

void p1(){
  //registrationMark("P1");
  beginShape();
  vertex (0,0);
  vertex (30,0);
  vertex (40,10);
  vertex (-20,10);
  vertex (-20,0);
  vertex (0,0);
  endShape(); 
}

void p2(){
  //registrationMark("P2");
  beginShape();
  vertex (0,0);
  vertex (30,0);
  vertex (40,10);
  vertex (-20,10);
  vertex (-20,0);
  vertex (0,0);
  endShape(); 
}

void p3() {
  //registrationMark("P3");
  beginShape();
  vertex (-20,-40);
  vertex (-10,-30);
  vertex (-10,0);
  bezierVertex (-10,5,-5,10,0,10);
  vertex (20,10);
  vertex (20,20);
  vertex (0,20);
  bezierVertex (-10,20,-20,10,-20,0);
  vertex (-20,-40);
  endShape(); 
}

void p4() {
  //registrationMark("P4");
  beginShape();
  vertex (-20,-40);
  vertex (-10,-30);
  vertex (-10,0);
  bezierVertex (-10,5,-5,10,0,10);
  vertex (20,10);
  vertex (20,20);
  vertex (0,20);
  bezierVertex (-10,20,-20,10,-20,0);
  vertex (-20,-40);
  endShape(); 
}

void p5() {
  //registrationMark("P5");
  beginShape();
  vertex (10,-30);
  vertex (20,-40);
  vertex (20, 0);
  bezierVertex (20,10,10,20,0,20);
  vertex (-20,20);
  vertex (-20,10);
  vertex (0,10);
  bezierVertex (5,10, 10,5, 10,0);
  vertex (10,-30);
  endShape(); 
}

void p6() {
  //registrationMark("P6");
  beginShape();
  vertex (10,-30);
  vertex (20,-40);
  vertex (20, 0);
  bezierVertex (20,10,10,20,0,20);
  vertex (-20,20);
  vertex (-20,10);
  vertex (0,10);
  bezierVertex (5,10, 10,5, 10,0);
  vertex (10,-30);
  endShape(); 
}

void registrationMark(String pieceName){
  stroke(#CC0000);
  line(-5,0, 5,0);
  line(0,-5, 0,5);
  fill(#CC0000);
  textFont(font, 8);
  text(pieceName, 1,7);
  noStroke();
  fill(0);
}
void initializeLetters()
{
  for (int i=0; i<26; i++){
    char ch = (char)(i+'a');
    alphabet[i] = new Letter(ch, XL[i], YL[i], ROTS[i]);
  }
  
  current = new Letter('a', XL[0], YL[0], ROTS[0]);
  goal = new Letter('a', XL[0], YL[0], ROTS[0]);
}

int  currKey = 0;
int  clickCount = 0;

void keyPressed(){


  int tmpKey = key;

  if ((key >= 'a') && (key <= 'z')){
    tmpKey -= ('a' - 'A');


    // our goal is for currKey to be 0..26, NOT A..Z
    tmpKey = tmpKey - 'A';
    if ((tmpKey >=0) && (tmpKey < 26)){
      currKey = tmpKey;
    }

    goal = alphabet[currKey];
    clickCount = 0;
    currKey = key - 'a';

  }
}

void mousePressed(){

  currKey = (currKey + 1)%26;
  goal = alphabet[currKey];

}


