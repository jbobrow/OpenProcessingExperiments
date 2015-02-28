
monstre[] bob=new monstre [2000];

PGraphics zone;

void setup() {
  size(800, 800);
  zone = createGraphics(800*2, 800*2);
  for (int i=0;i<bob.length;i++) {
    bob[i] = new monstre(zone.width/2, zone.width/2);
  }
}

void draw() {

  zone.beginDraw();
  zone.background(255);
  for (int i=0; i<bob.length;i++) {
    bob[i].aff();
  }

  zone.endDraw();

  image(zone, 0, 0, width, height);
}



void keyPressed() {
  zone.save("ima"+frameCount+".png");
  println("save end!");
}

class monstre {//-----------Nom de class

  float x;//-----------------------------------
  float y;//-----------------------------------
  float vitx;//--------------------------------
  float vity;//--------------------------------Appel des Fonctions 
  float r;//-----------------------------------
  float v;//-----------------------------------
  float b;//-----------------------------------
  int large;//-------------------------------

  

  monstre(float _x, float _y) {//-------------Constructeur de la class

    x= _x;
    y=_y;
    vitx= random(-50, 50);//------------------
    vity=random(-50, 50);//-------------------
    r=random(0,255);//------------------------ Paramétrage des onctions
    v=random(0, 255);//-----------------------
    b=random(0, 255);//-----------------------
    large= int(random(5,30));//---------------
    

    
  }

  void aff() {// ---------------------------Propriétés de la class
    zone.fill(0);
    zone.ellipse(x,y, 25, 25);
    x+=vitx;
    y+=vity;

    if (x>zone.width) {
      vitx*=-0.3;
    }
    if (y>zone.height) {
      vity*=-0.3;
    }
    if (x<0) {
      vitx*=-0.3;
    }
    if (y<0) {
      vity*=-0.3;
    }
  }
}



