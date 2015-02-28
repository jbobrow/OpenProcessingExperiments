
void setup() {
   size(640,480);
   smooth();
}

int varX = 20;
int varY = 30;

void draw() {
   background(255);
   noFill();
   stroke(0);
   strokeWeight(1);
   float easing = 0.02;
   float lessEas = 0.2;
   
   int tempX = mouseX;
   int tempY = mouseY;
   varX += (tempX - varX) * easing;
   varY += (tempY - varY) * easing;
   
   //map the change in the left eye's size
   float le = map(mouseX,0,width,0,90);
   
   //map the change in the right eye's size
   float re = map(mouseY,0,height,0,180);
   
   //eye sockets
   fill(10,10,250);
   ellipse(220,220,80+le,120);
   ellipse(420,220,120,80+re);
   
   //pupils
   fill(0);
   float jitter = (dist(mouseX,mouseY,pmouseX,pmouseY))*lessEas;
   ellipse(220,220,20+jitter,30+jitter);
   ellipse(420,220,20+jitter,30+jitter);
   
   //worry aug
   float lw = map(mouseY,0,height,0,20);
   
   //left eye worries
   noFill();
   if(mouseX == pmouseX && mouseY ==pmouseY) {
     stroke(255,0);
   }
   else {
     stroke(1);
   }
   
   arc(220,220,180,130,radians(0),radians(345));
   arc(220,220,190,140,radians(300),radians(355+lw));
   arc(220,220,200,130,radians(0+lw),radians(35));
   arc(220,220,190,140,radians(200-lw),radians(250+lw));
   arc(220,220,205,135,radians(170-lw),radians(185+lw));
   arc(220,220,190,140,radians(150-lw),radians(160+lw));
   arc(220,220,205,135,radians(90-lw),radians(130+lw));
   
   //right eye worries
   noFill();
   if(mouseX == pmouseX && mouseY ==pmouseY) {
     stroke(255,0);
   }
   else {
     stroke(1);
   }
   
   arc(420,220,130,266,radians(0),radians(345));
   arc(420,220,150,270,radians(300),radians(355+lw));
   arc(420,220,140,275,radians(0+lw),radians(35));
   arc(420,220,150,270,radians(200-lw),radians(250+lw));
   arc(420,220,140,275,radians(170-lw),radians(185+lw));
   arc(420,220,150,270,radians(150-lw),radians(160+lw));
   arc(420,220,140,275,radians(90-lw),radians(130+lw));
   arc(420,220,140,275,radians(260-lw),radians(290+lw));
}

