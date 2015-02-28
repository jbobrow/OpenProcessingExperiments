

int p1;
int p2;
int p3;
int p4;
int p5;
int p6;


int splash2 = 20;

void setup() {  // setup() runs once
  size(400, 400);
  background(255);

}
 
void draw() {  // draw() loops forever, until stopped
 //int splash = (int)random(1,70);
 
  if(mousePressed && mouseButton == LEFT) {
    p1 = mouseX;
    p2 = mouseY;
       
   for(int splash=0;splash<150;splash++){
     int grad = (int)random(1,360);
     int grad2= (int)random(1,360);
 
   //Feder
   //Feder stroke(255,200,0);    
   //Feder line(p1+splash-100, p2-splash+grad, p1-grad, p2+grad);
    
    stroke(random(230,255),random(0,260),0);    
  //line(p1+splash-100, p2-splash+grad, p1-grad, p2+grad);
  curve(p1+splash-grad, p2-splash+grad, p1-grad, p2+grad,p1+splash-grad2, p2-splash+grad2, p1-grad, p2+grad);
  curve(p1+splash-grad, p2-splash+grad, p1-grad, p2+grad,p1+splash-grad2, p2-splash+grad, p1-grad, p2+grad);
  curve(p1-grad, p2+grad, p1-grad, p2+grad,p1+splash-grad2, p2-splash+grad, p1-grad, p2+grad);
     
   }
 }
    
}



