
//creo la classe Box
class Box {
  //variabile del colore
  color c;
  //posizioni di x e y
  float xpos;
  float ypos;
  //velocità di x
  float xspeed;

//creo il costruttore
  Box(color c_, float xpos_, float ypos_, float xspeed_) {
    
    //assegno le variabili universali a quelle specifiche di questo caso
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    xspeed = xspeed_;
  }
  
  //metodo per disegnare e colorare i rettangoli
  void display() {
    noStroke();
    fill(c);
    rect(xpos, ypos, 100, 60);
  }
  
  //metodo per far muovere il rettangolo e controllare quando esce dalla finestra per farlo ripartire da zero
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

//Richiama il costruttore sopra e crea un nuovo oggetto di tipo Box chiamato boxes secondo le regole definite dal costruttore 
Box[] boxes = new Box[0];

//metodo per preparare la finestra
void setup() {
  size(600, 600);
  smooth();
}

//metodo per disegnare
void draw() {
  background(#A5A0A0);
  for (int i = 0; i < boxes.length; i = i + 1) {
    boxes[i].move();
    boxes[i].display();
  }
}

//attivo le azioni al click del mouse
void mouseClicked() {
  
  Box b = new Box(color(int(random(255)),int(random(255)),int(random(255)),int(random(255))), int(random(width)), int(random(height)), int(random(1,5)));
  boxes = (Box[]) append(boxes,b);
  
}


