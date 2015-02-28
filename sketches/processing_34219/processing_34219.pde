
//code: Jeremy Ryan Peterson
//thanks to Ben Fry for assistance

PImage instructions;

int redI=0;
int greenO=0;
int blueP=0;

int FR=30;
int opacity=50;
int n =5; 
int nDist=0;
float cx = 200; 
float cy = 200;
float r =100;
float r1=r*(cos(PI/n)-sin(PI/n)*tan((PI*(n-2)/(4*n))));

float r2=r1*(cos(PI/n)-sin(PI/n)*tan((PI*(n-2)/(4*n))));
float r3=r2*(cos(PI/n)-sin(PI/n)*tan((PI*(n-2)/(4*n))));


float xrand = random(-r,r);
float yrand = random(-r,r);


void setup()
{
  size(1000, 1000);
  background(255);
  smooth();
println(redI);

instructions = loadImage("instructions.png");
image(instructions,0,0);
  
}
 
void draw(){

  fill(redI,greenO,blueP,opacity);
  stroke(0+redI, 0+greenO, 0+blueP);
 
frameRate(FR);






if(mousePressed){
  xrand = random(-r,r);
  yrand = random(-r,r);
  
  
  
  
  
  
  
  nDist=n+nDist;
  cx=mouseX+xrand;
  cy=mouseY+yrand;

  

 
 
 polygonINT(n, cx+nDist,cy+nDist, r1);
 polygonINT(n, cx+nDist,cy+nDist, r2);


  
 }
}




void polygonINT(int n, float cx1, float cy1, float R1)
{
  float angle = 360 / n;
  float start_angle = 180 *n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + R1 * cos(radians(start_angle)),
      cy + R1 * sin(radians(start_angle)));
      start_angle+=angle;

  }
  endShape(CLOSE);
  strokeWeight(4);
  point( cx + cos(radians(angle*.5)) + sqrt( sq(r/sin(PI/n) - sq(r/2))),cy + sin(radians(angle*.5)) + sqrt( sq(r/sin(PI/n) - sq(r/2))) );
  println(sqrt( sq(r/sin(PI/n) - sq(r/2))));
  strokeWeight(1);

}


  void keyPressed(){
  if(key == '3'){
     n=3;
    }
   if(key == '4'){
     n=4;
    }
       if(key == '5'){
     n=5;
    }
      if(key == '6'){
     n=5;
    }
      if(key == '7'){
     n=7;
    }
        if(key == '8'){
     n=8;
    }
      if(key == '9'){
     n=9;
    }
      if(key == '0'){
     n=10;
    }
      if(key == '1'){
     n=11;
    }
      if(key == '2'){
     n=12;
    }
  
       if(key == 'q'){
     opacity=0;
    }
      if(key == 'w'){
     opacity=75;
    }
       if(key == 'e'){
     opacity=150;
    }
        if(key == 'r'){
     opacity=255;
    }
    
      if(key == 'a'){
     r=50;
    }
      if(key == 's'){
     r=100;
    }
        if(key == 'd'){
     r=150;
    }
         if(key == 'f'){
     r=200;
    }
            if(key == 'z'){
     FR=10;
    }
               if(key == 'x'){
     FR=30;
    }
               if(key == 'c'){
     FR=60;
    }
    
    
              if(key == 'i'){
     redI=redI+50;
    }
               if(key == 'o'){
     greenO=greenO+50;
    }
               if(key == 'p'){
     blueP=blueP+50;
    }
               if(key == 'u'){
     blueP=0; greenO=0; redI=0;
    }
               if(key == 'y'){
     blueP=255; greenO=255; redI=255;
    }
  
               if(key == 'h'){
     background(255);
    }
   
              if(key == 'j'){
     image(instructions,0,0);
    }


//print screen//

if(key == 'l') { saveFrame("Screenshot-####.tif");}
  if(key == 'm') {
   
    background(0,0,100);
    colorMode(HSB,100);
  }
  if(key == 'n') {endRecord(); } 
 
}    


