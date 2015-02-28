
Monster myMonster; //objects as global variables
Bird myBird;
Quad[]quads = new Quad [7]; //array of quads
boolean mouseOverMonster = false; //variable to check if mouse is over the monster
boolean startGame = false; //variable to check if the game has startet
boolean clickedMonster = false; //variable to check if the mouse was pressed on the monster
boolean gameOver = false;  //variable to check if the game is over
boolean mouseOverBird = false;  //variable to check if mouse is over the bird
boolean clickedBird = false;  //variable to check if the mouse was pressed on the bird
int score = 0; //variable to count the score
int lives = 3; //variable to count remaining lives

void setup(){
  size(900, 400);
  myMonster = new Monster(); //initializes new monster object
  for (int i = 0; i < quads.length; i++){  //for loop to initialize every bird in the array
    quads[i] = new Quad((1+i)*50*random(3), (1+i)*10*random(3), (1+i)*50, (1+i)*60); //values for x/y position, x/y speed, size and color
  }  
  myBird = new Bird(); //initializes new bird object
}

void draw(){
  smooth();
  background(100);
  if(startGame == false && gameOver == false){  //startscreen is shown before the game is startet
    startScreen();                              //but only if the game was not lost before, otherwise the game over screen appears
  }
  else if(startGame == true){  //as soon as the mouse is clicked once, the game starts
   myMonster.display(); //show monster
   myMonster.move();  //move monster
    
    for (int i = 0; i < quads.length; i++){  //for loop to show and move every quad
      quads[i].display();
      quads[i].move();
    }
    myBird.display();  //show bird
    myBird.move();  //move bird
    fill(0);
    PFont font;
    font = loadFont("ArialMT-48.vlw");
    textFont(font, 30);
    text("score: "+score, 10, 40); //score is shown on the screen
    text("lives: "+lives, 10, 80); //remaining lives are shown on the screen
  }
  else if (gameOver == true){  //if gameOver is set true in the myMonster.move function, the game over screen appears 
    gameOverScreen();
  }
}

void startScreen(){  //function for start screen, contains instructions for playing
  fill(0);
  PFont font;
  font = loadFont("ArialMT-48.vlw");    
  textFont(font, 40);
  text("catch the square monster to score!", 10, 60);
  textFont(font, 20);
  text("- if it reaches the left border you lose a live,", 10, 120);
  text("- if you hit the bird you lose score", 10, 160);
  textFont(font, 60);
  text("click to start!", 10, 270);
}

void gameOverScreen(){  //function for game over screen
  fill(0);
  PFont font;
  font = loadFont("ArialMT-48.vlw");    
  textFont(font, 60);
  text("game over!", 10, 70);
   textFont(font, 40);
  text("your score: "+score, 10, 160);
  textFont(font, 60);
  text("click to play again!", 10, 280);
} 

void mouseClicked() { //function to set startGame true to start the game
  if (startGame == false){
  startGame = true;
  score = 0;  //score is reset when a new game starts
  }
}

void mousePressed() {  //if clickedMonster or clicked bird are true, mouseRelease function gets activated
  if(mouseOverMonster == true && mouseOverBird == false){  //if the mouse is pressed and has the same position as the monster,
    clickedMonster = true;                                 //but not over the bird clickedMonster is set true (you score)
    clickedBird = false;
  } 
  else if(mouseOverMonster == true && mouseOverBird == true){ //if the mouse is pressed over bird and monster, 
    clickedBird = true;                                       //only clickedBird is set true (you lose score)
    clickedMonster = false;  
  }
  else if(mouseOverMonster == false && mouseOverBird == false){  //if the mouse pressed is neither over the monster nor the bird
    clickedBird = false;                                         //nothing is set true (nothing happens)
    clickedMonster = false;
  }
  else if(mouseOverMonster == false && mouseOverBird == true){  //if the mouse is pressed and has the same position as the bird,
    clickedMonster = false;                                     //but not over the monster clickedbird is set true (you lose score)
    clickedBird = true;
  }
}

