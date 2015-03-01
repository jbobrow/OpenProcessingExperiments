
// Landscape through the seasons
// A program using Processing 2

// An interactive drawing program to create a user controlled sketch.
// Using the keyboard and mouse, different shapes and colors can be 
// formed. You are free to draw as much or as little as you want.
/* key and mouse interactions
   key presses:
    numbers 1 - 9, 0    will change the color 
    symbols ! @ # $ % ^ & *  will change the color
    q Q, w W, e E will change the color number #xx xx xx lower case 
    decreases, upper case increases RGB
                                                qQ wW eE
    
m erases the drawing and redraws the original scene
    pressing p will randomly change the dawing color - holding the p down
    will continuously change the color
    pressing i will pause or restart the animation
    
    drawing stylus shapes
        c == circle
        x == triangle
        z == square
        
        t = increases transparency holding t or T will continuously 
            increase or decrease transparency 
        T = decreases transparency
        r = sets transparency to random
        k == decreases the shape width size - holding k or l down will continuously decrease stylus size 
        l == decreases the shape height size
        K == increases the shape width size - holding K or L down will continuously increase stylus size
        L == increases the shape height size
        
        //save picture
        S will save the drawing s pict-#####.png where ##### is a system 
          number to the default folder
        X will stop the program (no more interactions), but the pictue 
          will persist.
        
    mouse button press and dragging will draw on the screen
    releasing the mouse button will allow re positioning of the mouse
               
*/


