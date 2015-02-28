
// http://www.biopus.com.ar/emiliano/tutorial_programacion/random/index.html
PImage nariz1;  // tipo PImage para cargar imágenes
PImage nariz2;
PImage nariz3;
PImage ojos1;
PImage ojos2;
PImage ojos3;
PImage boca1;
PImage boca2;
PImage boca3;
PImage rostro;
float trans;
//----------------------------------------------
void setup()
{
size(400, 400); 
background(loadImage("rostro.jpg")); 
nariz1 = loadImage("nariz1.png"); 
nariz2 = loadImage("nariz2.png");
nariz3 = loadImage("nariz3.png");
ojos1 = loadImage("ojos1.png");
ojos2 = loadImage("ojos2.png");
ojos3 = loadImage("ojos3.png");
boca1 = loadImage("boca1.png");
boca2 = loadImage("boca2.png");
boca3 = loadImage("boca3.png");
trans = 25;

}
//----------------------------------------------
void draw()
{
if(trans == 0)
  {
   trans++;
  };
  
if(trans == 255)
  {
   trans = trans - 5;
  };
  
tint(255, trans);  
//primera linea    
 if(mouseX > 0 && mouseX <= 133 && mouseY > 0 && mouseY <= 133)
   {
     image(ojos1, 0, 0); 
    };
 if(mouseX >= 134 && mouseX <= 267 && mouseY > 0 && mouseY <= 133)
   {
     image(nariz2, 0, 0); 
    };  
 if(mouseX >= 268 && mouseY > 0 && mouseY <= 133)
   {
     image(boca3, 0, 0); 
    };   
//segunda linea    
 if(mouseX > 0 && mouseX <= 133 && mouseY >= 134 && mouseY <= 267)
   {
     image(boca1, 0, 0); 
    };
 if(mouseX >= 134 && mouseX <= 267 && mouseY >= 134 && mouseY <= 267)
   {
     image(ojos2, 0, 0); 
    };  
 if(mouseX >= 268 && mouseY >= 134 && mouseY <= 267)
   {
     image(nariz3, 0, 0); 
    };   
 //tercera linea    
 if(mouseX > 0 && mouseX <= 133 && mouseY >= 268)
   {
     image(nariz1, 0, 0); 
    };
 if(mouseX >= 134 && mouseX <= 267 && mouseY >= 268)
   {
     image(boca2, 0, 0); 
    };  
 if(mouseX >= 268 && mouseY >= 268)
   {
     image(ojos3, 0, 0); 
    }; 
 
    
 
//----------------------------------------------
}

