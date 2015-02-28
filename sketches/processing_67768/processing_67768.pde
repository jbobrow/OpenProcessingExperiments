
// ABRAHAM ALVAREZ VALLEJO
void setup()
         {
          size(200,200); 
         }
 
  void draw(){
         background(255);
         noFill();
         strokeWeight(5);
         smooth();
         stroke(0,0,255);
         ellipse(30,30,40,40);
         stroke(255,255,0);
         ellipse(45,50,40,40);
         stroke(0,0,0);
         ellipse(60,30,40,40);
         stroke(0,255,0);
         ellipse(75,50,40,40);
         stroke(255,0,0);
         ellipse(mouseX+30,mouseY+20,40,40);
  }
