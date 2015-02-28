
Pokemon Pokemon;    // Pikachu
Timer timer;        // Timer
Pokeball[] Pokeballs;       // Pokeball 
int totalPokeballs = 0; // totaal Pokeballs

// Boolean laat weten wanneer game voorbij is
boolean gameOver = false;


// Variabele houd de score, level, levens bij
int fase = 0;
int score = 0;      // Score
int level = 1;      // Welk level je bent
int lives = 5;     // 5 Leven per level (5 pokeballs )
int levelCounter = 0;

PFont f;
PImage bg;

void setup() {
  size(500, 650);
  smooth();
  bg = loadImage("Pokeball.jpg");
  Pokemon = new Pokemon(20); // Pokemon met radius met 20
  Pokeballs = new Pokeball[50];    // elk level 30 pokeballs
  timer = new Timer(300);   // Timer dat om de 2 sec ofgaat
  timer.start();             // Start timer

  f = createFont("Arial", 12, true);
}

void draw() {

  if (fase == 0) {
    background(0);
    textFont(f, 25);
    text("Ontwijk de Pokeballs", 50, 200);
    text("Beweeg met de muis", 50, 230);
    text("Druk op een toets om te beginnen", 50, 460);

    if (keyPressed == true) {
      fase = 1;
    }
  }

  if (fase == 1) {
    background(bg);



    // Game over
    if (gameOver) {
      background(255);
      textFont(f, 48);
      textAlign(CENTER);
      fill(0);
      text("GAME OVER", width/2, height/2);
      text("SCORE: " +score, width/2, height/2+50);
    } 
    else {

      // Pokemon locatie
      Pokemon.setLocation(mouseX, mouseY); 
      // Display Pokemon
      Pokemon.display(); 

      // Check de timer
      if (timer.isFinished()) {
        if (totalPokeballs < Pokeballs.length) {
          Pokeballs[totalPokeballs] = new Pokeball();
          totalPokeballs++;
        }
        timer.start();
      }

      // Beweging en display van alle Pokeballs
      for (int i = 0; i < totalPokeballs; i++ ) {
        if (!Pokeballs[i].finished) {
          Pokeballs[i].move();
          Pokeballs[i].levenUp();
          Pokeballs[i].display();
          if (Pokeballs[i].reachedBottom()) {
            levelCounter++;
            Pokeballs[i].finished(); 
            // Als de pokeball de grond raakt gaat score omhoog
            score++;
          }
          // Als je leven 0 is de game voorbij
          if (lives <= 0) {
            gameOver = true;
          } 

          // Elke keer als je een pokeball aanraakt gaat er een leven vanaf
          if (Pokemon.intersect(Pokeballs[i])) {
            Pokeballs[i].finished();
            levelCounter++;
            lives--;
            fill(255, 255, 0);
            ellipse(mouseX+15, mouseY-55, 13, 13);
            ellipse(mouseX-15, mouseY-55, 12, 12);
            stroke(0);
            strokeWeight(3);
            arc(mouseX+15, mouseY-55, 9, 3, 0, PI); 
            arc(mouseX-15, mouseY-55, 9, 3, 0, PI); //huilen
            ellipse(mouseX, mouseY-35, 5, 10);
          }
        }
      }


      // als alle pokeballs zijn gevallen is de level voorbij
      if (levelCounter >= Pokeballs.length) {
        // level omhoog
        level++;
        // game elementen reset
        levelCounter = 0;
        lives = 5;
        timer.setTime(constrain(300-level*25, 0, 300));
        totalPokeballs = 0;
      }





      // Display number of lives left
      textFont(f, 14);
      fill(0);
      text("Lives left: " + lives, 10, 20);
      rect(10, 24, lives*10, 10);

      text("Level: " + level, 400, 20);
      text("Score: " + score, 400, 40);
    }
  }
}

class Pokeball {
  float x,y;   // Variabele voor de locatie van Pokeball
  float snelheid; // snelheid van de Pokeball
  float r;     // Radius vanaf het midden van de buik

  boolean finished = false;

  Pokeball() {
    r = 30;                 // Pokeballs de zelfde formaat
    x = random(width);     // Start with a random x location
    y = -r*4;              // Start een beetje onder de scherm
    snelheid = random(2,3);   // random snelheid
    
  }

  // Pokeball laten vallen
  void move() {
  
    y += snelheid; 
  }

void levenUp(){
  if(level>=5){
    snelheid=random (3,4); 
  }
  
  if(level>=10){
    snelheid=random (4,5); }
    
  if(level>=15){
    snelheid=random (5,6); }
}

  // Check als het de bodem raakt
  boolean reachedBottom() {
    // net boven de grond
    if (y > height + r*4) { 
      return true;
    } 
    else {
      return false;
    }
  }

  // Display Pokeball
  void display() {
    // Display Pokeball
    stroke(0);
    strokeWeight(1);
  fill(255,255,255);
  ellipse(x,y,r,r);
  fill(250,0,0);
  arc(x,y,r,r,PI,TWO_PI);
  fill(1,1,1);
  ellipse(x,y,7,7);
  fill(255,255,255);
  ellipse(x,y,6,6);
  }

  // als de pokeball is gevangen
  void finished() {
    finished = true;
  }
}

class Pokemon {
  float r;   // radius
  float x,y; // locatie
  
  Pokemon(float tempR) {
    r = tempR;
    x = 0;
    y = 0;
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    noStroke();
  fill(250,250,0);
  float value = brightness(255);
  ellipse(mouseX,mouseY,70,60);
  ellipse(mouseX,mouseY-40,60,60);
  triangle(mouseX-15,mouseY-55,mouseX-35,mouseY-55,mouseX-30,mouseY-110);
  triangle(mouseX+15,mouseY-55,mouseX+15,mouseY-75,mouseX+70,mouseY-75);
  ellipse(mouseX-25,mouseY+25,15,15);
  ellipse(mouseX+25,mouseY+25,15,15);
    //body
  
  fill(0);
  ellipse(mouseX-15,mouseY-55,12,12);
  ellipse(mouseX+15,mouseY-55,12,12); //ogen
  
  if(mousePressed) {
    fill(255,255,0);
    ellipse(mouseX+15,mouseY-55,13,13);
    stroke(0);
    strokeWeight(3);
    arc(mouseX+15,mouseY-55, 9, 3, 0, PI); //knipoog
  }
  
  noStroke();
  fill(255,0,0);
  ellipse(mouseX-20,mouseY-40,15,15);
  ellipse(mouseX+20,mouseY-40,15,15); //wangen
  
  stroke(0);
  strokeWeight(3);
  noFill();
  arc(mouseX,mouseY-47, 5, 2, 0, PI); //neus
  
  noFill();
  arc(mouseX,mouseY-35, 10, 5, 0, PI); //mond
  
  if(mousePressed) {
    stroke(255,255,0);
    strokeWeight(4);
    arc(mouseX,mouseY-35, 10, 5, 0, PI);
    stroke(0);
    strokeWeight(3);
    arc(mouseX,mouseY-37, 13, 8, 0, PI); //laten lachen
  }
  }
  
  // als de pokemon een ball aanraakt
  boolean intersect(Pokeball d) {
    // afstand
    float distance = dist(x,y,d.x,d.y); 
    
    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }
}

class Timer {
 
  int savedTime; // wanneer de timer is gestard
  int totalTime; // hoelang de timer duurt
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  void setTime(int t) {
    totalTime = t;
  }
  
  // start van de timer
  void start() {
    
    savedTime = millis(); 
  }
  
 
  boolean isFinished() { 
    // Check hoeveel tijd voorbij is
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


