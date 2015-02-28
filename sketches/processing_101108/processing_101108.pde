

   
int i = 0;
float xpos = 500;
float ypos = 600;
float speed = 3;
int value = 0;
int points;
int flameSize = 50;
int getRandomX()
{
  return int(random(700));
}
int[] flamex = {
  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
};
int[] flamey = {
  0, 0, 0, 0, 0
};
   
   
void setup() {
  size(500, 600);
  frameRate(360);
  smooth();

      size(500,600);
  img = loadImage("crane.jpg");
      size(500,600);
  img = loadImage("menu.jpg");

  img = loadImage ("bomb.png");
  font = loadFont ("Formplex.ttf");
  textFont(font, 100);
  textAlign(CENTER);

}
   
void draw () {
  smooth();
  startGame();
  image("crane.jpg");
}
   
void startGame() {
  if (value == 0) {
    pressStart();
  }
  if (value == 1) {
    level();
  }
}
   
void pressStart() {
  smooth();
  strokeWeight(5);
  
    
   //menu
    size(500,600);
  img = loadImage("menu.jpg");
    

    
    
           
    
  fill(180, 0, 45);
  ellipse(mouseX, mouseY, 40, 40);  
   
   
  smooth();
  fill(255, 0, 0);
  textFont(font, 30);

  
  
   
  
  fill(#12FFF1);
  textFont(font, 25);
  text("How to Play:", width/2, 200);
  text("Use the character to collect bricks", width/2, 240);
  text ("Controls: W,A,S,D", width/2, 280);
  if (mousePressed) {
    value = 1;
  }
}
   
void level() {
  background(0);
  gui();
  character();
  enemy();
  collision();
  }
   
   
   
void enemy() {
  fill (178, 0, 0);
  for (int i=0; i<1; i++)
  {
    ellipse(flamex[i], flamey[i]++, flameSize, flameSize);
  }
}
   
void collision() {
  float distF = dist(xpos, ypos, flamex[i], flamey[i]++);
  if (distF < 60) {
    flamex[i] = getRandomX();
    flamey[i] = 0;
    points++;
  }
  if (flamey[i] > 800) {
    gameEnd();
  }
}
   
   
void character() {
  if (keyPressed) {
    if (key == 'a') {
      xpos -= speed;
    }
    if (key == 'd') {
      xpos += speed;
    }
    if (key == 'w') {
      ypos -= speed;
    }
    if (key == 's') {
      ypos += speed;
    }
  }
  image (img, xpos, ypos);
}
   
void gui() {
  textSize(20);
  textAlign(LEFT, TOP);
  fill(76, 100, 0);
  text("BRICKS:   " + points, 20, 30);
}
   
void gameEnd() {
  background(0);
  fill(#12FFF1);
  textFont(font, 42);
  textAlign(CENTER);
  text("You Missed!", width/2, height/4.5);
  text ("SCORE : " + points, width/2, height/3.5);
  text ("PLAY AGAIN?", width/2, height/2.8);
  text ("Y/N", width/2, height/2.5);
      if(keyPressed){
    if(key == 'y'){
    flamey[i] =0;
    value = 1;
  }if(keyPressed){
   if(key == 'n'){
    value = 0;
  }
  }
  }
}



