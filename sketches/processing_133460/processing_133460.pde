
//ART 3001
// HW #4 While/For Loops
// "RGB Weather"
// some code adapted from Reas & Fry's Processing: A Programming Handbook for Visual Designers and Artists
// Patrick j O'Donnel


void setup() {
  size(400,150);
  frameRate(1);
}

//Variable for power of background
float power = 4;

//RAIN function
void Rain(float j, float k, float f1, float f2, float f3, float step){   
        while (j<=width) {
           float r = random(0.1,width/10);
           strokeWeight(height/50);
           stroke(f1,f2,f3);
           line(j,k,j+r,k);
           j+=r;
           k+=step;
        }
}

void draw() {
  noStroke();
  
  //Noisy background
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
           float total = 0.0;
        for (float i =random(-20,20); i >= 1; i = i/2.0) {
           total += noise(x/200, y/200)*200;
        }
            //fine tuning, so it registers on offset variable
           float turbulence = 128.0 * total / 200;
           
           //controls band shape 
           float base = (x/5) + (y/60);
           
           //controls band frequency
           float offset = base + (turbulence / 256.0);
           
           //controls color frequency
           float gray = abs(sin(offset)) * 256.0;
           
         stroke(gray);
         point(x, y);   
      } 
    } 
noLoop();    

//RGB RAIN
       Rain(0,random(height/2,height/2),0,0,0,random(-.5,.5)); 
       Rain(0,random(height/3,2*height/3),255,0,0,random(-1.5,1.5)); 
       Rain(0,random(height/4,3*height/4),0,255,0,random(-3,3)); 
       Rain(0,random(height/5,4*height/5),0,0,255,random(-6,6)); 
       Rain(0,random(height/6,5*height/6),255,255,255,random(-10,10)); 
}

