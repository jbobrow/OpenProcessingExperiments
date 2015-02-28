
  int moveup = 10; //Moves cube up
  int widthrect = 10; //width of cube
  int heightrect = 10; //length of cube
  int xpos = 10; //starting position of cube
  int ypos = 10; //starting position of cube
  float rxpos = random(0, 250); //postiion of food
  float rypos = random(0, 250); //positon of food
  int foodxpos = int(rxpos); //translates food position into int
  int foodypos = int(rypos); //translates food position into int
  float cubespeed = 1; //speed of cube
  int score = 0; //starting score
  int points = 1; //points
  int highscorecount = 0;
  String totalscore = "score";//score
  String scoretext = "Score";//score
  String highscore = "Highscore"; //highscore word
 String highscoretext="0"; //highscore
  void setup() {
    size (250, 250); //size of canvas
    fill(255); //background color
  }
  void draw() {
    background(255);
    text(scoretext, 20, 20); //score text position
    text(score,60,20); //score position
    text(highscore, 170, 20);//time text position
    text(highscorecount,230,20);//second position
    fill(255);
    rectMode(CENTER); //controlls the shape from the center
    rect(xpos, ypos, widthrect, heightrect);//cube
    fill(0);
    rect(foodxpos, foodypos, 10, 10);//food
    if (key == 'w' || key == 'W') {
      ypos-=cubespeed; //moves the cube up when w is pressed
    }
    if (key == 's' || key == 'S') {
      ypos+=cubespeed; //moves the cube down when y is pressed
    }
    if (key == 'd' || key == 'D') {
      xpos+=cubespeed; //moves the cube right when d is pressed
    }
    if (key == 'a' || key == 'A') {
      xpos-=cubespeed; //moves the cube left when a is pressed
    }
    //if (foodxpos == xpos && foodypos == ypos){
      if (xpos >= foodxpos - 10 && xpos < foodxpos + 10 && ypos >= foodypos - 10 && ypos < foodypos + 10)
      {  
      background(245,0,0);
      float newfoodposx;
      float newfoodposy;
      newfoodposx = random(0,250);
      newfoodposy = random(0,250);
      int foodgeneratedxpos = int(newfoodposx);
      int foodgeneratedypos = int(newfoodposx);
      foodxpos = foodgeneratedxpos;
      foodypos = foodgeneratedypos;
      score += points;
      cubespeed += 0.1;
    }
    if(score>highscorecount)
    {
      highscorecount = score;
    }
    if(xpos>=250 || ypos>=250 || ypos<0 || xpos<0)
    {
      score = 0;
      xpos = 125;
  ypos = 125;
  cubespeed=1;
    }
  }
  
  
  

