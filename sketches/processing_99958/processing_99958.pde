

PImage img;
boolean game = true;
boolean start = false;
boolean clicked = false;
int health = 3;
int score = 0;

color c = color(0);
float x;
float y;
float speed = 2.5;
float numSquares = 8;

void setup() {
  //size(500,500);
  size(250,250);
  background(0);
  // Images must be in the "data" directory to load correctly
  img = loadImage("Chasing-Yello-5.png");
}

void draw() {
  if(!start && game == true) {
    //textSize(20);
    textSize(15);
    //text("Click Anywhere To Begin ", 200,250);
    text("Click Anywhere To Begin ", 30,100);
  }
  if(game && start) {
    background(#2e3192);
    
    fill(255,255,255);
    textSize(15);
    text("Score: " + score,10,15);
    score += 3;
    
    text("Health: " + health, 100,15);
    
    
    move();
    display();
    
    if(health == 0) {
      game = false;
      start = false;
      //clicked = false;
    }
    
    if( (mouseX - x <= 22 && mouseX - x >= -22) && (mouseY - y <= 35 && mouseY - y >= -35 ) ) {
      health--;
      y = 0;
      x = random(width - 10);
    }
    
    //text("" + x + "," + y, 30,30);
    
    if(mouseX > width - 17) 
      mouseX = width - 17;
  
    if(mouseX < 17) 
      mouseX = 17;
    
    if(mouseY > height - 30) 
      mouseY = height - 30;
    
    if(mouseY < 22)
      mouseY = 22;
  
    image(img, mouseX-17, mouseY-22);
  }  
  if(!game && !start) {
    //clicked = false;
    //if(clicked = false) {
      background(255);
      fill(0,0,0);
      /*textSize(20);
      text("Game Over!", 100, 200);  
      text("Final Score: "+ score, 100, 225);
      text("Play Again? Click Anywhere To Begin", 100, 250);*/
      textSize(15);
      if(score < 1000)
        text("Good Work, Private.", 10, 40);
      if(score >= 1000 && score < 2000)
        text("Good Work, Sergeant.", 10, 40);
      if(score >= 2000 && score < 3000)
        text("Good Work, Lieutenant.", 10, 40);
      if(score >= 3000 && score < 5000)
        text("Good Work, Captain.", 10, 40); 
       if(score >= 5000)
        text("SALUTE!!, General!", 10, 40); 
      text("Game Over!", 10, 80);  
      text("Final Score: "+ score, 10, 120);
      text("Play Again? Click Anywhere ", 10, 160);
      text("To Restart!", 10, 200);
      
    //}
    
    //if(clicked = true) {
      //background(0);
    //}
  }
}

void mousePressed() {
  start = true;
  //clicked = true;
  if (!game) {
    game = true;
    reset();
  }
  //reset();
}

void reset() {
  score = 0;
  health = 3;
}

void move() {
   fill(0,0,0);
   textSize(20);
  //x = x + speed;
  if(score < 1000) {
    y = y + 1.5 * speed;
    text("EASY", 80 ,122);
  }
  if(score >= 1000 && score < 2000) {
    y = y + 2 * speed;
    text("NORMAL", 80 ,122);
  }
  if(score >= 2000 && score < 3000) {
    y = y + 3 * speed;
    text("HARD", 80 ,122);
  }
  if(score >= 3000 && score < 4000) {
    y = y + 4 * speed;  
    text("HELL", 80 ,122);
  }
  if(score >= 5000) {
    y = y + 5 * speed;  
    text("~HADES KINGDOM~", 30 ,122);
  }
  
  if (y > height) {
    y = 0;
    x = random(width - 10);
    if (x < 10) 
      x = 10;
  }
}

//int k = 0;
void display() {
  fill(c);
   rect(x,y,10,30); 
}


