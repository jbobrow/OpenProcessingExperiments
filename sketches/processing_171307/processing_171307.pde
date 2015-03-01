
float aY,  bY , cX;

float  aX = 0; 

float  bX = 800; 

float cresceUno = -15;
float unoY = 799;
color uno = color (200, 0, 0);


float dueY = 799;
float cresceDue = -10;
color due = color (150, 0, 0);

float treY = 799;
float cresceTre = -7;
color tre = color (100, 0, 0);

float quattroY = 799;
float cresceQuattro = -5;
color quattro = color (50, 0, 0);

float cinqueY = 799;
float cresceCinque = -5;
color cinque = color (30, 0, 0);




void setup () {
 size(800, 800);
 smooth();
 //noFill();
}

void draw() {
  
  background(255, 0, 0);
  noStroke();
   
    unoY += cresceUno/2; 
    drawTriangleOne(cresceUno, unoY, uno, false);
    
    dueY += cresceDue/2;  
    drawTriangleOne(cresceDue, dueY, due, false);
    
    treY += cresceTre/2;  
    drawTriangleOne(cresceTre, treY, tre, false);
    
    quattroY += cresceQuattro/2;  
    drawTriangleOne(cresceQuattro, quattroY, quattro, false);
   
    cinqueY += cresceCinque/2;  
    drawTriangleOne(cresceCinque, cinqueY, cinque, true);
    
 }
// click play Luisa, click play!
void drawTriangleOne(float triangleOneCresce, float start, color inside, boolean last /* yeah!:) */) {
  

  aY = height;
  

  bY = height;
  
  cX = width/2;
  
  fill(inside);
  
  triangle(aX, aY, bX, bY, cX, start);
  
  if (last == true) 
 { 
    if ((start < 0) && (aX < width/2) ) {
      aX += 1;
      
      bX -= 1;
      
    }
  }
  
  //start =( start + triangleOneCresce);


}

