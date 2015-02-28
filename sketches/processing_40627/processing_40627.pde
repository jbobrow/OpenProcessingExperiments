
class ArcObj { 
  float fillz;

  ArcObj(float f) {
    fillz = f;
  }

   void display() {
    arc(width/2, height/2, 380, 380, radians(270), radians(fillz+270));
   }
 }

