
Lantern lantern;


void setup() {
  size(1000, 700);
  lantern = new Lantern();
}
 
   
void draw() {
  lantern.burn();
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////



class Flame {                /////ONLY WORKS AT (500, 500)///////
//flame 
  //(flame size)(Anchor/Control)(axis)(first/second)(left/right)
  //constants
  float aX1; //bottom anchor
  float aY1;
  float aX2; //top anchor
  float cX2; //control point
  //linear variables
  float cY1; //first control y
  float Y2; //second y
  float cX1R; //first x control left
  float cX1L; //first x conrol right
  //color
  float flamecolorG = 155;
  float flamecolorB = 0;
  float easingx;
  float windx;
  
  
  Flame() { //wind = 0-50, indicates the extent of deflection of flame//
    
   
  }
  
  float[] burn(float wind) {      //////returns flameVales[], consisting of bgL, Y2, and cX1R//////
   float backgroundLight;
   float[] flameValues = new float[3];
   ///////wind
   
   float easing = 0.1;
   float targetx = mouseX;
   easingx += (targetx - easingx) * easing;
   windx = mouseX - easingx;

       
   
   //flame
  //(flame size)(Anchor/Control)(axis)(first/second)(left/right)
  //constants
   wind = map(windx, -1000, 1000, -50, 50);
   aX1 = 500; //bottom anchor
   aY1 = 500;
   aX2 = 500 + wind; //top anchor
   cX2 = 500 + 4*wind; //control point
   //linear variables
   cY1 = aY1 + 50; //first control y
   Y2 = random(aY1 - 225, aY1 - 175); //second y
   cX1R = random(aX1 + 225, aX1 + 375); //first x control left
   cX1L = (aX1 - 300) + (cX1R - (aX1 + 300)); //first x conrol right
   //color
   flamecolorG = 155;
   flamecolorB = 0;
   backgroundLight = (Y2 + cX1R - 460)/40;
   noStroke();
   //background(backgroundLight);
   while(cY1 > 500) {
     fill(255, flamecolorG, flamecolorB, 150);
     curve(cX1L , cY1, aX1, aY1, aX2, Y2, cX2, Y2);
     curve(cX1R, cY1, aX1, aY1, aX2, Y2, cX2, Y2);
     cY1 = cY1 - 15;
     Y2 = Y2 + 33;
     cX1R = cX1R - 66;
     cX1L = cX1L + 66;
     flamecolorB = flamecolorB + 33;
     flamecolorG = flamecolorG + 33; 
        
   }
   flameValues[0] = wind;
   flameValues[1] = Y2;
   flameValues[2] = cX1R;
   return flameValues;
  }
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



class Lantern {
Flame flame;
float lightLevel;
float flameHeight;
float flameWidth;
float[] flameValue = new float[3];
int i;
int ErX;
int ErY;
float Wind;
float O;


  Lantern() {
  flame = new Flame();
  }
 
   
  void burn() {
  
   if(Wind < 33 && Wind > -33){ //lantern is lit
    O = 75;
    frameRate(random(15, 25));
    background(lightLevel);
   //horizon
    fill(5, 5, 10);
      quad(0, 0, 1000, 0, 1000, 390, 0, 540);
      //sky
      fill(10, 0, 0);
      rect(0, 0, 700, 400);
            //window
      fill(lightLevel);
      rect(700, 0, 300, 700);

   //latern
    ellipseMode(RADIUS);
   //aura
    fill(lightLevel*6, lightLevel*5, lightLevel*3, 2);
    ErX = 200;
    ErY = 40;
     for(i = 0; i < 20; i = i + 1) {
      fill(lightLevel*6, lightLevel*5, lightLevel*3, 2);
      ellipse(500, 565, ErX, ErY);
      ErX = ErX + 5;
      ErY = ErY + 1;
     }
  //shadow
   fill(0);
   ellipse(500 - Wind, 565, flameHeight/2 - 55, flameHeight/10 - 11);
  //knob
    //spoke
    stroke(lightLevel*4, lightLevel*3, lightLevel*2);
    strokeWeight(7);
    line(603, 470, 603, 530);
    //spoke shadow
    stroke(lightLevel*2, lightLevel, lightLevel/2);
    strokeWeight(3);
    line(605, 470, 605, 530);
    //axis
    stroke(lightLevel*4, lightLevel*3, lightLevel*2);
    strokeWeight(10);
    line(500, 530, 603, 497);
    //axis shadow
    stroke(lightLevel*2, lightLevel, lightLevel/2);
    strokeWeight(4);
    line(502, 532, 605, 499);
  //stand
    stroke(lightLevel*2, lightLevel, lightLevel/2);
    strokeWeight(10);
    noFill();
    //left leg
    curve(350, 400, 425, 530, 400, 565, 300, 565);
    //right leg
    curve(650, 400, 575, 530, 600, 565, 700, 565);
    //middle leg
    //line(500, 530, 500, 555);
  //stand shadows
    stroke(lightLevel/1.5, lightLevel/1.5, lightLevel/5);
    strokeWeight(4);
    //left shadow
    curve(350, 400, 429, 530, 400, 569, 304, 565);
    //right shadow
    curve(650, 400, 571, 530, 600, 569, 696, 565);
    //middle shadow
    //strokeWeight(7);
    //line(500, 530, 500, 557);
  //bottom
    noStroke();
    fill(lightLevel/1.5, lightLevel/1.5, lightLevel/4);
    ellipse(500, 530, 125, 25);
  //egde
    fill(lightLevel*3, lightLevel*2, lightLevel);
    ellipse(500, 525, 130, 26);
  //facet 2
    fill(lightLevel*4, lightLevel*3, lightLevel);
    ellipse(500, 520, 125, 25);
  //facet 1
    fill(lightLevel*5, lightLevel*4, lightLevel);
    ellipse(500, 500, 50, 10);
  //hole
    fill(0);
    ellipse(500, 498, 15, 3);

  
  //flame
  float[] flameValue = flame.burn(Wind);
  Wind = flameValue[0];
  flameHeight = flameValue[1];
  lightLevel = flameValue[1]/30;
    } else { ///wind exceeds 30, lantern goes out
      Wind = 50;   //keeps lantern off
      //wick
      background(0);
      fill(180, 120, 10, O);
      ellipse(500, 498, 15, 3);
      fill(0);
      ellipse(500, 500, 10, 2);
      fill(225, 45, 10, O * 3);
      ellipse(500, 500, 2, 2);
      //horizon
      fill(30, 10, 30, 150 - O);
      quad(0, 0, 1000, 0, 1000, 390, 0, 540);
      //sky
      fill(0, 5, 40, 150 - O);
      rect(0, 0, 700, 400);
      //window
      fill(0);
      rect(700, 0, 300, 700);
   
      }
      if (O > 0) {
        O = O - 1;
      }
      if(mousePressed == true) { //re-lighting
       Wind = 0;
      } 
    }
  }
  

