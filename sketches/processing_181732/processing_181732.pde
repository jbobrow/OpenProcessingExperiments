
/* @pjs font="UnicaOne Regular.TTF"; 
preload="Ass1_logo_0.png, Ass1_logo_1.png, Ass1_logo_2.png, Ass1_logo_3.png, Ass1_logo_4.png"; 
 */

Ass ass;
Type types;
int cont;

void setup() {
  size( 306, 140 );
  ass = new Ass();
  types = new Type();
}

void draw() {
  logo();
  noLoop();
}

void logo() {
  cont = (int) random(-1, 5);
  background(255);
  ass.desenha(cont);
  types.desenha();
}

class Ass {
  
  PImage[] assingn;
  int randAss;

  Ass() {
    assingn = new PImage[5];
    for (int i = 0; i<=4; i++) {
      assingn[i] = loadImage("Ass1_logo_"+i+".png");
    }
    cont = 0;
  }

  void desenha(int cont) {
    stroke(0);
    strokeWeight(1);
    image(assingn[cont],0,0,width,height*.74285);
    line(width*.15,height*.45,width-width*.15,height*.45);
    line(width*.15,height*.5+height*.1,width-width*.15,height*.5+height*.1);
  }
}

class Type {

  PFont fontTxt;
  int str;
  String[] sampaio = {
    "saMpaio", "sAmpAio", "sAMpaio", "saMpAio", "saMpAio"
  }; 


  Type() {
    fontTxt = createFont("UnicaOne Regular.TTF", (height));
  }

  void desenha() {

    fill(0);
    textFont(fontTxt, height*0.35);
    textAlign(CENTER);
    str = (int) random(-1, 5);
    text(sampaio[str], width/2, height-height*0.1);
  }
}



