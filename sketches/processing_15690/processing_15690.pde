
/*Create your own creature: draw my creature "Mickey" 
Assignment 2: make my creature a function*/

int x,y,s;
color c;

// Set up start conditions
void setup (){
  
  size (200, 200);
  background (#C6E2FF);
  smooth ();
  c = color (255, 0, 0);
 
}

// "Main" methode
void draw() {

   //background change
   if (mousePressed) {
     background (#FF5656);
   } else {
     background (#C6E2FF);
   }
    
  draw_mickey (mouseX, mouseY, c, s);
 
}

// Draws a little sweet Mickey Mouse
void draw_mickey ( int x, int y, color c, int s) {
  
    //eyes
    fill (#141414);
    ellipse (x + 20, y+5, 50,70);

    fill (#FFFFFF);
    ellipse (x+10, y+10, 20, 70);
    ellipse (x+30, y+10, 20, 70);


    fill (#9932CC);
    ellipse (x+10, y+10, 10, 30);
    ellipse (x+30, y+10, 10, 30);


     //Schnauze
    fill (#FDF5E6);
    ellipse (x+20, y+30, 80, 50);
  
  
    //nose
    fill (#141414);
    ellipse (x+20, y+20, 30, 10);

    //ears
    ellipse (x-25, y-30, 60, 60);
    ellipse (x+65, y-30, 60, 60);
    
    //mouth
    fill(255);
    triangle ( mouseX+35, mouseY+45, mouseX , mouseY+35, mouseX, mouseY+30);
    }


// Repition because of Processing bug!
/**Create your own creature: draw my creature "Mickey" 
Assignment 2: make my creature a function*/
  

