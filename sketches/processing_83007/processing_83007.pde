
Tri tri01, tri02, tri03, tri04, tri05;

Rayo [] MiRayo = new Rayo[1];



void setup() {
  background(239, 223, 187);
  size (1024, 700);
  frameRate(20);
  noise(1);
  beginRecord(PDF, "####.pdf");



  //x , y, r, g, b, a
  tri01 = new Tri (width/1, height/1, 2, 89, 89, 80);
  tri02 = new Tri (width/2, height/2, 2, 115, 83, 100);
  tri03 = new Tri (width/3, height/3, 3, 166, 120, 60);
  tri04 = new Tri (width/40, height/4, 3, 166, 150, 80);
  tri05 = new Tri (width/5, height/5, 1, 20, 38, 10);


  for (int i=0; i<MiRayo.length;i++) {
    MiRayo[i] = new Rayo();
    MiRayo[i].calcularRayo();
  }
}

void draw() {



  tri01.update();
  tri01.display();

  tri02.update();
  tri02.display();

  tri03.update();
  tri03.display();

  tri04.update();
  tri04.display();

  tri05.update();
  tri05.display();

  for (int i =0; i<MiRayo.length;i++) {
    MiRayo[i].dibujarRayo();
  }
}


}




// clase rayo



class Rayo {
  color[] elColor = new color[80]; 

  float angle = 10;
  float offset = 100;
  float scalar =14;
  float incremento = 10;
 
 

  Rayo () {
  }
  void calcularRayo() {
    for (int i = 0; i < elColor.length; i++) {
      elColor [i] = color (214, 79, 42, 50); //(239, 232, 218); // (179, 160, 65, 80);
      //color (int(random(0, 200)), int(random(0, 200)), int(random(0, 100)), 20);
    }
  }  

  void dibujarRayo() {
    float x = offset + cos(angle) *scalar;
    float y = offset + sin(angle) * scalar;
   
   


    noStroke();
    fill(elColor[70]);
    beginShape();
    vertex(x+100, y+100);
    vertex(x+50, y+50);
    vertex(x+2, y+12);
    endShape(CLOSE);

    scalar+=0.5;
    scalar++;
    angle += incremento;
  }
}



//clase tri


class Tri {

  float[] remolino = new float [17];
  float xpos;
  float ypos;
  float xoff;
  float c1;
  float c2;
  float c3;
  float c4;
  float rota;

  Tri (float x, float y, float r, float g, float b, float a) {
    xpos = x;
    ypos = y;
    c1 = r;
    c2 = g;
    c3 = b;
    c4 = a;
  }

  void update() {
    if (ypos > height) {
      ypos*=-1;
      xpos*= -1;
    } 

    xpos = xpos+15;
    ypos= ypos+7;
    rota = rota+0.1;
  }

  void display() {
    for (int i= 10; i<remolino.length; i++) {
      pushMatrix();
      translate (width/2, height/2);
      scale(0.3);
      rotate (rota);
      stroke(c1, c2, c3, c4);
      noFill();
      beginShape();
      vertex(1+xpos, 1+ypos);
      vertex(40+xpos, 20+ypos);
      vertex(20+xpos, 50+ypos);
      endShape(CLOSE);
      popMatrix();
    }
  }
}
