
PFont visitor;
//het aantal rijen en kolommen, hier word ook de grootte van het scherm mee bepaalt
int w =constrain(30, 20, 100);
int h = constrain(20, 20, 100);

int xLocKarel; // de x locatie van karel
int yLocKarel; // de y locatie van karel
int lengteKarel; //de lengte van Karel 
int breedteKarel =( w+h) / 2; //de breedte (en hoogte) van Karel
int richtingBewegen; // de richting waar Karel heen kijkt
float snelheid;//snelheid van karel

int startTimer; //om de timer in het spel goed te laten lopen
int timerStartProgramma = 0; //om de timer in het spel goed te laten lopen
int eindeTijd = 60;  //hoelang het spel duurt in seconden
int startTime;//om de timer in het spel goed te laten lopen

int moduloRodeBal; //hiermee kun je de tijd tussen twee tijdbonussen instellen
int  xLocatieRodeBal; // de x lokatie van de rode bal
int yLocatieRodeBal; // de y lokatie van de rode bal 
int startTimerRodeBal; //om de rode bal ook een timing te geven
int finalTimerRodeBal = 0; //om de rode bal ook een timing te geven

int score; // de huidige score
int scoreInc; //de hoeveelheid waarmee de score wordt opgehoogt
int highscore; //de score die word weggeschreven in een bestand

boolean gameover = false;
boolean startGame = false;
boolean pauze = false;
boolean timerAan = true;
boolean rodeBalAanwezig = false;

//piepballen
int aantalPiepballen = (w + h) / 10;
int[][] locatiePiepballen = new int [aantalPiepballen][2];  //2d array met per piepbal een x en y locatie

int[][] bord; //2d array die het bord tekent en de positie van karel bepaalt


String highscoreFile = "highscore.txt";
PrintWriter output;
BufferedReader reader;