void mouseReleased(){    
   if(clickedMonster == true){  //if the mouse is released while clickedMonster is true,the monster goes back behind the right border 
     myMonster.x = width+50;
     myMonster.y = 10;
     myMonster.changeSpeed();  //the speed in y direction changes  
     score += 1; //score increases by 1
   }
   else if(clickedBird == true){ //if the mouse is released while clickedBird is true, the score decreases by 1
     score -= 1;
   }
   
}
 
class Monster{ //defines the monster object
  float x;  // variable to move object in x-direction
  float y;  // variable to move object in y-direction
  float speedX; //variable for speed in x-direction
  float speedY; //variable for speed in y-direction
  float gravity; //variable for gravity
  
  Monster(){ //constructor, variables get initialized
    x = width;  
    y = 10;
    gravity = 0.2;
    speedX = -3;
  }
  
  void display(){ //shape of the monster
    noStroke();
    fill(0); //shadow color black
    rect(x+42, y+32, 73, 77); //body shadow 
    rect(x+55, y+108, 13, 27); //front leg shadow 
    rect(x+95, y+108, 13, 27); //hind leg shadow 
    triangle(x+15, y+88, x+55, y+103, x+25, y+115); //mouth shadow 
    quad(x+55, y+8, x+82, y+25, x+55, y+55, x+35, y+45); // ear shadow     
    fill(255); //teeth color white
    quad(x+37, y+93, x+27, y+93, x+12, y+73, x+13, y+67); //teeth
    fill(60, 200, 80); //body color green
    rect(x+37, y+27, 73, 77); //body
    rect(x + 50, y + 103, 13, 27); //front leg
    rect(x+90, y+103, 13, 27); //hind leg
    quad(x+37, y+27, x+37, y+103, x+10, y+63, x+23, y+27); //nose
    triangle(x+10, y+83, x+50, y+98, x+20, y+110); //mouth
    fill(255); //horn color white
    triangle(x+27, y+8, x+50, y+30, x+40, y+42); //horn
    fill(60, 200, 80); //ear color green
    quad(x+50, y+3, x+77, y+20, x+50, y+50, x+30, y+40); //ear 
    fill(0);  //eye color black
    quad(x+37, y+53, x+43, y+60, x+37, y+67, x+30, y+60); //eye
  }
  
  void move(){
    if (mouseX >= x+37 && mouseX <= x + 110 && mouseY >= y + 27 && mouseY <= y + 104){
      mouseOverMonster = true;  //set mouseOver true as long as the position of the mouse is the position of the ball
    }                           //(activates mousePressed function)
    else{
      mouseOverMonster = false;
    }
    x += speedX;  //x position changes
    if( x <= -150){  //if the monster crosses the left border it will start at the right border again
      x = width+50;
      y = 10;
      changeSpeed();  //the speed in y direction changes
      lives -= 1;  //number of lives decreases
      if (lives <= 0){  //if no lives are left, the game is over
        gameOver = true;  //activates the game over screen 
        startGame = false;  //stops the game
        lives = 3;  //lives are reset
      }
    }
    y += speedY; //y position changes
    speedY += gravity; //gravity is added to speed
    if( y < 0 || y > height-130){
      speedY *= -1; //if the monster reaches the top or bottom, direction changes
    }   
  }
  void changeSpeed(){   //function for random speed in y direction
  speedY = random(1, 7);
  } 
  
}
class Bird{  //bird class
  float x;  //variables for position
  float y;
  float speedX;  //variables for speed
  float speedY;
  float s;  //variable for size

  Bird(){ //constructor, initialize variables 
    x = 0;      
    y = 0;
    speedX = 4;
    speedY = 3;
    s = 1;
  }
  
