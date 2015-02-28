
// Final Project
// Zach Spitulski, November 30th, 2010
// Formatted for iPhone 
// DESMA 28, UCLA

import ddf.minim.*;
Minim minim;
AudioSample pop;
AudioSample buzzer;


// GLOBAL VARIABLES
float slide = 0;
float prevMill = 0;
int nextCircle;
boolean circle1Active, circle2Active, circle3Active, circle4Active, circle5Active, circle6Active, circle7Active, circle8Active, circle9Active;

int defaultSize = 40;
float speed = .93;
int score = 0;
int lives = 3;
//float timer = 0;

float d1 = 40;
float d2 = 40;
float d3 = 40;
float d4 = 40;
float d5 = 40;
float d6 = 40;
float d7 = 40;
float d8 = 40;
float d9 = 40;

PImage logo, bg, menu, image1, image2, image9, Lives3, Lives2, Lives1;
PFont Menufont;

void setup() {
  
  minim = new Minim(this);
 
  // this loads sounds from the data folder
  pop = minim.loadSample("pop.wav", 64);
  buzzer = minim.loadSample("buzzer.wav", 64);

  
   size(400,600);
   background(220);
   imageMode(CENTER);
   noStroke();
   frameRate(30);
   smooth();
   
   logo = loadImage("logo.jpg");
   bg = loadImage("bg.jpg");
   menu = loadImage("menu.jpg");
   image1 = loadImage("1.jpg");
   image2 = loadImage("2.jpg");
   Lives3 = loadImage("3Lives.png"); 
   Lives2 = loadImage("2Lives.png"); 
   Lives1 = loadImage("1Lives.png"); 
   
   Menufont = loadFont("Bebas-22.vlw");
   
 }

