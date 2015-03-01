
//All Images
PImage Steel;
PImage Tower;
PImage Crosshair;
PImage Purple;
PImage Blue;
PImage Red;
int i;
int redNum = 1;
float minSpeed = 0.5;
float maxSpeed = 5;
int score = 0;
boolean gameover = false;

int[] Xpos = new int[2];
int[] Ypos = new int[2];

RED red1;
BLUE blue1;
PURPLE purple1;

 
void setup(){
  size(500,500);
  imageMode(CENTER);
//loading images
  Steel = loadImage("steel.png");
  Tower = loadImage("tower2.png");
  Crosshair = loadImage ("cross.png");
  Purple = loadImage ("purplegordo.png");
  Blue = loadImage ("bluegordo.png");
  Red = loadImage ("redgordo.png");
  
  Xpos[0] = 15;
  Xpos[1] = width - 15;
  Ypos[0] = 15;
  Ypos[1] = height - 15;
  
  blue1 = new BLUE(Xpos[int(random(-1,2))],Ypos[int(random(-1,2))],random(minSpeed,maxSpeed),random(minSpeed,maxSpeed),random(300));
  red1 = new RED(Xpos[int(random(-1,2))],Ypos[int(random(-1,2))],random(minSpeed,maxSpeed),random(minSpeed,maxSpeed),random(300));
  purple1 = new PURPLE(Xpos[int(random(-1,2))],Ypos[int(random(-1,2))],random(minSpeed,maxSpeed),random(minSpeed,maxSpeed),random(300));
}
 
void draw(){

  
  
  
//Hide cursor + background
 noCursor();
   image(Steel, 255, 250);
  
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("Score: " + score,250,30);

  
  if(gameover == false){
    red1.update();
    blue1.update();
    purple1.update();
    
  //Red LAZAH 
    if (mousePressed && (mouseButton == LEFT)) {
    stroke(#C40000);
    strokeWeight(10);
    line(250,250,mouseX,mouseY);
    stroke(#810000);
    strokeWeight(7);
    line(250,250,mouseX,mouseY);
    stroke(#430000);
    strokeWeight(2);
    line(250,250,mouseX,mouseY);
    }
  
  //Blue LAZAH  
    if (mousePressed && (mouseButton == RIGHT)) {
    stroke(#0093E0);
    strokeWeight(10);
    line(250,250,mouseX,mouseY);
    stroke(#002CFF);
    strokeWeight(7);
    line(250,250,mouseX,mouseY);
    stroke(#000E50);
    strokeWeight(2);
    line(250,250,mouseX,mouseY);
    }
    
   
   //turret roates with mouse  
   
    image(Crosshair, mouseX, mouseY);
    pushMatrix(); 
    translate(width/2,height/2);
    float theta = PI*mouseX / width; 
    rotate(theta);
    image(Tower, 0,0);
    popMatrix();
    
  } else {
    textSize(40);
    text("Game Over", 250, 210);
    text("Score: " + score, 250, 260);
  }
  fill(#989393);
  rect(0,0,50,50);
  rect(450,0,50,50);
  rect(0,450,50,50);
  rect(450,450,50,50);
}

// RED class

class RED {
  
  int X;
  int Y;
  int Xdir;
  int Ydir;
  boolean spawned;
  int T;
  
  RED(int x, int y, int xdir, int ydir,int timer){
    X = x;
    Y = y;
    Xdir = xdir;
    Ydir = ydir;
    spawned = false;
  }
  
  void update(){
   if( T <= 0){
     spawned = true;
   }
   else{
     T--;
   }
   
   if(X>= 230 && X <= 270){
     if(Y>=230 && Y <= 270){
       gameover = true;
     }
   }
   
    if(X < 5 || X > width -5){
      Xdir *= -1;
    }
    if(Y < 5 || Y > height -5){
      Ydir *= -1;
    }
      if(spawned==true){
        if (mousePressed && (mouseButton == LEFT)) {
          if(X >= mouseX - 10 && X <= mouseX + 10){
            if(Y >= mouseY -10 && Y <= mouseY + 10){
              spawned = false;
              X = Xpos[int(random(-1,2))];
              Y = Ypos[int(random(-1,2))];
              T = random(300);
              // reassign spawn position
              // increment the score
              Xdir = random(0.5,10);
              Ydir = random(0.5,10);
              score++;
            }
          }
        }
      X+=Xdir;
      Y+=Ydir;
      }
      // draw the enemy
      
      image(Red,X,Y);
    
  }
}

// BLUE class

class BLUE {
  
  int X;
  int Y;
  int Xdir;
  int Ydir;
  boolean spawned;
  int T;
  
  BLUE(int x, int y, int xdir, int ydir,int timer){
    X = x;
    Y = y;
    Xdir = xdir;
    Ydir = ydir;
    spawned = false;
  }
  
  void update(){
   if( T <= 0){
     spawned = true;
   }
   else{
     T--;
   }
   
   if(X>= 230 && X <= 270){
     if(Y>=230 && Y <= 270){
       gameover = true;
     }
   }
   
    if(X < 5 || X > width -5){
      Xdir *= -1;
    }
    if(Y < 5 || Y > height -5){
      Ydir *= -1;
    }
      if(spawned==true){
        if (mousePressed && (mouseButton == RIGHT)) {
          if(X >= mouseX - 10 && X <= mouseX + 10){
            if(Y >= mouseY -10 && Y <= mouseY + 10){
              spawned = false;
              X = Xpos[int(random(-1,2))];
              Y = Ypos[int(random(-1,2))];
              T = random(300);
              // reassign spawn position
              // increment the score
              Xdir = random(0.5,10);
              Ydir = random(0.5,10);
              score++;
            }
          }
        }
      X+=Xdir;
      Y+=Ydir;
      }
      // draw the enemy
      
      image(Blue,X,Y);
    
  }
}

// PURPLE class

class PURPLE {
  
  int X;
  int Y;
  int Xdir;
  int Ydir;
  boolean spawned;
  int T;
  boolean red = false;
  boolean blue = false;
  
  PURPLE(int x, int y, int xdir, int ydir,int timer){
    X = x;
    Y = y;
    Xdir = xdir;
    Ydir = ydir;
    spawned = false;
  }
  
  void update(){
   if( T <= 0){
     spawned = true;
   }
   else{
     T--;
   }
   
   if(X>= 230 && X <= 270){
     if(Y>=230 && Y <= 270){
       gameover = true;
     }
   }
   
    if(X < 5 || X > width -5){
      Xdir *= -1;
    }
    if(Y < 5 || Y > height -5){
      Ydir *= -1;
    }
      if(spawned==true){
        if (mousePressed && (mouseButton == LEFT)) {
          if(X >= mouseX - 10 && X <= mouseX + 10){
            if(Y >= mouseY -10 && Y <= mouseY + 10){
              red = true;
            }
          }
        }
        if (mousePressed && (mouseButton == RIGHT)) {
          if(X >= mouseX - 10 && X <= mouseX + 10){
            if(Y >= mouseY -10 && Y <= mouseY + 10){
              blue = true;
            }
          }
        }
        if(red == true && blue ==true){
          spawned = false;
          X = Xpos[int(random(-1,2))];
          Y = Ypos[int(random(-1,2))];
          red = false;
          blue = false;
          T = random(300);
              // reassign spawn position
              // increment the score
          Xdir = random(0.5,10);
          Ydir = random(0.5,10);
          score += 2;
        }
      X+=Xdir;
      Y+=Ydir;
        
      }
      // draw the enemy
      
      image(Purple,X,Y);
    
  }
}


