
//Keith Maverick Yeung
//Introduction to Digital Media Fall 2012
//Section A
//September 11th, 2012

int randomdiameter = 0; //Global Celebrity
float strokevalue = 0;
int draw1;




void setup() {
  size(1200,600);
  background(0,0,0);
  draw1 = 0;


  
}
   

void draw() {
  
//  stroke(0,100,255);
 if (draw1 == 1) {
   fill(0,100,255);
   ellipse(mouseX,mouseY, 30, 30);
   strokeWeight(random(10));
   stroke(random(255));
 }



 float r1,r2;
 float v = random(1);
 if(v<1) {
   r1 = random(100,220);
   r2 = random(100,200);
 }
 else {
   r1 = random(270,400);
   r2 = random(270,400);
 }


  
   
   for(int u = 0; u<100;u++) {
     ellipse(random(100,1100), random(50,500), random(10), random(10));
     fill(255);
   }
   
   
 
}

void mouseClicked() {
  if (draw1 == 0) {
    draw1 = 1;}
    else {
      draw1 = 0;}
}

void keyPressed() {
  if(key == 's') {
    save("keithMaverickYeung.png");
  }
}


