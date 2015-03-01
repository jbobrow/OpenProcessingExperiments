
int contador=0;

Grid grid;

ArrayList <Bola> bolas;
ArrayList <ArrayList<Bola>> grupobolas;

void setup() {
  size(400, 400);

  grid = new Grid(); //nueva rejilla
  bolas = new ArrayList(); // creo el arraylist
  grupobolas= new ArrayList();
}


void draw() {

  background(100); 
  grid.display();
  for (int i = 0; i < contador; i++ ) { 

    Bola b = (Bola) bolas.get(i);

    int distanciax = abs((bolas.get(0).posx) - (bolas.get(i).posx));
    int distanciay = abs((bolas.get(0).posy) - (bolas.get(i).posy));

    b.display();

    if (frameCount % 8 == 0) {
      
     
      if (distanciax==20 && distanciay==0) {
        b.stopit();
      } else if (distanciax==0 && distanciay==20) {
        b.stopit();
      } else if (distanciax==20 && distanciay==0) {
        b.stopit();
      } else if (distanciax==20 && distanciay==20) {
        b.stopit();
      }
      if ( bolas.size()>1) {
        bolas.get(i).movement();
      }
    }
  }
}
void mousePressed() {

  if (bolas.size()==0) {
    bolas.add(new Bola((int)map(mouseX/20, 0, 20, 0, width), (int)map(mouseY/20, 0, 20, 0, height), false));
  } else {
    bolas.add(new Bola((int)map(mouseX/20, 0, 20, 0, width), (int)map(mouseY/20, 0, 20, 0, height), true));
  } 

  contador++;
}
class Bola {
  int celdas =400;
  int randx= 0;
  int randy = 0;
  int posx, posy;
  int sz=20;
  int stepx=0, stepy=0;
  boolean estadomov;
  
  Bola(int _posx, int _posy, boolean prendido) {

    posx = _posx;
    posy = _posy;
    estadomov=prendido;
  }


  void display() {
  
    noStroke();
    ellipseMode(CORNER);
    fill(255);
    ellipse(posx, posy, sz, sz);
  }


  void stopit() {  estadomov=false; }

  void move() { estadomov=true; }

  void movement() {
   
    if (estadomov == true) {
      stepx=20;
      stepy=20;
    } else {
      stepx=0;
      stepy=0;
    }

    randx =(int(random(100)));
    randy = (int(random(100)));

    if (randx<50) {
      posx+=stepx;
    }
    if (randx>50) {
      posx-=stepx;
    }

    if (randy<50) {
      posy+=stepy;
    }
    if (randy>50) {
      posy-=stepy;
    }
    posx = constrain(posx, 0, width-sz);
    posy = constrain(posy, 0, height-sz);
  }
} 
class Grid {
  Grid() {
  }
  void display() {
    for (int i = 0; i < 400; i += 20) {
      stroke(0);
      line(0, i, width, i);
      line(i, 0, i, height);
    }
  }
}
class Timer {
  int delay;
  int tiempoinicio;

  Timer(int _delaytemp) {
    delay = _delaytemp;
  }

  void play() {
    tiempoinicio=millis();
  }

  boolean delayfinished() {
    int tiempopasado = millis() - tiempoinicio;
    if (tiempopasado > delay) {
      return true;
    } else {
      return false;
    }
  }
}


