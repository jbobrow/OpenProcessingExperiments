
/*an expressionistic simulation of the 
 planets and the galaxy changing over time
 if time was nuts*/
int sec= second(); //size of planets change with days
LiveNebula espilon = new LiveNebula();
SunAndStars planets = new SunAndStars();
PImage[] universes = new PImage[5];
PImage nebula; 
PImage one = loadImage("carina2Nebula.jpg"); PImage two = loadImage("carinaNebula.jpg"); PImage three = loadImage("foxFurNebula.jpg"); 
PImage four = loadImage("rosetteNebula.jpg"); PImage five = loadImage("horseshoeNebula.jpg");
PFont f;

void setup() {
  background(random(256), random(256), random(256), random(0, 100));
  //nebula= loadImage("horseshoeNebula.jpg"); //fantastic new nebula background
  size(400, 400); //darn these constraints
}
//window made!

void mousePressed() {
  int sec= second(); //size of planets change with days

  background(random(256), random(256), random(256), random(0, 100));

  universes[0]=one;
  universes[2]=three;
  universes[1]=two;
  universes[3]=four;
  universes[4]=five;
  nebula = universes[int(random(1, 5))];

  tint(255, 127);  // Display at half opacity
  image(nebula, 0, 0); 
  planets.grow(); 
  espilon.breadth(sec);


  tint(255, 60);  // Display at less than half opacity
  image(nebula, 0, 0);

  smooth();
  f = createFont("SimSun", 48, true);
  textFont(f, 48);
  text(second(), 185, 210);
}
void draw(){
image(nebula,pmouseX/-10 - 50,pmouseY/-10 - 50);
}
//planets now move and grow

/*this class creates the transparent circles in the foreground*/
class LiveNebula {
  LiveNebula() {}//Constructor

  void breadth(int sizeX) {  
    fill (47, 255, 209, 200);
    noStroke();
    ellipse(198, 177, sizeX, sizeX);

    fill (73, 255, 215, 200);
    ellipse(212, 191, sizeX+35, sizeX+35);

    fill (31, 145, 20, 200);
    ellipse(245, 202, sizeX+50, sizeX+50);

    fill (89, 214, 73, 200);
    ellipse(282, 209, sizeX+80, sizeX+80);

    fill (3, 21, 40, 200);
    ellipse(355, 177, sizeX+150, sizeX+150);

    fill (58, 255, 212, 200);
    ellipse(168, 184, sizeX, sizeX);

    fill (73, 255, 215, 200);
    noStroke();
    ellipse(157, 194, sizeX+30, sizeX+30);

    fill (80, 60, 255, 200);
    ellipse(146, 213, sizeX+45, sizeX+45);

    fill (80, 60, 255, 200);
    ellipse(146, 213, sizeX+45, sizeX+45);

    fill (129, 117, 255, 200);
    ellipse(142, 250, sizeX+80, sizeX+80);

    fill (206, 3, 123, 200);
    ellipse(165, 325, sizeX+150, sizeX+150);

    fill (191, 1, 138, 200);
    ellipse(284, 419, sizeX+300, sizeX+300);

    fill (20, 0, 94, 200);
    ellipse(419, 68, sizeX+300, sizeX+300);

    fill (24, 255, 204, 200);
    ellipse(163, 162, sizeX, sizeX);

    fill (64, 30, 20, 200);
    ellipse(150, 152, sizeX+35, sizeX+35);

    fill (90, 28, 12, 200);
    ellipse(128, 146, sizeX+50, sizeX+50);

    fill (128, 43, 12, 200);
    ellipse(102, 139, sizeX+70, sizeX+70);

    fill (229, 53, 2, 200);
    ellipse(58, 135, sizeX+100, sizeX+100);

    fill (230, 51, 0, 200);
    ellipse(11, 150, sizeX+150, sizeX+150);

    fill (20, 255, 203, 200);
    ellipse(188, 153, sizeX, sizeX);

    fill (21, 255, 204, 200);
    ellipse(198, 139, sizeX+35, sizeX+35);

    fill (49, 255, 210, 200);
    ellipse(197, 120, sizeX+50, sizeX+50);

    fill (3, 87, 163, 200);
    ellipse(191, 77, sizeX+80, sizeX+80);

    fill (1, 89, 184, 200);
    ellipse(125, -38, sizeX+250, sizeX+250);
  }
}

class SunAndStars{ //creates distant background planets
  SunAndStars(){} //constructor
      
      void grow(){
        fill (112,96,255,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (134,121,255,60);
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (152,2,202,60);
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (183,19,255,60);
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (206,0,122,60);
        noStroke();
        ellipse(random(-50,400),random(-50,400),250,250);
        
        fill (20,131,73,60);
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (42,142,90,60);
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (3,124,176,60);
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (3,120,180,60);
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (80,100,255,60);
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (1,88,184,60);
        ellipse(random(-50,400),random(-50,400),300,300);
        
        fill (183,19,255,60);
        ellipse(random(-50,400),random(-50,400),300,300);
      }
  }

