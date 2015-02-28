
PFont bodoni;
PImage chi_HRIC;
String HRIC = "H R I C";
Walker w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27;
float d;
float t;

	

//import processing.video.*;

//MovieMaker walkingdots; 


void setup()
{ 
  size(500, 500);
  smooth();
  colorMode(HSB,360,100,100);
  bodoni = loadFont("BodoniXT-15.vlw");
  textFont(bodoni);
  textAlign(CENTER, CENTER);
 // walkingdots = new MovieMaker (this, 960, 540, "walkingdots.mov");
 
 chi_HRIC = loadImage("chi_HRIC_s.gif");
  imageMode (CENTER);
  
  
  
  
  
  w1 = new Walker(random(width), random(height), 17.4, 8.9, 26);
  w2 = new Walker(random(width), random(height), 29.3, -12, 16);
  w3 = new Walker(random(width), random(height), 35, 0.5, 10);
  w4 = new Walker(random(width), random(height), 34.9, 10.9, 8);
  w5 = new Walker(random(width), random(height), 31.4, 20, 6);
  w6 = new Walker(random(width), random(height), 24.7, 26.6, 6);
  w7 = new Walker(random(width), random(height), 14.5, 30.3, 12);
  w8 = new Walker(random(width), random(height), 3.1, 22.2, 10);
  w9 = new Walker(random(width), random(height), -1.7, 10.6, 10);
  w10 = new Walker(random(width), random(height), -3.8, -2.8, 14);
  w11 = new Walker(random(width), random(height), 6.9, -12, 12);
  w12 = new Walker(random(width), random(height), 18, -17.7, 8);
  w13 = new Walker(random(width), random(height), 18, -8.5, 6);
  w14 = new Walker(random(width), random(height), 22.4, -26.8, 10);
  w15 = new Walker(random(width), random(height), 6.8, -29.9, 20);
  w16 = new Walker(random(width), random(height), -9.4, -33.5, 12);
  w17 = new Walker(random(width), random(height), -21.7, -27.9, 10);
  w18 = new Walker(random(width), random(height), -9.4, -18.7, 16);
  w19 = new Walker(random(width), random(height), -28.7, -16.5, 14);
  w20 = new Walker(random(width), random(height), -18.5, -5.3, 12);
  w21 = new Walker(random(width), random(height), -33.4, -2.9, 12);
  w22 = new Walker(random(width), random(height), -17.6, 8.4, 14);
  w23 = new Walker(random(width), random(height), -33.3, 9.9, 10);
  w24 = new Walker(random(width), random(height), -9, 16, 6);
  w25 = new Walker(random(width), random(height), -26.6, 20.8, 12);
  w26 = new Walker(random(width), random(height), -11.7, 29.1, 18);
  w27 = new Walker(random(width), random(height), 3, 34.7, 10);
}

void draw()
{
  background(360);
  
  d = dist(width/2, height/2, mouseX, mouseY);
  
 

  w1.update();
  w1.display();
  w2.update();
  w2.display();
  w3.update();
  w3.display();
  w4.update();
  w4.display();
  w5.update();
  w5.display();
  w6.update();
  w6.display();
  w7.update();
  w7.display();
  w8.update();
  w8.display();
  w9.update();
  w9.display();
  w10.update();
  w10.display();
  w11.update();
  w11.display();
  w12.update();
  w12.display();
  w13.update();
  w13.display();
  w14.update();
  w14.display();
  w15.update();
  w15.display();
  w16.update();
  w16.display();
  w17.update();
  w17.display();
  w18.update();
  w18.display();
  w19.update();
  w19.display();
  w20.update();
  w20.display();
  w21.update();
  w21.display();
  w22.update();
  w22.display();
  w23.update();
  w23.display();
  w24.update();
  w24.display();
  w25.update();
  w25.display();
  w26.update();
  w26.display();
  w27.update();
  w27.display();
  
  
  t = map(d,30,60,255,0);
 
 image(chi_HRIC,width/2+5,height/2+70);

  
  fill(358,100,80);
  //text(HRIC, width/2+0.58, height/2+54.3);
  
 
  
  
 // walkingdots.addFrame();
}

void keyPressed()
{
  if (key == 'b' || key == 'B')
  {
   // walkingdots.finish();
  }
}

class Walker
{ 
  
  float x;
  float y;
  float ox;
  float oy;
  float w;

  float targetX;
  float targetY;
  float nx, ny;

  float ex, ey;

  Walker(float _x, float _y, float _ox, float _oy, float _w)
  {
    x = _x;
    y = _y;
    ox = _ox;
    oy = _oy;
    w = _w;
  }

  void update()
  { 
    fill(358, 100, 80);
    
    x += 0.005;
    y += 0.008;


    if (d<=width)
    {
      targetX = width/2+ox;
      targetY = height/2+oy;
      
      

      
        fill(358, 100,random(50,100));
        targetX = width/2+ox+random(-20,20);
        targetY = height/2+oy+random(-20,20);
        
      
      
    }
      else 
      { 
        fill(358, 100, 80);
        nx = noise(x) * width;
        ny = noise(y) *height;
        targetX = nx;
        targetY = ny;
       
        
          
      }

      ex += (targetX-ex) * 0.04;
      ey += (targetY-ey) * 0.04;
      
    
    }

    void display()
    { 
      noStroke();
      
      ellipse(ex, ey, w, w);
    }
  }


