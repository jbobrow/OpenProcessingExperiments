
// Window instellingen
int wBreedte = 400;
int wHoogte = 400;

// Kleuren instellinge
int kleurRood = 255;
int kleurGroen = 0;
int kleurBlauw = 0;

// Robot + vracht instellingen
int robotX = 50;
int robotY = 50;
int vrachtX = 20;
int vrachtY = 20;

int diameter = 40;
int marge = diameter / 2;
int speed = 20;

// Laadbak
int loadingMarge = 20;
int loadingDiameter = 2 * diameter;
int loadingX = wBreedte - loadingMarge - loadingDiameter;
int loadingY = wHoogte - loadingMarge - loadingDiameter;

// Score bijhouden
int scoreX = 20;
int scoreY = wHoogte - 50;
int score = 0;

// Dragen aan of uit?
boolean isDragen = false;

void setup() {
// Scherm maken
  size(wBreedte, wHoogte);
}

void draw() {
  background(255, 125, 0);
  
// Teken laadbak
  fill(kleurRood, kleurGroen, kleurBlauw);
  rect(loadingX, loadingY, loadingDiameter, loadingDiameter);
  
// Teken robot + vracht
  fill(255);
  rect(robotX, robotY, diameter, diameter);
  
// Geef kleur als vracht is opgepakt
  if (isDragen == true) {
    fill(kleurRood, kleurGroen, kleurBlauw);
  } else {
    fill(125);
  }
  ellipse(vrachtX, vrachtY, diameter, diameter);
 
// Laat score zien
  fill(238, 250, 187);
  rect(scoreX, scoreY, 140, 30);
  
  fill(255, 0, 0);
  textSize(20);
  text("Score :" + score, scoreX + 5, scoreY + 22);

// "Snake-muren"
  if (isDragen == true) {
    if (robotX > wBreedte) {
      robotX = 0 - diameter;
      vrachtX = 0 - diameter + marge;
    } else if (robotX < 0 - diameter) {
      robotX = wBreedte;
      vrachtX = wBreedte + marge;
    } else if (robotY > wHoogte) {
      robotY = 0 - diameter;
      vrachtY = 0 - diameter + marge;
    } else if (robotY < 0 - diameter) {
      robotY = wHoogte;
      vrachtY = wHoogte + marge;
    }
  } else {
    if (robotX > wBreedte) {
      robotX = 0 - diameter;
    } else if (robotX < 0 - diameter) {
      robotX = wBreedte;
    } else if (robotY > wHoogte) {
      robotY = 0 - diameter;
    } else if (robotY < 0 - diameter) {
      robotY = wHoogte;
    }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    if (robotX + marge > vrachtX - marge && robotX + marge < vrachtX + marge && robotY + marge > vrachtY - marge && robotY + marge < vrachtY + marge){
      if (isDragen == false) {
        isDragen = true;
        println("Carrying package");
      } else {
        isDragen = false;
        println("Dropped package");
        if (vrachtX - marge > loadingX && vrachtX < loadingX + loadingDiameter){
          vrachtX = int(random(0, wBreedte));
          vrachtY = int(random(0, wHoogte));
          loadingX = int(random(0, wBreedte - (loadingMarge + loadingDiameter)));
          loadingY = int(random(0, wHoogte - (loadingMarge + loadingDiameter)));
          kleurRood = int(random(0, 255));
          kleurGroen = int(random(0, 255));
          kleurBlauw = int(random(0, 255));
          
          score ++;
        }
      }
    }
  }
  if (key == CODED) {
    if (isDragen == false) {  
      if (keyCode == UP) {
        robotY -= speed;
      } else if (keyCode == DOWN) {
        robotY += speed;
      } else if (keyCode == LEFT) {
        robotX -= speed;
      } else if (keyCode == RIGHT) {
        robotX += speed;
      }
    } else {
      if (keyCode == UP) {
        robotY -= speed;
        vrachtY -= speed;
      } else if (keyCode == DOWN) {
        robotY += speed;
        vrachtY += speed;
      } else if (keyCode == LEFT) {
        robotX -= speed;
        vrachtX -= speed;
      } else if (keyCode == RIGHT) {
        robotX += speed;
        vrachtX += speed;
      }
    }
  }
}
