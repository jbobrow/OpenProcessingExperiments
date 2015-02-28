
Gusano a;
Gusano b;
Gusano c;
Gusano d;
Gusano e;

Lombriz A;
Lombriz B;
Lombriz C;


Bacteria aa;

void setup () {
  size(1240, 820); 
  background(255, 220, 166);


  noStroke();

  a=new Gusano(width/2, height/2, 15, 200, 0, 0, 150);     //pos partida x,y, grado rotacion, ro,verde,azul,trasparencia
  b=new Gusano (200, 78, 24, 255, 255, 255, 115);
  c=new Gusano(22.33, 56, 14, 82, 0, 0, 140);
  d=new Gusano(width/1.8, height/2.2, 11, 200, 0, 0, 150);
  e=new Gusano(width/5, height/2, 15, 255, 255, 255, 150);


  A=new Lombriz (width/2, height/2, 2.6, 255, 205, 31, 190);
  B=new Lombriz (width/2.7, height/1, 2.6, 255, 131, 31, 170);
  C=new Lombriz (width/5, height/2, 2.6, 0, 0, 0, 190);

  aa=new Bacteria (width/2, height/2, 11, 235, 12, 12, 150);
}

void draw() {




  a.update();
  a.display();


  b.update();
  b.display();

  c.update();
  c.display();

  d.update();
  d.display();

  A.update();
  A.display();

  B.update();
  B.display();

  e.update();
  e.display();

  aa.update();  
  aa.display();
}






// ahora la clase 1

class Gusano {
  float angle = 0.0;
  float offset = 60;
  float scalar = 50;
  float incremento = 0.05;
  float xpos;
  float ypos;
  float gamma;

  float x1;
  float y1;
  float diam;
  float  rojo, verde, azul, transparencia;

  Gusano (float  xx, float   yy, float g, float ro, float ve, float az, float tra) {



    xpos = xx;
    ypos= yy;
    gamma = g;    //modifica el angulo de rotacion
    rojo=ro;
    verde=ve;
    azul=az;
    transparencia=tra;
  }



  void update() {



    translate(xpos, ypos); 
    //translate(width/2,heigth/2);
    //translate(333,333); 

    float y = offset + sin(angle) * scalar;
    float x = offset + cos(angle) * scalar;


    //ellipse (x,y,40,40);    //original

    //formas raras


    //rotate(radians(angle*60));     //original
    //rotate(radians(angle*300));      //shieeetttttt, la huea genera  algo totalmente radial y simetrico

    rotate(radians(angle*gamma));    //voladisimas gusanas 





    //ellipse (x*x/100,y*y/100,40+x,40+x);  //forma cuatica basada en ellipses, q cambian radio

    //ellipse (x*x/100+angle*10,y*y/100+angle*10,40+x,40+x);   //forma cuatica q se va alargando
    //ellipse (x*x/100+angle*10,y*y/100+angle*10,40+x*random(-1,1),40+x*random(-1,1));
    //ellipse (x+10*angle,y+10*angle,40,40);





    //pruebas borrasho

    //ellipse (x*x/100+angle*10,y*y/100+angle*10,40+(1/x)*(1/x),40+(1/x)*(1/x)); //nada espectacular 
    //ellipse (x*x/100+angle*10,y*y/100+angle*10,40+x*random(-1,1),40+x*random(-1,1));  //muy random los tamaños


    //ellipse (x*x/100+angle*10,y*y/100+angle*10,40*sin(angle),40*sin(angle));    //piola cambio de radio, sube y bakja



      x1 = x*x/100+angle*10;
    y1 =y*y/100+angle*10;

    diam = 40*sin(angle);

    //ellipse (x*x/100+angle*10,y*y/100+angle*10,70*sin(angle),70*sin(angle)); 

    //ellipse (1/x*x+angle*10,1/y*y+angle*10,70*sin(angle),70*sin(angle));   //logro hiperboles segun mi teoria



    //rect(x,y,40,40);
    //rect(x+50*angle,y,40,40); //cuadraos q avanzan dejando una estela bonita


    angle += incremento;
  }


  void display() {

    fill(rojo, verde, azul, transparencia);
    ellipse (x1, y1, diam, diam);
  }
}






//ahora la clase 2

class Lombriz {

  float angle = 0.0;
  float offset = 10;
  float scalar = 50;
  float incremento = 0.1;
  float xpos;
  float ypos;
  float gamma;



  float x1;
  float y1;
  float diam;
  float  rojo, verde, azul, transparencia;

  Lombriz (float  xx, float   yy, float g, float ro, float ve, float az, float tra) {



    xpos = xx;
    ypos= yy;
    gamma = g;    //modifica el angulo de rotacion
    rojo=ro;
    verde=ve;
    azul=az;
    transparencia=tra;
  }



  void update() {



    translate(xpos, ypos); 
    //translate(width/2,heigth/2);
    //translate(333,333); 



    float y = offset + sin(angle) * scalar;
    float x = offset + cos(angle) * scalar;




    rotate(radians(angle*gamma));    //voladisimas gusanas 


    //ellipse (1/x*x+angle*10,1/y*y+angle*10,70*sin(angle),70*sin(angle));



    x1 = 1/x*x+angle*10;
    y1 =1/y*y+angle*10;

    diam = 90*sin(angle);


    angle += incremento;
  }


  void display() {

    fill(rojo, verde, azul, transparencia);
    ellipse (x1, y1, diam, diam);
  }
}

// ahora clase 3


// ahora viene la primera clase

class Bacteria {
  float sangle = 0.0;
  float soffset = 60;
  float sscalar = 100;
  float sincremento = 0.09;
  float sxpos;
  float sypos;
  float sgamma;

  float sx1;
  float sy1;
  float sdiam;
  float  srojo, sverde, sazul, stransparencia;

  Bacteria (float  sxx, float   syy, float sg, float sro, float sve, float saz, float stra) {



    sxpos = sxx;
    sypos= syy;
    sgamma = sg;    //modifica el angulo de rotacion
    srojo=sro;
    sverde=sve;
    sazul=saz;
    stransparencia=stra;
  }



  void update() {



    translate(sxpos, sypos); 
    //translate(width/2,heigth/2);
    //translate(333,333); 

    float y = soffset + sin(sangle) * sscalar*noise(-0.5, 0.5);
    float x = soffset + cos(sangle) * sscalar*noise(-0.5, 0.5);


    //ellipse (x,y,40,40);    //original

    //formas raras


    //rotate(radians(angle*60));     //original
    //rotate(radians(angle*300));      //shieeetttttt, la huea genera  algo totalmente radial y simetrico

    rotate(radians(sangle*sgamma)*noise(-3.5, 3.5));    //voladisimas gusanas 


    sx1 = -x*x/100+sangle*10;
    sy1 =-y*y/100+sangle*10;

    sdiam = 30*sin(sangle);


    sangle += sincremento;
  }


  void display() {

    fill(srojo, sverde, sazul, stransparencia);
    ellipse (sx1, sy1, sdiam, sdiam*noise(-2.5, 2.5));
  }
}