//Define Color Palette
//color[] palette = {#1188FF, #FFFF66, #44AA44, #AA4444, #F08102, #2233AA};
//color[] palette1 = {#FF0000, #00FF00, #0000FF, #FFAA00, #00AAFF, #4488AA, #FFFFFF};
color[] palette = {#FFFFFF, #FFFF66, #44AA44, #AA4444, #F08102, #2233AA};
color[] palette2 = {#FF0000, #00FF00, #223344, #BBAA88, #123456, #561234, #345612, #765432, #543276, #A98765 }; 
color[] palette1 = {#0000FF, #FFAA00, #00AAFF, #4488AA, #FFFFFF, #FFFF66, #44AA44, #AA4444, #F08102, #2233AA };
color[] palette0 = {#FFFFFF, #FF0000, #00FF00, #0000FF, #FFFFFF, #000000, #888888, #FF00FF, #00FFFF, #FFFF00 };
color bckgrndclr = #662211;

static color RED       = #FF0000;       //red
static color GREEN     = #00FF00;       //green
static color BLUE      = #0000FF;       //blue
static color WHITE     = #FFFFFF;       //white
static color BLACK     = #000000;       //black
static color GREY      = #888888;       //gray
static color PURPLE    = #FF00FF;       //purple
static color LIGHTBLUE = #00FFFF;       //light blue
static color YELLOW    = #FFFF00;       //yellow
static color ORANGE    = #FF6600;       //orange
static color FLESH     = #D29A7A;       //flesh

color skyblue = #1188FF;
color waterblue = #0000BB;
color iceblue = #6666FF;
color darkblue = #000044;
color earthbrown = #662211;
color darkbrown = #441100;
color darkgreen = #004400;
color grassgreen = #00FF00;
color mountainpurple = #662277;
color white = palette[0];
color red = palette2[0];

float counter = 0;    //timing counter
boolean incrementCounter = true; //toggle counter on/off
boolean locked = false;
boolean keylocked = false;

char stylus = 'c'; //default stylus
float styluswidth = 6.;    //control stylus size
float stylusheight = 6.;
float sunSize = 80;  //initial sun size
float maxSize = 200;
int maxPalette = 3;
int paletteChoice = 0;
int randPalette = palette0[int(random(0, 9))];
int Back = 0;
int changeBackground = 0;
int transparency = 0;
int maxtrans = 240;
int mintrans = 0;

//ground cover coordinates - triangles
float x1 = 0;
float y1 = 220;
float x2 = 735;
float y2 = 400;
float h = 1;
float w = .5; 
int i = 0;
int j = 0;
float x,y;

static int LATEWINTER = 0;
static int SPRING = 1;
static int SUMMER = 2;
static int AUTUMN = 3;
static int LATEAUTUMN = 4;
static int WINTER = 5;
static int MIDWINTER = 6;


int Season = 0;
int spring = 1;
int summer = 2;
int autumn = 3;
int lateautumn = 4;
int winter = 5;
int midwinter = 6;
int latewinter = 0;

PImage boat_img;
PImage skier_img;
PImage hawk_img;
PImage children_img;


//Create setup code block
void setup(){
  
  boat_img = loadImage("boat.png");
  skier_img = loadImage("skier.png");
  hawk_img = loadImage("hawk.png");
  children_img = loadImage("children.png");  
  
 //maximum window size for this assignment
 size(1280, 720);
 //select the first color for the background and sky
 background(bckgrndclr);

 resetBackground(latewinter);
 loadHawk(); 
 //snow covered peaks
 //snowcapSmall();

  
}

//Create the draw code block
void draw(){

  if (incrementCounter) {
    counter++;
  }
  
  // change drawing color 
  if (keyPressed) {
    switch(key) {
      case 'i':
        if (incrementCounter) {
          textSize(8);
          fill(FLESH,255);
          text("pause",10,10);
          incrementCounter = false;
        }
        else {
          incrementCounter = true;
          drawSun();
        }
        break;  
      case '1':
        //stylus fill(#FF0000); red
        randPalette = palette0[1];
        break;
      case '2':
        //stylus fill(#00FF00); green
        randPalette = palette0[2];
        break;
      case '3':
        //stylus fill(#0000FF); blue
        randPalette = palette0[3];
        break;
      case '4':
        //stylus fill(#FFFFFF); white
        randPalette = palette0[4];
        break;
      case '5':
        //stylus fill(#000000); black
        randPalette = palette0[5];
        break;
      case '6':
        //stylus fill(#888888); gray
        randPalette = palette0[6];
        break;
      case '7':
        //stylus fill(#FF00FF); purple
        randPalette = palette0[7];
        break;  
      case '8':
        //stylus fill(#00FFFF); light blue
        randPalette = palette0[8];
        break;
      case '9':
        //stylus fill(#FFFF00); yellow
        randPalette = palette0[9];
        break;
      case '0':
        //stylus fill(#FF6600); orange
        randPalette = ORANGE;
        break;
      case '-': 
        //stylus fill(#D29A7A); flesh
        randPalette = FLESH;
        break;  
      
      // use shift key
      case '!':
        //color skyblue = #1188FF;
        randPalette = skyblue;
        break;
      case '@':
        //color waterblue = #0000BB;
        randPalette = waterblue;
        break;
       case '#':
        //color iceblue = #6666FF;
        randPalette = iceblue;
        break;  
      case '$':
        //color darkblue = #000044;
        randPalette = darkblue;
        break;
      case '%':
        //color earthbrown = #662211;
        randPalette = earthbrown;
        break;
      case '^':
        //color darkbrown = #441100;
        randPalette = darkbrown;
        break;
      case '&':  
        //color darkgreen = #004400;
        randPalette = darkgreen;
        break;
      case '*':
        //color grassgreen = #00FF00;
        randPalette = grassgreen;
        break;
      case '(':
        //color mountainpurple = #662277;
        randPalette = mountainpurple;
        break;  
      case ')':
        break;  

      
      // change brush color
      case 'q':
        randPalette = randPalette - #010000;
        break;
        
      case 'w':
        randPalette = randPalette - #000100;
        break;
        
      case 'e':
        randPalette = randPalette - #000001;
        break;
      
      case 'Q':
        randPalette = randPalette + #010000;
        break;
        
      case 'W':
        randPalette = randPalette + #000100;
        break;
        
      case 'E':
        randPalette = randPalette + #000001;
        break;
      
      case 't': // increase transparency (less fill)
        transparency -= 1;
        if (transparency < mintrans) {
          transparency = mintrans;
        }  
        break;
        
      case 'T': // more fill (less transparency)
        transparency += 1;
        if (transparency > maxtrans) {
          transparency = maxtrans;
        }  
        break;
      
      case 'r':
        transparency = int(random(0,240));
        break;
        
      //circle  
      case 'c':
        stylus = 'c';
        break;
      //triangle
      case 'x':
        stylus = 'x';
        break;
      //square
      case 'z':
        stylus = 'z';
        break;
      //decrease brush size  
      case 'k':
        styluswidth = styluswidth-1.;
        if (styluswidth <= 0) {
          styluswidth = 1.;
        }  
        break;
      //increase brush size  
      case 'K':
        styluswidth = styluswidth+1.;
        if (styluswidth >= maxSize) {
          styluswidth = maxSize;
        }  
        break;
      case 'l':
        stylusheight = stylusheight-1.;
        if (stylusheight <= 0) {
          stylusheight = 1.;
        }  
        break;
      
      case 'L':
        stylusheight = stylusheight+1.;
        if (stylusheight >= maxSize) {
          stylusheight = maxSize;
        }  
        break;
      case 'p':
        paletteChoice = paletteChoice + 1;
        if (paletteChoice >= maxPalette) {
          paletteChoice = 0;
        }
        switch (paletteChoice) {
          case 0:
            randPalette = palette0[int(random(0, 9))];
            break;
          case 1:
            randPalette = palette1[int(random(0, 9))];
            break;
          case 2:
            randPalette = palette2[int(random(0, 9))];
           break; 
          default:
          break;
        }  
        break;
        
      case 's':       // save
        //saveFrame(pict-###.png);
        //break;  
      case 'S':
        saveFrame("pict-#####.png");
        break;
        
      case 'X':      //terminate
        noLoop();
        break;  

      case 'm':
        resetBackground(latewinter);
        //reset counter
        counter = 0;
        incrementCounter = true;
        
        break;  
  
      default:
        break;

    }  
    
  }
  // modify the background
  if (changeBackground > 0) {
    background(Back);
    changeBackground = 0;
  }
  
  //Set stroke color to palette1 color
  stroke(randPalette);
  //Set stroke weight
  strokeWeight(1);
  //Set fill color from palette with transparency
  fill(randPalette, transparency);
  if (locked == true) {
     //set ellipse origin location x 
     float x = mouseX;
     //set ellipse origin location y     
     float y = mouseY;
          
     if (stylus == 'c') {
       //draw circles 
       ellipse(x, y, styluswidth, stylusheight);
     }
     if (stylus == 'x') {
       //draw triangles
       triangle(x, y, x+styluswidth, y+stylusheight, x-styluswidth, y+stylusheight);
     }  
     if (stylus == 'z') {
       //draw squares
       rect(x,y, styluswidth,stylusheight);
     }  
  }
  
  // Landscape Picture
  
  if (counter == 500) {
    resetBackground(spring);
    //Spring
    Season = SPRING;
    // growing grass
    stroke(#88FF88);
    strokeWeight(1);
    fill(#88FF88);
    drawGround(spring);
    loadBoat();
  }
  else if (counter == 1500) {
    //Summer
    Season = SUMMER;
    // growing grass
    stroke(#00FF00);
    strokeWeight(1);
    fill(#00FF00);    
    drawGround(summer);
    loadChildren();
  }
  else if (counter == 2500) {
    //Autumn
    Season = AUTUMN;
    // dying grass
    stroke(#007700);
    strokeWeight(1);
    fill(#007700);
    drawGround(autumn);
  }
  else if (counter == 3000) {
    Season = LATEAUTUMN;
    // dying leaves
    stroke(#007700);
    strokeWeight(1);
    fill(#007700);
    drawGround(LATEAUTUMN);    
  }  
  else if (counter == 3500) {
    //Winter
    Season = WINTER;
    // snow
    background(bckgrndclr);
    stroke(#FFFFFF); //white
    strokeWeight(1);
    fill(#FFFFFF, 185);  
    rect(0,220,1280,500);
    drawGround(winter);
  }
  else if (counter == 3900) {
    Season = MIDWINTER;
    // snow
    background(white);
    stroke(#FFFFFF); //white
    strokeWeight(1);
    fill(#FFFFFF, 200);  
    rect(0,220,1280,500);
    drawGround(midwinter);
    loadSkier();
  } 
  /* 
  else if (counter == 4200) {
    stroke(#FFFFFF); //white
    strokeWeight(1);
    fill(#FFFFFF, 200);  
    //rect(0,220,1280,500);
    drawGround(winter);
  }  
  else if (counter == 4300) {
    stroke(#FFFFFF); //white
    strokeWeight(1);
    fill(#FFFFFF, 100);  
    //rect(0,220,1280,500);
    drawGround(winter);
  }  
  */
  else if (counter >= 4500) {
    Season = LATEWINTER;
    background(bckgrndclr);
     
    resetBackground(latewinter);
    loadHawk();
    
    //snow covered peaks
    //snowcapBig();
    
    //reset counter
    counter = 0;
  }
  else {
    //redrawPicture();
  }  
  
}

void mousePressed() {
  locked = true;
}  

void mouseReleased() {
  locked = false;
}

void keyPressed() {
  keylocked = true;
}

void keyReleased() {
  keylocked = false;
}  

void resetBackground(int season) {
    //stroke(palette1[0]);
    strokeWeight(0);

    // brown ground
    fill(earthbrown,240);
    rect(0,220,1280,500);
    remnantSnow(season);
    
    // pond 
    drawPond(waterblue, 8250.);

    //blue sky
    fill(skyblue, 255.);
    rect(0,0,1280,220);

    //mountains
    drawPurpleMountains();
    drawClouds();
    
    if (season == latewinter || season == LATEAUTUMN) {
      snowcapBig();
    }
    
    //Sun
    drawSun();
    
    drawForest(season);

}

void drawPond(int pondBlue, float pondTrans) {
  // pond 
  stroke(pondBlue);
  strokeWeight(0);
  fill(pondBlue, pondTrans);
  ellipse(250, 350, 600, 240);
  ellipse(350, 550, 800, 300);  
}

void loadBoat() {
   image(boat_img, 250,300); 
}  

void loadSkier() {
   image(skier_img, 950,450); 
}

void loadHawk() {
   image(hawk_img, 741,353); 
}

void loadChildren() {
  image(children_img, 750, 618);
}
void drawPurpleMountains() {
  //mountains
  stroke(mountainpurple);
  fill(mountainpurple,700);
  drawMountains();
}

void drawMountains() {
  //draw mountains no color  
  triangle(50,170, 0,220, 100,220);
  triangle(150,160, 100,220, 250,220);
  triangle(230,70, 150,220, 360,220);
  triangle(450,100, 400,220, 500,220);
  triangle(530,40, 450,220, 600,220);
  triangle(650,180, 600,220, 700,220);
  triangle(750,150, 700,220, 850,220);
  triangle(900,80, 850,220, 960,220);
  triangle(950,110, 900,220, 1000,220);
  triangle(1030,50, 950,220, 1100,220);
}  

void drawClouds() {
  
  noStroke();
  fill(white,255); 
  
  if (Season == SPRING || Season == AUTUMN || Season == MIDWINTER) {
    ellipse(70, 70, 50, 35);
    ellipse(85, 60, 40, 30);
    ellipse(95, 70, 40, 35);
    ellipse(110, 70, 40, 35);
    
    ellipse(700, 45, 90, 50);
    ellipse(710, 40, 60, 50);
    ellipse(720, 45, 70, 50);
  
    ellipse(1150, 40, 90, 50);
    ellipse(1160, 30, 70, 50);
    ellipse(1170, 40, 90, 50);
  }
  else {
    ellipse(310, 60, 80, 40);
    ellipse(330, 50, 80, 40);
    ellipse(350, 60, 80, 40);
    
   
    ellipse(950, 40, 60, 30);
    ellipse(960, 30, 60, 30);
    ellipse(980, 40, 60, 30);
  }
  
}  


void snowcapBig() {
  stroke(#FFFFFF);
  fill(#FFFFFF,700);            
  triangle(230,70, 204,120, 272,120);
  triangle(204,120, 214,120, 208,123);
  triangle(214,120, 234,120, 225,125);
  triangle(234,120, 244,120, 239,127);
  triangle(244,120, 272,120, 259,126);  
  
  triangle(450,100, 441,120, 459,120);
  triangle(441,120, 451,120, 445,122);
  triangle(451,120, 459,120, 455,121);
    
  triangle(530,40, 494,120, 561,120);
  triangle(494,120, 514,120, 508,124);
  triangle(514,120, 534,120, 525,123);
  triangle(534,120, 544,120, 539,126);
  triangle(544,120, 561,120, 552,122);  
  
  triangle(900,80, 886,120, 917,120);
  triangle(886,120, 896,120, 891,122);
  triangle(896,120, 910,120, 907,125);
  triangle(910,120, 917,120, 913,123);
  
  triangle(950,110, 945,120, 955,120);
  triangle(945,120, 950,120, 948,122);
  triangle(950,120, 955,120, 952,124);
  
  triangle(1030,50, 998,120, 1060,120);  
  triangle(998,120, 1008,120, 1004,124);  
  triangle(1008,120, 1028,120, 1018,123);  
  triangle(1028,120, 1048,120, 1036,125);  
  triangle(1048,120, 1060,120, 1055,127);  
}

void snowcapSmall() {
  //snow covered peaks
  stroke(#FFFFFF);
  fill(#FFFFFF,700);            
  triangle(230,70, 219,90, 248,90);
  triangle(219,90, 229,90, 223,91);
  triangle(230,90, 248,90, 248,93);
  
  triangle(530,40, 508,90, 549,90);
  triangle(508,90, 518,90, 514,91);
  triangle(518,90, 532,90, 524,93);
  triangle(532,90, 549,90, 539,92);
  
  triangle(900,80, 897,90, 904,90);
  triangle(897,90, 904,90, 901,92);
  
  triangle(1030,50, 1011,90, 1047,90);    
  triangle(1011,90, 1028,90, 1017,92);    
  triangle(1028,90, 1047,90, 1037,93);    
}  

void drawSun() {
  // sun
  stroke(palette[1],int(random(0, 150)));
  strokeWeight(0);
  fill(palette[1]);
  sunSize = 80;
  ellipse(0, 0, sunSize, sunSize);  
}  

void drawGround(int season) {
  for (i = 0; i < 427; i += 1) {  
    for (j = 0; j < 167; j += 1) {
      x = x1+float(i)*3;
      y = y1+float(j)*3;
      triangle(x,y, x-w,y+h, x,y+h);
    }
  } 
  
  redrawPicture(season);
}
  

void redrawPicture(int season) {  
    
    // pond 
    drawPond(waterblue, 8250.);
    
    //blue sky
    fill(skyblue, 255.);
    rect(0,0,1280,220);
    
    if (counter < 3500) {
      stroke(mountainpurple);
      fill(mountainpurple,700);
    }
    else if (counter >= 3500) {
      
      //ice pond
      drawPond(iceblue, 640.);     
      //blue sky
      fill(skyblue, 255.);
      rect(0,0,1280,220);     
      //snow
      stroke(#FFFFFF);
      fill(#FFFFFF,250);      
    }
    
    drawMountains();
    drawClouds();
    
    //snow covered peaks
    if (season == spring || season == autumn) {
      snowcapSmall();
    }  
    else if (season == latewinter || season == LATEAUTUMN) {
      snowcapBig();
    }
    
    // sun
    drawSun();
    
    drawForest(season);
}

void remnantSnow(int season) {
    if (season == latewinter) {
      noStroke();
      fill(white, 300);
      ellipse(800, 340, 300, 100);
      ellipse(900, 440, 350, 150);
      ellipse(950, 540, 380, 100);
      ellipse(1060, 320, 400, 100);
      ellipse(1150, 640, 280, 50);
    }
    else {
      background(bckgrndclr);
    } 
}  

void clearSnow() {
}  

void drawForest(int season) {
  drawTree(850,360,25,320, season);
  
  drawPinetree(650, 250, 13,18);
  drawPinetree(1100.,400.,45.,80.);
  drawPinetree(1150, 280, 15,20);
  drawPinetree(1200.,330.,35.,55.);
  
}

void drawPinetree(float px,float py,float pw,float ph) {
  
  float py1 = py+ph/2;
  float py2 = py+ph;
  float pw1 = pw + pw/3; 
  float pw2 = pw + pw/2;
  
  strokeWeight(0);
  fill(darkgreen, 400);
  
  triangle(px,py2,px-pw2,py2+ph, px+pw2, py2+ph);  
  triangle(px,py1,px-pw1,py1+ph, px+pw1, py1+ph);
  triangle(px,py,px-pw,py+ph, px+pw, py+ph);
  
  //trunk
  fill(darkbrown, 340);  
  rect(px,py2+ph, pw/6, ph/4);
}  

void drawTree(float px,float py,float pw,float ph, int season) {
  //trunk
  fill(darkbrown, 340);  
  rect(px,py, pw, ph);    
  //branches
  quad(px,py+ph/2.5, px,py+ph/2.5+pw/1.5, px-ph/2.5,py+ph/18, px-ph/2.5+pw/2.,py+ph/18);
  quad(px+pw,py+ph/2, px+pw,py+ph/2+pw/1.5, px+ph/2,py, px+ph/2.-pw/2.,py);
  
  quad(px-ph/4,py+ph/6, px-ph/4+pw/3,py+ph/6+pw/3, px-ph/8+pw/3.,py-ph/18, px-ph/8.,py-ph/18);
  quad(px+ph/2.7,py+ph/8+pw/4, px+ph/2.7,py+ph/8, px+ph/8+pw/4.,py-ph/18, px+ph/8.,py-ph/18);
  //quad(px+pw,py+ph/2, px+pw,py+ph/2+pw/1.5, px+ph/2,py, px+ph/2.-pw/2.,py);
  // draw leaves

  float w = 0;
  float h = 0;
  //float r = 0;
  float theta = 0;
  float px1 = 0;
  float py1 = 0;
  float px2 = 0;
  float py2 = 0;
  
  px1 = px+pw/2;
  py1 = py+ph/6;
  noStroke();

  if (season == spring) {
    fill(grassgreen,70);
    
    for (i=0; i<30;i+=1) {
      for (j=0; j<50; j+=1) {
        theta = (2*PI/50)*j;
        w = random(0, ph/2);
        h = random(60, ph/2);
        
        ellipse(px1+sin(theta)*w, py1+cos(theta)*h, ph/32, ph/32);
        
      }    
    }
  }  
  else if (season == summer) {
    fill(darkgreen,70);
    for (i=0; i<30;i+=1) {
      for (j=0; j<50; j+=1) {
        theta = (2*PI/50)*j;
        w = random(0, ph/2);
        h = random(60, ph/2);
        
        ellipse(px1+sin(theta)*w, py1+cos(theta)*h, ph/32, ph/32);
 
      }  
    }
  }
  else if (season == autumn) {
    fill(red,300);
    for (i=0; i<5;i+=1) {
      for (j=0; j<10; j+=1) {
        theta = (2*PI/10)*j;
        //r = random(100, 160);      
        w = random(0, ph/2);
        h = random(60, ph/2);
        
        //ellipse(px1+sin(theta)*r, py1+cos(theta)*r, ph/32, ph/32);
        ellipse(px1+sin(theta)*w, py1+cos(theta)*h, ph/32, ph/32);
 
      }  
    }
  }
  else if (season == LATEAUTUMN) {
    fill(red,300);
    for (i=0; i<5;i+=1) {
      for (j=0; j<50; j+=1) {
        theta = (2*PI/50)*j;
        //r = random(100, 160);      
        w = random(0, ph/2);
        h = random(60, ph/2);
        px2 = px1+sin(theta)*w;
        py2 = py1+cos(theta)*h;
        
        //ellipse(px1+sin(theta)*r, py1+cos(theta)*r, ph/32, ph/32);
        ellipse(px2, py2, ph/32, ph/32);
        //triangle(px2, py2, px2-ph/64,py2+ph/32, px2+ph/64,py2+ph/32); 
        //triangle(px2, py2, px2-ph/64,py2-ph/32, px2+ph/64,py2-ph/32); 
        
 
      }  
    }
    fill(ORANGE,300);
    for (i=0; i<5;i+=1) {
      for (j=0; j<50; j+=1) {
        theta = (2*PI/50)*j;
        //r = random(100, 160);      
        w = random(0, ph/2);
        h = random(60, ph/2);
        px2 = px1+sin(theta)*w;
        py2 = py1+cos(theta)*h;
        
        //ellipse(px1+sin(theta)*r, py1+cos(theta)*r, ph/32, ph/32);
        ellipse(px2, py2, ph/32, ph/32);
        //triangle(px2, py2, px2-ph/64,py2+ph/32, px2+ph/64,py2+ph/32); 
        //triangle(px2, py2, px2-ph/64,py2-ph/32, px2+ph/64,py2-ph/32); 
 
      }  
    }
    fill(YELLOW,300);
    for (i=0; i<5;i+=1) {
      for (j=0; j<50; j+=1) {
        theta = (2*PI/50)*j;
        //r = random(100, 160);      
        w = random(0, ph/2);
        h = random(60, ph/2);
        px2 = px1+sin(theta)*w;
        py2 = py1+cos(theta)*h;
        
        //ellipse(px1+sin(theta)*r, py1+cos(theta)*r, ph/32, ph/32);
        ellipse(px2, py2, ph/32, ph/32);
        //triangle(px2, py2, px2-ph/64,py2+ph/32, px2+ph/64,py2+ph/32); 
        //triangle(px2, py2, px2-ph/64,py2-ph/32, px2+ph/64,py2-ph/32); 
      }  
    }
    fill(#883311,200);
    for (i=0; i<5;i+=1) {
      for (j=0; j<50; j+=1) {
        theta = (2*PI/50)*j;
        //r = random(100, 160);      
        w = random(0, ph/2);
        h = random(60, ph/2);
        px2 = px1+sin(theta)*w;
        py2 = py1+cos(theta)*h;
        
        //ellipse(px1+sin(theta)*r, py1+cos(theta)*r, ph/32, ph/32);
        ellipse(px2, py2, ph/32, ph/32);
        //triangle(px2, py2, px2-ph/64,py2+ph/32, px2+ph/64,py2+ph/32); 
        //triangle(px2, py2, px2-ph/64,py2-ph/32, px2+ph/64,py2-ph/32); 
      }  
    }
    fill(earthbrown,200);
    for (i=0; i<5;i+=1) {
      for (j=0; j<50; j+=1) {
        theta = (2*PI/50)*j;
        //r = random(100, 160);      
        w = random(0, ph/2);
        h = random(60, ph/2);
        px2 = px1+sin(theta)*w;
        py2 = py1+cos(theta)*h;
        
        //ellipse(px1+sin(theta)*r, py1+cos(theta)*r, ph/32, ph/32);
        ellipse(px2, py2, ph/32, ph/32);
        //triangle(px2, py2, px2-ph/64,py2+ph/32, px2+ph/64,py2+ph/32); 
        //triangle(px2, py2, px2-ph/64,py2-ph/32, px2+ph/64,py2-ph/32); 
      }  
    }
  }  
  else if (season == winter) {
    fill(earthbrown,200);
    for (i=0; i<5;i+=1) {
      for (j=0; j<50; j+=1) {
        theta = (2*PI/50)*j;
        //r = random(100, 160);      
        w = random(0, ph/2);
        h = random(60, ph/2);
        px2 = px1+sin(theta)*w;
        py2 = py1+cos(theta)*h;
        
        //ellipse(px1+sin(theta)*r, py1+cos(theta)*r, ph/32, ph/32);
        ellipse(px2, py2, ph/32, ph/32);
        //triangle(px2, py2, px2-ph/64,py2+ph/32, px2+ph/64,py2+ph/32); 
        //triangle(px2, py2, px2-ph/64,py2-ph/32, px2+ph/64,py2-ph/32); 
      }  
    }  
  }  
  else if (season == midwinter) {
    
  }  
}  

void drawBirds() {

  //draw wings
  
  
}  

