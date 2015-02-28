
// Declare and contruct two objects (h1, h2) from the class ColCircle 
ColCircle h1 = new ColCircle(200,20, -0.005,50); 
ColCircle h2 = new ColCircle(150,50, 0.0051,100); 
ColCircle h3 = new ColCircle(100,50, 0.001,123); 

float col01;
float factor01 = random(1);
float factor02 = random(10);
float color_start = 0;
 
void setup() 
{
  size(400, 400);
  colorMode(HSB, 100); 
  // frameRate(30);
}

void draw() { 
  background(0);
  h1.update(); 
  h2.update();  
  h3.update();  
  h1.display();
  h2.display();
  h3.display();
} 
 
class ColCircle { 
  float rad, ypos, speed, anzahl; 
  ColCircle (float r, float y, float s, int a) {  
    rad = r;
    ypos = y; 
    speed = s; 
    anzahl = a;
  } 
  
  // update values
  void update() { 
    ypos += speed; 
    // if (ypos > height) { 
      // ypos = 0; 
    // } 
    // ellipse(200,ypos, rad, rad); 
  } 
  
  // display circle 
  void display() { 
    for (int i = 0; i < anzahl; i++) { 
       // 
       // circle points
       float xr=i*2*PI/anzahl;
       float xr1=(i+factor01)*2*PI/anzahl;
       float xb= 200+rad*cos(xr+ypos);
       float yb= 200+rad*sin(xr+ypos);
       float xc= 200+rad*cos(xr1+ypos);
       float yc= 200+rad*sin(xr1+ypos);
       
       // color
       col01 = (color_start+i*factor02)%anzahl;
       
       fill (col01,100,100);
       stroke (col01,100,100);
       // ellipse(xb,yb,5,5); 
       // line(200,200,xb,yb);
       triangle(200,200,xb,yb,xc,yc);
    }
  } 
}


void mousePressed() {
       /* save frame as png */
       // saveFrame("output-####.png");
       // background(192, 64, 0);
       // reset colorFac
      h1 = new ColCircle(200,0, random(-0.01,0.01),int(random(3,200))); 
      h2 = new ColCircle(150,0, random(-0.01,0.01),int(random(3,150))); 
      h3 = new ColCircle(100,0, random(-0.01,0.01),int(random(3,100))); 
      // reset some other values
      factor01 = random(1);
      factor02 = random(10);
      color_start = random(100);
       
     }

