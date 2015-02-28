
void setup() {
  size(200,200);
}

void draw() { 
 for(float y=0; y<=200; y=y+40) {
   for(float x=0; x<=200; x=x+40) {
   pushMatrix();
   translate(x,y);
   rotate(radians(frameCount));
   scale(0.3);
   jinju_draw();
   popMatrix();
   }
   }
}

void jinju_draw() {
background(255,255,0);
//눈
ellipse(70,70,50,50);
ellipse(70+70,70,50,50);
//눈알
fill(0);
ellipse(80,75,30,30);
ellipse(80+50,75,30,30);
//코
fill(2,255,0);
ellipse(105,120,50,20)
//입
fill(255,0,0);
rect(55,150,100,30);
fill(250);
rect(80,150,25,15);
rect(106,150,25,15);
 
}
                
                
