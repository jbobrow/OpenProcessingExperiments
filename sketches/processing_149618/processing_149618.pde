
int xv, yv; // coordonnÃ©es de la voiture
int[] xcolonne = {100, 400, 700}; //colonne voiture adverse

color c = color(255);
float x1 = 100;
float y1 = 0 ; 
float x2 = 400;
float y2 = 0;
float speed = 5; //vitesse du jeu
boolean gameover=false;


void setup() {
size (900,500);
background (0,0,0);
xv= 400; //voiture dÃ©part
yv= 350;
}


void draw(){
  background(255);
  if (!gameover) {
  voiture();
  move();
  display();
  test();
  }
  else {
    fill(0);
    textSize (40);
    text ("GameOver!",350,250); //affichage GameOver
  }
  line(300,0,300,500);
  line(600,0,600,500);
  PImage voiture;
   voiture = loadImage("voiture.jpg");
    image(voiture,xv,yv,100,100);  
  }


void move() {
  y1 = y1 + speed;
  if (y1 > height) {
    y1 = 0;
    x1= xcolonne[int(random (0,2.99999))];
  }
 
  y2 = y2 + speed;
  if (y2 > height) {
  y2 = 0;
}
}

void test() { //collision des voitures
  if ((x1 == xv) || (x2 == xv)) {
    if ((yv <= y1 + 100) || ( yv <= y2 + 100 )) {
      gameover=true;
    }
  }
}
  

void display() {
  fill(c);
  rect(x1,y1,100,100); //voiture adverse 1
  rect(x2,y2,100,100); //voiture adverse 2

}
void voiture()
{
    fill (255);
    rect (xv,yv,100,100);
}

void keyPressed()
{
