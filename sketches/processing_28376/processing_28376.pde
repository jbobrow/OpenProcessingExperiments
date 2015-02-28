
int num = 50;
int[] x = new int [num];
int[] y = new int [num];
float sizeX = 5;
float sizeY = 5;

void setup() {
 size (600, 400);
 background (238);
 fill(10, 50);
  stroke (clvalue);
 smooth();
 frameRate(60); 
}


 void draw() {
   
   if ((mouseX == pmouseX) && (mouseY == pmouseY)) {
     sizeX = sizeX + 0.25;
     sizeY = sizeY + 0.25;
   }else{
   sizeX = 5;
   sizeY = 5;
   }
   //redefines fill for rectangle
   
   fill(238, 10);
   rect(0,0, width, height);
   //redrawing rectangle mimics decay of mouse 
   fill(10);
   
   
   println(mouseX + " : " + mouseY);

float radius = (num+1) / 2.0;
  
   ellipse  (mouseX, mouseY, sizeX, sizeY);
}
int clvalue = 0;

void mouseClicked() {

  fill (0);
  ellipse  (mouseX, mouseY, sizeX *5,sizeY *5);
   
 
}
void mouseDragged()
{
 
 fill(238);
 stroke(10);
 ellipse (mouseX, mouseY, sizeX*2, sizeY*2);
 
}



