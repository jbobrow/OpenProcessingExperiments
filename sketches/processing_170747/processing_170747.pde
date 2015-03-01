
void setup() { 
background(0);
size(400,400);
frameRate(2); 
noStroke();
}
int type=2;
int i;

void draw () {
  
  //rettangoli
  
  if (type==1) {
         background(0);
         for (i=1; i<10; i++) {
         fill(random(255), random(255), random(255), random(100));
         rect(random(300), random(300), i*random(20), random(100)); 
         }
    }
  
  //cerchi
  
      if (type==2) {
        background(random(0));
        for (i=1; i<10; i++) {
        fill(random(255), random(255), random(255), random(100));
        ellipse(random(300), random(300), i*20, i*20); 
         }
       }
        
  //pentagoni
  
         if (type==3) {
           int k;
           background(random(0));
           for (k=1; k<10; k++) {
              float angle = 360.0 / 5;
              int cx=int(random(300));
              int cy=int(random(300));
              int r=10*k;
              fill(random(255), random(255), random(255), random(100));
              beginShape();
                for (int i = 0; i < 5; i++)  {
                  vertex(cx + r * cos(radians(angle * i)),
                  cy + r * sin(radians(angle * i)));
                }
             endShape(CLOSE);
          }
         }
  }

//controllo tasti        
        
  
  
void keyPressed() {
  if (key=='r') {
          type=1; 
  }
  if (key=='c') {
          type=2; 
  }
  if (key=='p') {
          type=3; 
  }
}
