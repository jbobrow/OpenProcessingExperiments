
//------------- CITYLIGHTS --------------//

PImage lights1;
PImage lights2;
PImage lights3;
PImage lights4;
PImage lights5;
PImage lights6;
PImage lights7;
PImage lights8;
PImage lights9;
PImage lights10;
PImage lights11;
PImage lights12;
PImage lights13;
PImage citylights;
PImage darkness;
PImage boat;
PImage daytime;


void setup()  {
  size(900, 300);
  noStroke();
  smooth();

  
//LOADING IMAGES
lights1 = loadImage("lights1.png");
lights2 = loadImage("lights2.png");
lights3 = loadImage("lights3.png");
lights4 = loadImage("lights4.png");
lights5 = loadImage("lights5.png");
lights6 = loadImage("lights6.png");
lights7 = loadImage("lights7.png");
lights8 = loadImage("lights8.png");
lights9 = loadImage("lights9.png");
lights10 = loadImage("lights10.png");
lights11 = loadImage("lights11.png");
lights12 = loadImage("lights12.png");
lights13 = loadImage("lights13.png");
citylights = loadImage("citylights.png");
darkness = loadImage("darkness.png");
boat = loadImage("boat.png");
daytime = loadImage("daytime.png");
}

void draw() 
{
  
// LIGHT CHANGE//
    if ((mouseX > 0) && (mouseX<50)) {
    image(lights1, 0,0);
    }    
    else if ((mouseX > 50) && (mouseX < 100)) {
      image(lights2, 0,0);
    }
          else if ((mouseX > 100) && (mouseX < 175) && (mouseY > 20) && (mouseY < 280)) {
      image(lights3, 0,0);
    }
        else if ((mouseX > 175) && (mouseX < 210) && (mouseY > 20) && (mouseY < 280)) {
      image(lights4, 0,0);
    }
        else if ((mouseX > 210) && (mouseX < 260) && (mouseY > 20) && (mouseY < 280)) {
      image(lights5, 0,0);
    }
        else if ((mouseX > 260) && (mouseX < 350) && (mouseY > 20) && (mouseY < 280)) {
      image(lights6, 0,0);
    }
        else if ((mouseX > 350) && (mouseX < 440) && (mouseY > 20) && (mouseY < 280)) {
      image(lights7, 0,0);
    }
        else if ((mouseX > 440) && (mouseX < 525) && (mouseY > 20) && (mouseY < 280)) {
      image(lights8, 0,0);
    }
        else if ((mouseX > 525) && (mouseX < 600) && (mouseY > 20) && (mouseY < 280)) {
      image(lights9, 0,0);
    }
        else if ((mouseX > 600) && (mouseX < 690) && (mouseY > 20) && (mouseY < 280)) {
      image(lights10, 0,0);
    }
        else if ((mouseX > 690) && (mouseX < 750) && (mouseY > 20) && (mouseY < 280)) {
      image(lights11, 0,0);
    }
        else if ((mouseX > 750) && (mouseX < 825) && (mouseY > 20) && (mouseY < 280)) {
      image(lights12, 0,0);
    }
        else if ((mouseX > 825) && (mouseX < 900) && (mouseY > 20) && (mouseY < 280)) {
      image(lights13, 0,0);
    }  
    
//--------- LIGHTS CHANGE-------------//  

      else if ((mouseY > 0) && (mouseY <70)) {
        image(citylights,0,0);
      }     
      else if ((mouseY > 230) && (mouseY <300)) {
        image(darkness,0,0);
      }      



//------- NIGHT BLIMP --------//

int x = mouseX; 
int y = mouseY; 
 
//body
fill(0);
ellipse(x, y, +90,40);
rect(x-20, y, 40, 30);
fill(255);
rect(x+6, y+14, 8,8);
rect(x-3, y+14, 8,8);
rect(x-12, y+14, 8,8);
//tail
fill(0);
triangle( x-50, y-20, x-50,y+20, x-20,y);
  
if (mousePressed) {
  if (mouseButton == LEFT) {
      stroke(0);
      fill(255, 247, 0);
      ellipse(x+50, y+3, 10,10);
  } 
  
  
//--------- DAY BLIMP----------//  

  else if (mousePressed) {
    if (mouseButton == RIGHT) {
    image(daytime,0,0); }            // daytime city

// daytime blimp  

fill(43, 190, 199);
ellipse(x, y, +90,40);
rect(x-20, y, 40, 30);
fill(255);
rect(x+6, y+14, 8,8);
rect(x-3, y+14, 8,8);
rect(x-12, y+14, 8,8);
//tail
fill(43, 190, 199);
triangle( x-50, y-20, x-50,y+20, x-20,y);
  }
}
}