//***************************************************************************************
void setup()
{
  startTime = timerStartProgramma;

  size(w * breedteKarel, h * breedteKarel); //de grootte van het scherm

  visitor = loadFont("VisitorTT2BRK-48.vlw"); //font inladen
  bord = new int[w][h]; //initaliseerd de grootte van de array

  //mijn alternatieve setup omdat het spel meerdere keren gespeeld moet kunnen worden
  // reset alle variabelen waar dit bij nodig is bijvoorbeeld timers
  startSpel(); 

  importHighscore(); //highscore importeren
}
//***************************************************************************************
void draw()
{

  moduloRodeBal = (finalTimerRodeBal /1000) % 20; //iedere 20 seconden kan er een rode bal verschijnen

  //Als je een piepbal opeet score +minimum 5 maximum 10
  scoreInc = 10;

  fill(50);

  //de nieuwe timer 
  timerStartProgramma = millis()-startTimer;
  finalTimerRodeBal = timerStartProgramma-startTimerRodeBal;

  if (gameover == false && startGame == true)
  {
    //zorgt dat Karel niet te snel beweegt
    //hiermee limiteer je de framerate waar karel op beweegt
    //ik kan niet de framerate zelf gebruiken omdat dan de tijd niet meer klopt
    if (snelheid == 0) {
      background(50);

      richtingBewegen();//de richting waar karel heen beweegt

      tekenBord();//het bord tekenen

      piepballenEten();//kijken of de posities van de piepballen en de rode bal overeenkomen met Karel

      updateHighscore();//het checken of de highscore verbeterd is

      positieKarel();//positie van karel bepalen

      tekenPiepballen();//de piepballen tekenen

        tekenRodeBal();//de rode bal tekenen

      tekenScoreEnTijdInGame();//de tijd en score in game tekenen
    }
    snelheid++;
  }

  startEnGameOverScherm();//het wachtscherm waar de score etc word getoond
}
//***************************************************************************************
void keyPressed()
//pauze ingame
{
  if (key == 'p' || key == 'P' && pauze == false) {
    background(255);
    textAlign(CENTER);
    fill(0);
    textFont(visitor, 48);
    text("- PAUSE -", w * breedteKarel / 2, h * breedteKarel / 2);
    textFont(visitor, 30);
    text("To resume press arrow keys", w * breedteKarel / 2, h * breedteKarel / 4);
    text("Get me some coffee too!", w * breedteKarel / 2, h * breedteKarel );
    noLoop();
  }
  else {
    loop();
  }

  //het bewegen met de toetsen
  //kan niet achteruit bewegen
  if (key == CODED) {

    if (keyCode == UP) { //naar boven bewegen
      if (richtingBewegen != 2)
        richtingBewegen = 0;
    }

    if (keyCode == DOWN) {//naar beneden bewegen
      if (richtingBewegen != 0)
        richtingBewegen = 2;
    }
    if (keyCode == LEFT) {   //naar links bewegen
      if (richtingBewegen != 1)
        richtingBewegen = 3;
    }
    if (keyCode == RIGHT) {//naar rechts bewegen
      if (richtingBewegen != 3)
        richtingBewegen = 1;
    }
  }
  if (key == ESC) { //extra stop key
    stop();
  }

  if (key == ENTER) {
    //Start het spel als je op enter drukt
    if (startGame == false && gameover == false && timerAan == false) {
      startGame = true;
      startSpel();
      startTimer = millis();

      timerAan = false;
      startTimerRodeBal -= startTimerRodeBal;
    }

    //Start het spel overnieuw als je op enter drukt 
    if (gameover == true)
    {

      startSpel(); //reset
      startTimer = millis();
    }
  }
}
void importHighscore() {

  // opent het bestand van createWriter()
  reader = createReader("highscore.txt");
  if (reader == null) {
    highscore = 0;
    return;
  }
  String line;
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line != null) {
    highscore = int(line);
    println(highscore);
  }
  try {
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
  
  void piepballenEten() {
  //als X en Y overeenkomen met een van de piepballen 
  for (int i =0; i<aantalPiepballen; i++) {
    if (xLocKarel == locatiePiepballen[i][0] && yLocKarel == locatiePiepballen[i][1])  //check of de locatie van een van de piepballen overeenkomt met karel 0 = x en 1 = y
    {

      score += scoreInc;
      //dan +5 score
      lengteKarel++;
      //teken de piepbal op een nieuwe random locatie
      locatiePiepballen[i][0] = int(random(0, w ));
      locatiePiepballen[i][1] = int(random(0, h));
    }
  }

  //als X en Y overeenkomen met de rode bal 
  if (xLocKarel == xLocatieRodeBal && yLocKarel == yLocatieRodeBal) {
    //+ 5 score
    score += scoreInc;
    //dan timer 10 seconden erbij
    eindeTijd += 10;

    rodeBalAanwezig = false;

    xLocatieRodeBal = int(random(w - 2)) + 1;
    yLocatieRodeBal =int(random(h - 2)) + 1;
    //teken de piepbal op een nieuwe random locatie
  }
}



  
}
void positieKarel() {
  //positie van Karel bepalen
  for (int i = 0; i < w; i++)
  {
    for (int j = 0; j < h; j++)
    {
      if (bord[i][j] > 0 && gameover == false)

        //het tekenen van Karel
        fill(#F9FA00);

      //Kijkrichting rechts
      if ( richtingBewegen == 1) {
        triangle(i * breedteKarel, j*breedteKarel, i * breedteKarel, (j * breedteKarel) + breedteKarel, (i * breedteKarel) + breedteKarel, (j * breedteKarel) + (breedteKarel /2));
      }

      //kijkrichting links
      else if (richtingBewegen == 3) {    
        triangle((i * breedteKarel)+breedteKarel, j*breedteKarel, i*breedteKarel, (j*breedteKarel)+(breedteKarel /2), (i*breedteKarel)+breedteKarel, (j * breedteKarel + breedteKarel));
      }

      //kijkrichting boven
      else if (richtingBewegen == 0) {       
        triangle((i * breedteKarel), (j * breedteKarel) + (breedteKarel), (i * breedteKarel) + (breedteKarel / 2), j * breedteKarel, (i * breedteKarel) + breedteKarel, (j * breedteKarel) + breedteKarel);
      }

      //kijkrichting onder
      else if (richtingBewegen == 2) {    
        triangle (i * breedteKarel, j*breedteKarel, (i * breedteKarel) + breedteKarel, (j * breedteKarel), ( i * breedteKarel) + (breedteKarel / 2), (j * breedteKarel) + breedteKarel);
      }
      fill(50);
    }
  }
}
void richtingBewegen() {
  switch(richtingBewegen)
  {
  case 0:
    yLocKarel -= 1;

    break;
  case 1:
    xLocKarel += 1;

    break;
  case 2:
    yLocKarel += 1;

    break;
  case 3:
    xLocKarel -= 1;

    break;
  }
}
void richtingBewegen() {
  switch(richtingBewegen)
  {
  case 0:
    yLocKarel -= 1;

    break;
  case 1:
    xLocKarel += 1;

    break;
  case 2:
    yLocKarel += 1;

    break;
  case 3:
    xLocKarel -= 1;

    break;
  }
}
void startSpel()
{

  background(0);
  smooth();

  //startpositie karel is random
  xLocKarel = int(random(0, w));
  yLocKarel = int(random(0, h));

  //richting van Karel bij start, ook random
  richtingBewegen = int(random(0, 3));

  //Lengte van karel
  lengteKarel = (lengteKarel - lengteKarel) + 1;

  //reset score in het spel
  score = 0;
  //timer reset
  startTimer = 0;
  timerStartProgramma = 0;
  timerAan = false;
  int eindeTijd = 60;
  //Als je een piepbal opeet score + 10
  scoreInc = 10;

  //rode bal reset
  boolean rodeBalAanwezig = false;
  int startTimerRodeBal;
  int timerStartRodeBal = 0;
  gameover = false;

  noStroke();

  //de locatie van de piepballen
  for (int i =0; i<aantalPiepballen; i++) {        // door alle piepballen heen loopen
    locatiePiepballen[i][0] = int(random(w ));     //elke piepbal krijgt random x
    locatiePiepballen[i][1] = int(random(h ));     //elke piepbal krijgt random y
  }

  //lokatie van de rode bal
  xLocatieRodeBal = int(random(0, w));
  yLocatieRodeBal = int(random(0, h));
}
void tekenBord() {
  //teken het bord
  for (int i = 0; i < w; i++)
  {
    for (int j = 0; j < h; j++)
    {
      //         noFill();
      //          stroke(20);
      //         rect(i * breedteKarel, j*breedteKarel, breedteKarel, breedteKarel);
      noFill();
      noStroke();
      if (bord[i][j] > 0)

        //zorgt voor de verversing van het bord
        bord[i][j]--;
    }
  }
  //check of Karel niet buiten de schermen komt
  if (xLocKarel >= 0 && xLocKarel < w && yLocKarel >= 0 && yLocKarel < h && bord[xLocKarel][yLocKarel] == 0)
    bord[xLocKarel][yLocKarel] = lengteKarel;
  else
    gameover = true;
}
void tekenPiepballen() {

  ellipseMode(CORNER);
  for (int i = 0; i<aantalPiepballen; i++) {   //deze zorgt ervoor dat hij loopt door alle piepballen afhankelijk van aantal piepballen

    fill(int(random(100, 255)), int(random(100, 255)), int(random(100, 255))); // de kleur van de piepballen 

    ellipse(locatiePiepballen[i][0] * breedteKarel, locatiePiepballen[i][1] * breedteKarel, breedteKarel, breedteKarel);  //0 = x locatie, 1 = y locatie     //i kun je zien als het nummer van de piepbal
  }
}
void tekenRodeBal( ) {
  //rode bal voor extra tijd

  //als het spel nog bezig is en er geen rode bal is
  if (timerStartProgramma/1000 == int(random(0, eindeTijd)) && rodeBalAanwezig == false) {
    rodeBalAanwezig = true;
  }

  //teken de rode bal en na 10 seconden laat de rode bal weer verdwijnen als deze niet is opgepakt
  if (moduloRodeBal > 0 && moduloRodeBal < 10 && rodeBalAanwezig == true) {
    fill(#F06161);

    //tekenen van de rode bal
    ellipse(xLocatieRodeBal * breedteKarel, yLocatieRodeBal * breedteKarel, breedteKarel, breedteKarel);
  }
  //als de bal na 10 seconden nog niet opgepakt is 
  if (moduloRodeBal > 10 && rodeBalAanwezig == true) {

    //geeft de rode bal een nieuwe lokatie
    xLocatieRodeBal = int(random(w));
    yLocatieRodeBal = int(random(h));
  }
}
void tekenScoreEnTijdInGame() {
  //tijd en score in game
  noStroke();
  textAlign(RIGHT);   
  fill(255);
  textFont(visitor, 35);
  text(score, (w * breedteKarel) - breedteKarel, 20);

  //Tijd
  text(timerStartProgramma/1000, ((w * breedteKarel)  /2), 20);
}
void updateHighscore() {
  if (highscore < score) {
    highscore = score;

    // Maakt een nieuwe file aan
    output = createWriter("data/highscore.txt");
    output.println(highscore);

    output.close(); // Schrijft het bestand weg
  }
}
