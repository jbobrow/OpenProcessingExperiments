
int fondo1 = #C6F5E9;
int fondo2 = #000000;
int mc = 10; 
float ancline = 8.0;

void setup () {
  size (900, 600); 
   background (fondo1);
  }

void draw (){
   if (mousePressed && (mouseButton ==LEFT)) {
   strokeWeight (ancline);
   stroke (int (random (255)), int (random (255)), int (random (255)));
   line (pmouseX, pmouseY, mouseX, mouseY);
   }
   
   if (mousePressed && (mouseButton ==RIGHT)) {
      fill (int (random (255)), int (random (255)), int (random (255)));
      noStroke ();
      rect (mouseX, mouseY, 10, 10);
      
   }
    if (key == 't'){
   background (#FFC503); 
   ellipse (int (random(900)), int (random (600)), int (random(255)), int (random(255)));
    }

      }  
      
void keyPressed (){
   if (key == '+' ){
     ancline = (ancline+0.2);
     strokeWeight (ancline);
     stroke (int (random (255)), int (random (255)), int (random (255)));
     line (pmouseX, pmouseY, mouseX, mouseY);
   }
   
   if (key == '-'){
     ancline = (ancline-0.2);
     strokeWeight (ancline);
     stroke (int (random (255)), int (random (255)), int (random (255)));
     line (pmouseX, pmouseY, mouseX, mouseY);
   }
   
   if (key == 'c'){
   background (fondo1);
   }
  
}