  void display(){
    fill(0); //shadow
    quad(x+45*s, y+15*s, x+165*s, y+20*s, x+145*s, y+90*s, x+60*s, y+90*s); //head shadow
    quad(x+10*s, y+110*s, x+90*s, y+170*s, x+95*s, y+200*s, x+20*s, y+180*s); //left wing shadow
    ellipse(x+102*s, y+100*s, 100*s, 60*s); //mouth shadow
    quad(x+90*s, y+115*s, x+116*s, y+115*s, x+125*s, y+160*s, x+100*s, y+170*s); //neck shadow
    ellipse(x+150*s, y+190*s, 140*s, 90*s); //body shadow
    quad(x+150*s, y+170*s, x+235*s, y+60*s, x+260*s, y+130*s, x+170*s, y+180*s); //right wing shadow
    triangle(x+140*s, y+230*s, x+170*s, y+230*s, x+155*s, y+290*s); //left leg shadow
    triangle(x+170*s, y+230*s, x+200*s, y+210*s, x+185*s, y+290*s); //right leg shadow
    fill(60, 200, 80);
    quad(x+35*s, y+5*s, x+155*s, y+10*s, x+135*s, y+80*s, x+50*s, y+80*s); //head
    fill(0);
    ellipse(x+73*s, y+52*s, 44*s, 44*s); //left eye
    ellipse(x+114*s, y+52*s, 44*s, 44*s); //right eye
    fill(255);
    quad(x+0*s, y+100*s, x+80*s, y+160*s, x+85*s, y+190*s, x+10*s, y+170*s); //left wing
    fill(60, 200, 80);
    ellipse(x+92*s, y+90*s, 100*s, 60*s); //mouth
    quad(x+80*s, y+105*s, x+106*s, y+105*s, x+115*s, y+150*s, x+90*s, y+160*s); //neck
    ellipse(x+140*s, y+180*s, 140*s, 90*s); //body
    fill(255);
    quad(x+140*s, y+160*s, x+225*s, y+50*s, x+250*s, y+120*s, x+160*s, y+170*s); //right wing 
    fill(60, 200, 80);
    triangle(x+130*s, y+220*s, x+160*s, y+220*s, x+145*s, y+280*s); //left leg
    triangle(x+160*s, y+220*s, x+190*s, y+200*s, x+175*s, y+280*s); //right leg
  }
  
  void move(){
    if(mouseX > x+45*s && mouseX < x+205*s && mouseY > y+15*s && mouseY < y+235*s){
      mouseOverBird = true;        //if mouse is at the same position as the bird, mouseOverBird is true
    }                              //(activates mousePressed function)
    else{
      mouseOverBird = false;
    }
    x += speedX;    //x position changes
    if(x < 0 || x > width-260*s){  //if a bird reaches the left or right border it changes direction
      speedX *= -1;
    }
    y += speedY;
    if(y < 0 || y > height-280*s){  //if a bird reaches the top or the bottom it changes direction
      speedY *= -1;
    }
      
  }
  
  
}
class Quad{
   float x;  //variables for position
   float y;
   float s; //variable for size
   float colors;  //variable for color
   float speedX;  //variable for speed

  Quad(float xQuad, float yQuad, float sizeQuad, float colorQuad){ //constructor with arguments 
    x = xQuad;      
    y = yQuad;
    s = sizeQuad;
    colors = colorQuad;
    speedX = 1*random(-2,2);  //quads have different speeds and move in different directions
  }
  
  void display(){  //shape of the quads
    fill(0);
    rect(x+s/20, y+s/20, s, s);  //shadow
    fill(colors, colors/5, colors/2);
    rect(x, y, s, s);  //quad
  }
  
   void move(){
    x += speedX;    //x position changes
    if(x < 0 || x > width){  //if a quad reaches the left or right border it changes direction
      speedX *= -1;
    }
      
  }
}

//report: lisameyer.creativetechnologies.info/2013/01/08/creative-coding-assignment-3/
