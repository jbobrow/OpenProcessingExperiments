
/*ZWEITE PROGRAMME MIT DER MAN DEN WÜRFEL DREHT und dabei zeichnet
mit klick auf V wird viereck erstellt
Funktioniert nur als Javascript.
*/
//so erstelle ich maloberfläche
void setup(){
  //die grösse
size(400,400,P3D);
//background farbe
background(255);
}

void draw() {
  
 if (mouseButton == LEFT) {
   stroke(0);   
   translate(200, 200, 200); //position von dem Punkten 
      rotateX(mouseX);
      rotateY(mouseY);
      noFill();
      box(40);
  }

 if (mouseButton == RIGHT){
   stroke(255);
   line(200, 150, 250, 250); //1
   line(250, 250, 150, 250); //2
   line(150, 250, 200, 150); //3
   }
if (keyPressed) {
    if (key == 'N' || key == 'n') {/* nur bei v oder = ||
                                   bei Grossem V wird gezeichnet*/ 
     //background farbe
background(255);
     translate(300, 280, 350); //position von dem Punkten 
      rotate(0,5);
      box(40);
      noFill(255);
      
    }
  } 

} 

    
     

      
   
