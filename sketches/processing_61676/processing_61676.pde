
/*
Duck Hunt imitation created by Trevor Wong
*/
//ArrayList<Duckhunt> dh = new ArrayList<Duckhunt>();
PImage duckImg;
//PImage duck1Img;
//PImage duck2Img;
PImage crosshair;
PImage bg;

Duck[] ducks;
int numDucks = 15;
int score = 0;
int round = 3;

int yPos;

//boolean fire;
boolean missed = false;
boolean gameover = false;
boolean hit = false;


float[] x = new float[numDucks];
float[] y = new float[numDucks];


PVector position, vel;
void setup() {
  bg = loadImage("duck_hunt.jpg");
   duckImg = loadImage("Duck.jpg");
   crosshair = loadImage("Crosshair.jpg");
   //duck1Img = loadImage("DuckMedium.jpg");
   //duck2Img = loadImage("DuckLarge.jpg");
   size(1440,900);
   frameRate(60);
   position = new PVector((int)(width),50);
   vel = new PVector(4,0);
   
   ducks = new Duck[numDucks];
  for(int i = 0; i < numDucks; i++) {
   ducks[i] =
       new Duck(int(random(width)),int(random(height)));
    x[i] = random(width);
    y[i] = random(height);
 
  }
}

boolean Hit() {
 if( numDucks == 1);
   numDucks--;
   
   return true;
}
void mousePressed() {
  
  
  score++;
  println(score);
  
  if(mouseX == 50 && mouseY == 40){
    if( hit ) {
      numDucks--;
    }
  }
}

void reset() {
  if(numDucks == 0) {
    
  }
}

void Round() {
 if( numDucks > 15) {
   for(int i = 1; i <= round; i++) {
    fill(0);
    textSize(30);
    text("Round: " + round, width/2, 200);
   }
 } 
}
void Menu() {
  background(0);
  fill(0);
  textSize(31.5);
  text("Press Enter to play", 105, 200);
  if ( keyCode == ENTER ) {
  }
}

void inGame() {
  fill(0);
  textSize(30);
  text("Score: " + score, width/2, 50);
} 

void Lose() {
  if ( numDucks > 15 ) {
  textSize(50);
  text("Game Over ", width/2, 200);
  }
}  

void draw() {
  Menu();
  background(bg);
  Round();
  inGame();
  Lose();
  reset();
  
  position.add(vel);
    if ( position.y >= height ) {
      vel.y = -vel.y;
    }
    
   //for each duck, draw it!
       for(int i = 0; i < numDucks; i++) {
        image(crosshair, mouseX - crosshair.width/2, mouseY - crosshair.height/2);
         if(x[i] > width) {
         x[i] = random(width);
         y[i] = random(height);
       }
     point(x[i],y[i]);
   }
   
   for( int a = 0; a < width; a +=15) {
     int x = int(random(duckImg.width-0));
   
   }
   for(Duck d : ducks) {
     for(int i = 0; i < numDucks; i++) {
        if(x[i] > width) {
        x[i] = random(width);
        y[i] = random(height);
        if(i < 15) {
        loop();
         }
       }
     }
       d.x += 5;
       //d.y--;
       
        //x1 = random(d);
       //random(d.y += 5);
      d.render();
      
        if(mousePressed == true) {
          image(crosshair, mouseX - crosshair.width/2, mouseY - crosshair.height/2);
        
        }
   }
}

public class Duck {
   int x,y;
   
   PVector dk;
   float xDk, yDk;
   public Duck  (int xLoc, int yLoc) {
     //int dc = (int)(Math.random() * 500);
     //dk = new PVector(0,dc);
     //x1 = (int)(dk.x);
      x = xLoc;
      y = yLoc;
      
   }


public void render() {
//paints itself @ (x,y)
image(duckImg,x,y);
//image(duck1Img,x,y);
//image(duck2Img,x,y);
  }
}

