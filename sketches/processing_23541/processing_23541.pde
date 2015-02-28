
class Cell {
int v;
int h;
boolean active = false;
 int count = 0;
 
 Cell(int av, int ah) {
   v = av;
   h = ah;
 }

 boolean isHit(int av, int ah) {
   if (h == ah && v == av) {
   return true;
   }
   return false;
 }

 void play() {
   if (active) {
   
     vexations.trigger();
   
   }
 }
 


 void display() {
   if (active) {
     fill(#E3DD29);


   } else {
     fill(#C16D6D, 63);
     
   }
   rect(h*50,v*50, 50,50);

 }
}




