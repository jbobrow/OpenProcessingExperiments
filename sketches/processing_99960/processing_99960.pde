

PImage img;
boolean game = true;
boolean start = false;
boolean clicked = false;
int health = 5;
int startHealth = health;
int score = 0;

color c = color(0);
//first rectangle
float x;
float y;
//second rectangle
float x1;
float y1 = height;
//third rectangle
float x2 = 0;
float y2;
//fourth rectangle
float x3 = width;
float y3;
//speeds
float speed;
float speed1;
float speed2;
float speed3;


void setup() {
  size(500,500);
  //size(250,250);
  background(0);
  // Images must be in the "data" directory to load correctly
  img = loadImage("Chasing-Yello-5.png");
}

void draw() {
  if(!start && game == true) {
    textSize(20);
    //textSize(15);
    //text("Click Anywhere To Begin ", 200,250);
    text("Click Anywhere To Begin ", 100,200);
    //text("Click Anywhere To Begin ", 30,100);
  }
  if(game && start) {
    background(#2e3192);
    
    fill(255,255,255);
    textSize(15);
    text("Score: " + score,10,15);
    score = score + 3;
    
    text("Health: " + health, 100,15);
    
    
    move();
    display();
    
    if(health == 0) {
      game = false;
      start = false;
    }
    
    //collision of dropping downward rectangle reset to top
    if( (mouseX - x <= 22 && mouseX - x >= -22) && (mouseY - y <= 35 && mouseY - y >= -35 ) ) {
      health--;
      y = 0;
      x = random(width - 10);
      if (x < 10)
        x = 10;
    }
    
    //collision of upward rectangle reset to bottom
    if( (mouseX - x1 <= 22 && mouseX - x1 >= -22) && (mouseY - y1 <= 35 && mouseY - y1 >= -35 ) ) {
      health--;
      y1 = height;
      x1 = random(width - 10);
      if (x1 < 10)
        x1 = 10;
    }
    
    //collision of right headed rectangle to left
    if( (mouseX - x2 <= 35 && mouseX - x2 >= -35) && (mouseY - y2 <= 22 && mouseY - y2 >= -22 ) ) {
      health--;
      y2 = random(height - 10);
      x2 = 0;
      if (x2 < 10)
        x2 = 10;
    }
    
    //collision of left headed rectangle to right
    if( (mouseX - x3 <= 35 && mouseX - x3 >= -35) && (mouseY - y3 <= 22 && mouseY - y3 >= -22 ) ) {
      health--;
      y3 = random(height - 10);
      x3 = width;
      if (x2 < 10)
        x2 = 10;
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
      background(#FFFF00);
      fill(0,0,0);
      /*textSize(20);
      text("Game Over!", 100, 200);  
      text("Final Score: "+ score, 100, 225);
      text("Play Again? Click Anywhere To Begin", 100, 250);*/
      textSize(15);
      
      /*
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
        */
        
      if(score < 7000)
        text("Good Work, Soldier.", 120, 160);
      if(score >= 7000)
        text("ERIC HAN LEVEL! HAN CHAMPION!", 120, 160);
        
      text("Game Over!", 120, 80);  
      text("Final Score: "+ score, 120, 120);
      text("Play Again? Click Anywhere ", 120, 200);
      text("To Restart!", 120, 240);
      
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
  health = startHealth;
}

void move() {
   fill(0,0,0);
   textSize(20);
  //x = x + speed;
  
  /*
  if(score < 1000) {
    y = y + random(1.5 * speed)+6;
    y1 = y1 - (random(1.5 * speed)+6);
    text("EASY", 80 ,122);
  }
  if(score >= 1000 && score < 2000) {
    y = y + random(2 * speed)+7;
    y1 = y1 - (random(2 * speed)+7);
    text("NORMAL", 80 ,122);
  }
  if(score >= 2000 && score < 3000) {
    y = y + random(2.5 * speed)+8;
    y1 = y1 - (random(2.5 * speed)+8);
    text("HARD", 80 ,122);
  }
  if(score >= 3000 && score < 5000) {
    y = y + random(3 * speed)+9;
    y1 = y1 - (random(3 * speed)+9);
    text("HELL", 80 ,122);
  }
  if(score >= 5000) {
    y = y + random(4 * speed)+10;
    y1 = y1 - (random(4 * speed)+10);
    text("~HADES KINGDOM~", 30 ,122);
  }
  */
  
  
  if(score < 2000) {
    /*
    y = y + random(2 * speed+7);
    y1 = y1 - (random(2 * speed+7));
    */
    text("NORMAL", 180 ,220);
    if(y == 0) 
      speed = random(5)+6;
    if(y1 == height) 
      speed1 = random(5)+6;
    if(x2 == 0)
      speed2 = random(5)+6;
    if(x3 == width)
      speed3 = random(5)+6;
  }
  
  
  if(score >= 2000 && score < 5000) {
    //y = y + random(3 * speed+9);
    //y1 = y1 - (random(3 * speed+9));
    text("HARD", 180 ,220);
    if(y==0)
      speed = random(5) + 9;
    if(y1 == height) 
      speed1 = random(5) + 9;
    if(x2 == 0)
      speed2 = random(5) + 9;
    if(x3 == width)
      speed3 = random(5) + 9;
  }
 
  if(score >= 5000) {
    //y = y + random(4 * speed+10);
    //y1 = y1 - (random(4 * speed+10));
    text("~HADES KINGDOM~", 180 ,220);
    if(y==0)
      speed = random(5) + 15;
    if(y1 == height) 
      speed1 = random(5) + 15;
    if(x2 == 0)
      speed2 = random(5) + 15;
     if(x3 == width)
      speed3 = random(5) + 15;
  }
  
  y = y + speed;
  y1 = y1 - speed1;
  x2 = x2 + speed2;
  x3 = x3 - speed3;
  
  //fourth rectangle going back to the right side
  if (x3 < 1) {
    x3 = width;
    y3 = random(height - 10);
    if (y3 < 10) 
      y3 = 10;
  }
  
  //third rectangle going back to the left side
  if (x2 > height-1) {
    x2 = 0;
    y2 = random(height - 10);
    if (y2 < 10) 
      y2 = 10;
  }
  
  //second rectangle going back to bot
  if (y1 < 1) {
    y1 = height;
    x1 = random(width - 10);
    if (x1 < 10) 
      x1 = 10;
  }
  
  //first rectangle going back to top
  if (y > height-1) {
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
   rect(x1,y1,10,30);
   rect(x2,y2,30,10);
   rect(x3,y3,30,10);
}



