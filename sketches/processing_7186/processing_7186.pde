


float easing1 = 0.3; //easing1
float easing2 = 0.4; //easing2
float x, y; 
float x2, y2;
int blink = 10; //blinking
int blinkCount = 0;
boolean doBlink = false;
int timer = 0;


void setup()  {
  size(640, 480);
  smooth();
cursor(CROSS);
  }
  
  
  void mouseMoved(){
   timer = 0; 
  }
  
  void draw() {
    
  

   timer += 1; //timer for blinking start after stopped for a bit
   println(timer);
    
   background(0); 
   
   
   //easing1 for eyeballs
   float targetX = mouseX; //easing
   float targetY =mouseY;
   x = x + (targetX - x) * easing1;
   y = y + (targetY - y) * easing1;
   
   //easing2 for irises and pupils
   float targetX2 = mouseX; //easing
   float targetY2 =mouseY;
   x2 = x + (targetX - x) * easing2;
   y2 = y + (targetY - y) * easing2;
   
 
 //blinking setup
  if(frameCount % blink== 0) {
   doBlink = true;
   blink = int(random(90, 160)); //blinking frequency
 }
 
 if(timer < 30) { 
   doBlink = false;
 }

 if(doBlink == false) {
 
 //all eyes:
    //+random(-1, 1) = shaking
   
 //normal
   if(y< 250) {
     
   fill(255, 255, 255); //right white
   noStroke();
   ellipse(x+19, mouseY-80, 40, 60);
   
    fill(24, 79, 240, 175); //right blue
   ellipse(x2+19, mouseY-62, 25,25);
   
    fill( 0);
   ellipse(x2+18, mouseY-56, 15,15); //right black
  
   fill(255, 255, 255); //left white
    noStroke();
   ellipse(x-19, mouseY-80, 40, 60);
   
    fill(24, 79, 240, 175); //left blue
   ellipse(x2-19, mouseY-62, 25,25);
   
    fill( 0);      
   ellipse(x2-18, mouseY-56, 15,15); //left black
   
   fill(255, 255, 255);
   ellipse(x2-25, mouseY-63, 4,4); //left light source reflection
   
    fill(255, 255, 255);
   ellipse(x2+12, mouseY-63, 4,4); //right light source reflection
   
  } 

//angry
   if (y > 400) {
   
   fill(255, 255, 255); //right white
   noStroke();
   ellipse(x+19, mouseY-30, 40, 60);
   
  
   fill(255, 255, 255); //left white
    noStroke();
   ellipse(x-19, mouseY-30, 40, 60);
   
    fill(234, 7, 22); //left blue
   ellipse(x2-14, mouseY-15, 25,25);
   
    fill(234, 7, 22); //right blue
   ellipse(x2+14, mouseY-15, 25,25);
   
    fill( 0);      
   ellipse(x2-10, mouseY-12, 15,15); //left black
   
    fill( 0);
   ellipse(x2+10, mouseY-12, 15,15); //right black
   
    {
    fill(0); //angry eyes
    ellipse(x, mouseY-50, 60, 70);
    
     fill(255, 255, 255);
   ellipse(x2-18, mouseY-16, 4,4); //left light source reflection
   
    fill(255, 255, 255);
   ellipse(x2+18, mouseY-16, 4,4); //right light source reflection
  }

  } 
  
//worried
  if ((y > 250) && (y< 400)) { 
    fill(255, 255, 255); //right white
   noStroke();
   ellipse(x+19+random(-1,1), mouseY-80+random(-1,1), 40, 60);
   
    fill(24, 79, 240, 175); //right blue
   ellipse(x2+19+random(-1,1), mouseY-62+random(-1,1), 25,25);
   
    fill( 0);
   ellipse(x2+18+random(-1,1), mouseY-56+random(-1,1), 15,15); //right black
  
   fill(255, 255, 255); //left white
    noStroke();
   ellipse(x-19+random(-1,1), mouseY-80+random(-1,1), 40, 60);
   
    fill(24, 79, 240, 175); //left blue
   ellipse(x2-19+random(-1,1), mouseY-62+random(-1,1), 25,25);
   
    fill( 0);      
   ellipse(x2-18+random(-1,1), mouseY-56+random(-1,1), 15,15); //right black
   
   fill(0); //right black for worried
   ellipse(x-40, mouseY-110, 70, 80);
   
    fill(0); //left black for worried
   ellipse(x+40, mouseY-110, 70, 80);
   
    fill(255, 255, 255);
   ellipse(x2-25, mouseY-63, 4,4); //left light source reflection
   
    fill(255, 255, 255);
   ellipse(x2+11, mouseY-63, 4,4); //right light source reflection
   
    } 
 }
 //blink length
 if(blinkCount > 20) {
 doBlink = false;
 blinkCount = 0;
  }
  blinkCount++;
  }


