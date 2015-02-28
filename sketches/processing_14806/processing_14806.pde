
int var;
int ek;

void setup () {
 var = 1000 ;
 ek=1000;


 size (2*var,var) ;
}

 void draw () {
   background (0) ;
   noStroke();
   var= var+3; 
   fill(255);
   quad(mouseX, mouseY, random(ek), random(ek/2), random(ek), random(ek/2), random(ek), random(ek/2));
 
  fill(255,0,0,80);
  ellipse(mouseX,mouseY,var/4,var/4);
  fill(0,0,255,128);
  ellipse(ek/3,random(2*ek),var/4,var/4);
  fill(0,0,255,128);
  ellipse(ek/6+random(2*ek),-var/2,var/4,var/4);
  fill(0,255,0,128);
  ellipse(random(2*ek),ek/5,var/4,var/4);
 
 
}
 
 void mouseClicked(){
 var= 0;

 }


