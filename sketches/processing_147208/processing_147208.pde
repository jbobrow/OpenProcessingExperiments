
float click =0;

void setup() {
  size (700, 700);
}

void draw() 
{
  background (#FF00C0);
  if (click >= 1) {  
    fill (#FF8D00); 
    ellipse (340, 390, 50, 50);
  }//Orange
  if (click >= 2) { 
    fill (500, 0, 0); 
    ellipse (200, 410, 50, 50);
  }//Apple
  if (click >= 4) { 
    fill (0, 450, 0); 
    ellipse (410, 460, 175, 100);
  }//Watermelon
  if (click >= 5) {
    fill (0, 450, 0);
    ellipse (300, 515, 175, 100);
  }//Watermelon
  if (click >= 6) {
    fill (#FF8D00);
    ellipse (200, 480, 50, 50);
  }//Orange 
  if (click >= 7) {
    fill (#E9ED13);
    ellipse (520, 495, 50, 50);
  }//Lemon
  if (click >= 8) {
    fill (500, 0, 0);
    ellipse (440, 515, 50, 50);
  }//Apple
  if (click >= 9) {
    fill (0, 450, 0);
    ellipse (491, 528, 50, 50);
    fill (0, 0, 0);
    ellipse (491, 528, 10, 20);
  }//Kiwi
  if (click >= 3) {
    fill (0, 450, 0);
    ellipse (310, 425, 175, 100);
  }//Watermelon
  if (click >= 10) {
    fill (#000000);
    rect (180,550,400,200);
   
  }

}



void mousePressed()
{ 
  click = click +1; 
  ellipse (200, 410, 50, 50);//Apple
  ellipse (410, 460, 175, 100);//Watermelon
  ellipse (300, 515, 175, 100);//Watermelon
  ellipse (200, 480, 50, 50);//Orange
  ellipse (520, 495, 50, 50);//Lemon
  ellipse (440, 515, 50, 50);//Apple
}

