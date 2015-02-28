
Vaisseau vaisseau;

Monstre monstre;

int mCounter = 0;

ArrayList ml;

int gamemode =0;

int score = 0;




public void setup() {
  size(600, 500);
  background(0);
  frameRate(20);

  ml = new ArrayList();

  vaisseau = new Vaisseau();
  monstre = new Monstre();
}


public void draw() {

  if (gamemode == 0) {

    background(100);
    text("Esquivez les monstres en vous déplacant avec la souris", 200, 200, -30); 
    text("Cliquez pour commencer", 200, 230, -30);
  }

  //-------------------------------gameplay
  if (gamemode == 1) {
    background(0);

    mCounter++;

    if ((mCounter %5) == 0) {
      ml.add(new Monstre());
      //println("ajout monstre");
      score++;
      fill(255);
     text(score, vaisseau.get_x(), vaisseau.get_y() + 25);
    }


    vaisseau.deplacement(mouseX);
    vaisseau.display();

    for (int i=0; i < ml.size(); i++) {
      Monstre monstre = (Monstre) ml.get(i);
      monstre.display();
      if (vaisseau.contact(monstre.get_x(), monstre.get_y()) == true) {
        println("collision");
        gamemode = 2;
      }
    }
    //____________________________________________ gameover

    if (gamemode == 2) {
      background(0);
      text("Game over", 200, 200, -30);
      text("Score", 200, 230);
      text(score, 250, 230, -30);
    }
  }
}

public void mousePressed() {
  if (gamemode == 0) {
    gamemode =1;
  }
}


