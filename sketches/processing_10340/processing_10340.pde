
int card = 1;

PImage card_1;
PImage card_2;
PImage card_3;
PImage card_4;
PImage card_5;
PImage card_6;
PImage card_7;
PImage card_8;
PImage card_9;

boolean move = true;

//SETUP---------------------------------------

void setup() {
  size(640, 480);
  smooth();

  card_1 = loadImage("01.png");
  card_2 = loadImage("02.png");
  card_3 = loadImage("03.png");
  card_4 = loadImage("04.png");
  card_5 = loadImage("05.png");
  card_6 = loadImage("06.png");
  card_7 = loadImage("07.png");
  card_8 = loadImage("08.png");
  card_9 = loadImage("09.png");

}

//DRAW-----------------------------------------
void draw() {

  //CARD ONE-----------------------------------
  if(card == 1) {
    background(0);

    fill(255);
    image(card_1, 0, 0);

    //COOKIEJAR--------------------------------
    noStroke();
    noFill();
    ellipse(355, 470, 80, 80);

    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 355, 470);
      if (d < 50) {
        card = 3;
        move = false;
      }
    } 
    //PIE--------------------------------------
    noStroke();
    noFill();
    ellipse(365, 370, 40, 40);

    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 365, 370);
      if (d < 50) {
        card = 2;
        move = false;
      }
    } 

  }//CARD TWO------------------------------------
  else if (card == 2) { 
    background(0);

    fill(255);
    image(card_2, 0, 0);
  }
  if(card == 2) {
    //WRONG WAY----------------------------------
    noStroke();
    noFill();
    ellipse(450,330, 80, 80); 

    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 450,330);
      if (d < 25) {
        card = 3;
        move = false;
      }
    } 
    //RIGHT WAY----------------------------------
    noStroke();
    noFill();
    ellipse(270, 330, 80, 80);

    if (mousePressed && move) {
      float d = dist(mouseX, mouseY, 270, 330);
      if (d < 25) {
        card = 4;
        move = false;
      }
    }
  
  }//CARD THREE------------------------------------
  else if (card == 3) { 
    background(0);

    fill(255);
    image(card_3, 0, 0);
    //STARTOVER-----------------------------------
    if(card == 3) {
      background(0);

      fill(255);
      image(card_3, 0, 0);

      noStroke();
      noFill();
      ellipse(500, 450, 200, 200);

      if (mousePressed && move) {
        float d = dist(mouseX, mouseY, 500, 450);
        if (d < 50) {
          card = 1;
          move = false;
        }
      }
    }
    
  }//CARD FOUR------------------------------------
  else if (card == 4) { 
    background(0);

    fill(255);
    image(card_4, 0, 0);
  }
    if(card == 4) {
      background(0);
      
      fill(255);
      image(card_4,0,0);
      //PUT ON------------------------------------
      noStroke();
      noFill();
      ellipse(435, 385, 50, 50);
      
      if(mousePressed && move) {
        float d = dist(mouseX, mouseY, 435, 385);
        if (d < 50) {
          card = 5;
          move = false;
        }
      }
       //SAVE FOR LATER---------------------------
       noStroke();
       noFill();
       ellipse(406, 285, 80, 80);
       
       if(mousePressed && move) {
         float d = dist(mouseX, mouseY, 406, 285);
         if (d < 50) {
           card = 6;
           move = false;
         }
       }
       
   }//CARD FIVE------------------------------------
    else if (card ==5) {
     background(0);
     
     fill(255);
     image(card_5, 0, 0);
    
    }//STARTOVER-----------------------------------
    if(card == 5) {
      background(0);

      fill(255);
      image(card_5, 0, 0);

      noStroke();
      noFill();
      ellipse(120, 400, 150, 150);

      if (mousePressed && move) {
        float d = dist(mouseX, mouseY, 120, 400);
        if (d < 50) {
          card = 1;
          move = false;
        }
      }
      
   }//CARD SIX-------------------------------------
    else if (card ==6){
      background(0);
       
      fill(255);
      image(card_6, 0, 0);
    }
    if(card == 6) {
      background(0);
       
      fill(255);
      image(card_6,0,0);
      //REMEMBER-----------------------------------
      noStroke();
      noFill();
      ellipse(200, 250, 60, 60);
    
      if (mousePressed && move) {
        float d = dist(mouseX, mouseY, 200, 250);
        if (d < 50) {
          card = 7;
          move = false;
        }
      }
      //FORGET---------------------------------------
      noStroke();
      noFill();
      ellipse(350, 330, 80, 80);
       
      if (mousePressed && move) {
        float d = dist(mouseX, mouseY, 350, 330);
        if (d < 50) {
           card = 8;
           move = false;
        }
       }
       
     }//CARD SEVEN-----------------------------------
       else if (card == 7) {
         background(0);
       
         fill(255);
         image(card_7, 0, 0);
       }//STARTOVER-----------------------------------
       if(card == 7) {
         background(0);

         fill(255);
         image(card_7, 0, 0);

         noStroke();
         noFill();
         ellipse(160, 390, 40, 40);

         if (mousePressed && move) {
           float d = dist(mouseX, mouseY, 160, 390);
           if (d < 50) {
             card = 9;
             move = false;
        }
       }
       
   }//CARD EIGHT------------------------------------
     else if (card == 8) {
       background(0);
         
       fill(255);
       image(card_8, 0, 0);
      }//STARTOVER-----------------------------------
       if(card == 8) {
         background(0);

         fill(255);
         image(card_8, 0, 0);

         noStroke();
         noFill();
         ellipse(510, 420, 150, 150);

         if (mousePressed && move) {
           float d = dist(mouseX, mouseY, 510, 420);
           if (d < 50) {
             card = 1;
             move = false;
           }
         }
         
   }//CARD NINE---------------------------------------
     else if (card == 9) {
       background(0);
       
       fill(255);
       image(card_9, 0, 0);
     }//STARTOVER-----------------------------------
       if(card == 9) {
         background(0);

         fill(255);
         image(card_9, 0, 0);

         noStroke();
         noFill();
         ellipse(410, 440, 150, 150);

         if (mousePressed && move) {
           float d = dist(mouseX, mouseY, 410, 440);
           if (d < 50) {
             card = 1;
             move = false;
           }
         }
       }
 
  println(card);
} 


//gets called every time mouse is released---------
void mouseReleased() {
  move = true;
}