void draw() {
  // Draw Main Menu
  if (slide == 0) {
   
    
    
       
    //ROLLOVER BUTTON
    if (mouseX > 250 && mouseX < width && mouseY > 550 && mouseY < height) {
      
      fill(#8DC63F);
      text("Play now >", 270, 585);
      
      if (mousePressed) {
        score = 0;
       slide = 1; 
      }
    }
    
    else {
    textFont (Menufont, 22);
    image(menu, width/2, 300);
    fill(70);
    text("Play now >",270,585); 
    }
    
    if (score > 0) {
      fill(#8DC63F);
      noStroke();
      text("YOUR SCORE:",120,450);
      fill(255);
      text(score, 250,450);
    }
    
    
    
  }

// -------------------!!!!START GAME!!!!! -----------------------------------------
  else if (slide == 1) {
    image(bg, width/2, 300);
    fill(70);    
    millis();
    float thresh = 450;
   
   if (millis() > 2000) {
    
          if (millis() - prevMill >= thresh)
          {
              
            nextCircle = int(random(1,10));
//            println(nextCircle);

// BOOLEANS - allows more than one circle to be activate at one time
// DECLARE BUTTONS
            prevMill = millis();
            
            if (nextCircle == 1) {
              circle1Active = true;
              
              d1 = 120;
            }
            if (nextCircle == 2) {
              circle2Active = true;
              d2 = 120;
            }
            else if (nextCircle == 3) {
              circle3Active = true;
              d3 = 120;
            }
            else if (nextCircle == 4) {
              circle4Active = true;
              d4 = 120;
            }
            else if (nextCircle == 5) {
              circle5Active = true;
              d5 = 120;
            }
            else if (nextCircle == 6) {
              circle6Active = true;
              d6 = 120;
            }
            else if (nextCircle == 7) {
              circle7Active = true;
              d7 = 120;
            }
            else if (nextCircle == 8) {
              circle8Active = true;
              d8 = 120;
            }
            else if (nextCircle == 9) {
              circle9Active = true;
              d9 = 120;
            }
          }
  }
    
    if (circle1Active == true) {    
      d1 = d1*speed;
           // LOSE LIFE
                      if (d1 <= 10) {
                        buzzer.trigger();
                        lives = lives-1;
                        circle1Active = false;
                        d1 = defaultSize;
                      }
          
         float button1 = dist(mouseX, mouseY, 75, 125);
            if (button1 <= d1 && mousePressed) {
                      pop.trigger();
                     circle1Active = false;
                     d1 = defaultSize;
                     fill(255,0,0);
                     ellipse(75,125,d1,d1);
                     score = score+1;
                }
    }
    
   if (circle2Active == true) {
       d2 = d2*speed; 
                // LOSE LIFE
                      if (d2 <= 10) {
                        buzzer.trigger();
                        lives = lives-1;
                        circle2Active = false;
                        d2 = defaultSize;
                      }
       float button2 = dist(mouseX, mouseY, 200, 125);
            if (button2 <= d2 && mousePressed) {
                      pop.trigger();
                     circle2Active = false;
                     d2 = defaultSize; 
                     score = score+1;
                }
    }
    
   if (circle3Active == true) {
     d3 = d3*speed; 
                // LOSE LIFE
                      if (d3 <= 10) {
                        buzzer.trigger();
                        lives = lives-1;
                        circle3Active = false;
                        d3 = defaultSize;
                      }
     
       float button3 = dist(mouseX, mouseY, 325, 125);
            if (button3 <= d3 && mousePressed) {
              pop.trigger();
                     circle3Active = false;
                     d3 = defaultSize; 
                     score = score+1;
                }
    }
    
   if (circle4Active == true) {
    d4 = d4*speed; 
                     // LOSE LIFE
                      if (d4 <= 10) {
                        buzzer.trigger();
                        lives = lives-1;
                        circle4Active = false;
                        d4 = defaultSize;
                      }
       float button4 = dist(mouseX, mouseY, 75, 250);
            if (button4 <= d4 && mousePressed) {
              pop.trigger();
                     circle4Active = false;
                     d4 = defaultSize; 
                     score = score+1;
                }
    }
    
    if (circle5Active == true) {
     d5 = d5*speed; 
                     // LOSE LIFE
                      if (d5 <= 10) {
                        buzzer.trigger();
                        lives = lives-1;
                        circle5Active = false;
                        d5 = defaultSize;
                      }
       float button5 = dist(mouseX, mouseY, 200, 250);
            if (button5 <= d5 && mousePressed) {
              pop.trigger();
                     circle5Active = false;
                     d5 = defaultSize; 
                     score = score+1;
    }
  }
    
    if (circle6Active == true) {
      d6 = d6*speed; 
                     // LOSE LIFE
                      if (d6 <= 10) {
                        buzzer.trigger();
                        lives = lives-1;
                        circle6Active = false;
                        d6 = defaultSize;
                      }
       float button6 = dist(mouseX, mouseY, 325, 250);
            if (button6 <= d6 && mousePressed) {
              pop.trigger();
                     circle6Active = false;
                     d6 = defaultSize; 
                     score = score+1;
    }
  }
      
    
    
    if (circle7Active == true) {
       d7 = d7*speed; 
                     // LOSE LIFE
                      if (d7 <= 10) {
                        buzzer.trigger();
                        lives = lives-1;
                        circle7Active = false;
                        d7 = defaultSize;
                      }
       float button7 = dist(mouseX, mouseY, 75, 375);
            if (button7 <= d7 && mousePressed) {
              pop.trigger();
                     circle7Active = false;
                     d7 = defaultSize; 
                     score = score+1;
    }
  }
    if (circle8Active == true) {
       d8 = d8*speed; 
                     // LOSE LIFE
                      if (d8 <= 10) {
                        buzzer.trigger();
                        lives = lives-1;
                        circle8Active = false;
                        d8 = defaultSize;
                      }
       float button8 = dist(mouseX, mouseY, 200, 375);
            if (button8 <= d8 && mousePressed) {
              pop.trigger();
                     circle8Active = false;
                     d8 = defaultSize; 
                     score = score+1;
    }
      
      
    }
    
    if (circle9Active == true) {
     d9 = d9*speed; 
     
     
                     // LOSE LIFE
                      if (d9 <= 10) {
                        buzzer.trigger();
                        lives = lives-1;
                        circle9Active = false;
                        d9 = defaultSize;
                      }
                 
       float button9 = dist(mouseX, mouseY, 325, 375);
            if (button9 <= d9 && mousePressed) {
              pop.trigger();
                     circle9Active = false;
                     d9 = defaultSize; 
                     score = score+1;
    }
    }
   
   
   fill(255);   
   image(image2,75,125,d1,d1);   
   image(image2,200,125,d2,d2);   
   image(image2,325,125,d3,d3);
   
   // line 2 
   image(image2,75,250,d4,d4);   
   image(image2,200,250,d5,d5);   
   image(image2,325,250,d6,d6);  
   
   //line 3
   image(image2,75,375,d7,d7);   
   image(image2,200,375,d8,d8);   
   image(image2, 325,375,d9,d9);  
   
   
    textFont (Menufont, 22);
    text("SCORE:",250,585);
    fill(#8DC63F);
    text(score,320,585);
    fill(255,0,0);
//    text(lives, 30, 585);

  }
  
// CHECK LIVES
if (lives <= -1) {
   slide = 0;
   lives = 3;
}

else if (lives == 3){
   image(Lives3, 70, 574, 167, 37); 
}
else if (lives == 2){
   image(Lives2, 70, 574, 167, 37); 
}
else if (lives == 1){
   image(Lives1, 70, 574, 167, 37); 
}

}

void stop()
{
  // always close Minim audio classes when you are done with them
  pop.close();
  minim.stop();
  super.stop();
}

    


