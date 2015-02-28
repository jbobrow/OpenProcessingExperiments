
FizzleMyNizzle[] fizzNizz;

int spacing = 10;

void setup() {

size(500, 500);
colorMode(HSB, 100);


fizzNizz = new Rizzle[(height / spacing) * (width / spacing)];

for (int i = 0; i < fizzNizz.length; i++) {
 fizzNizz[i] = new Rizzle((i * spacing) % width, ((i * spacing) / width) * spacing);
}
  
}




void draw() {
 
 for (int i = 0; i < fizzNizz.length; i++) { 
  
 fizzNizz[i].update(); 
  
 }
  
}




class FizzleMyNizzle {
 
 int xPos, yPos, aColor;
 float rot; 
  
 FizzleMyNizzle (int xPos, int yPos) {
  
  this.xPos = xPos;
  this.yPos = yPos;
  rot = random(0, PI);
  aColor = (int)random(100);
   
 }
  
  void update() {
   
   pushMatrix();
   fill(aColor, 100, 100 / (height / (mouseY+1)));
   translate(xPos, yPos);
   rotate(rot * mouseX / width);
   rect(0, 0, spacing, spacing);
   popMatrix();
    
  }
  
}

class Rizzle extends FizzleMyNizzle {
  
  float rizSize = 1.0;
  int rizGrow = 1;
  int rizMax = (int)random(150);
  float rizSpeed = 1.0;
  
 Rizzle (int xPos, int yPos) {
  
  super(xPos, yPos);
   
 }
 
 void update() {
  
   rizSpeed = sq((float)mouseY/50.0);
   pushMatrix();
   fill(aColor * mouseX/400 % 100, 100, 100);
   translate(xPos, yPos);
   if (rizSize < rizMax && rizGrow == 1) {
     rizSize += rizSpeed;
   } else if (rizSize > 1 && rizGrow == -1) {
     rizSize -= rizSpeed; 
   } else { 
     rizGrow *= -1;
   }
   rect(-rizSize/2, -rizSize/2, rizSize/2, rizSize/2);
   popMatrix();
   
 }
  
}
