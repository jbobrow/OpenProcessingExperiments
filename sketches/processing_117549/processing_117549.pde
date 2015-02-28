
//Press and hold any vowel


int R = 8;
int G = 5;
int B = 31;
int G2 = 255;
int B2 = 31;

int A = 255;



void setup() {
  size (600,600);
}

void draw() {
  background (255);
  smooth ();
  noStroke ();
  
  //rects
  
  fill (8, 5, 31, A);
   rect (150, 150, 50, 50);
   
    fill (8, 5, 31,A);
   rect (225, 150, 50, 50);
   
    fill (8, G, 31, A);
   rect (300, 150, 50, 50);
   
    fill (8, G, 31,A);
   rect (375, 150, 50, 50);
    
     fill (8, G, 31, A);
   rect (450, 150, 50, 50);
   
   
 fill (8, 5, 31, A);
   rect (150, 225, 50, 50);
   
    fill (R, 5, B, A);
   rect (225, 225, 50, 50);
   
    fill (R, G, 31, A);
   rect (300, 225, 50, 50);
   
    fill (R, 5, 31, A);
   rect (375, 225, 50, 50);
    
     fill (8, 5, 31, A);
   rect (450, 225, 50, 50);
   
   
   
    fill (8, 5, 31, A);
   rect (150, 300, 50, 50);
   
    fill (R, 5, 31, A);
   rect (225, 300, 50, 50);
   
    fill (8, G, B2, 255);
   rect (300, 300, 50, 50);
   
    fill (R, G, 31, A);
   rect (375, 300, 50, 50);
    
     fill (8, G, B2, 255);
   rect (450, 300, 50, 50);
   
   
    fill (8, 5, 31, A);
   rect (150, 375, 50, 50);
   
   fill (R, 5, B, A);
   rect (225, 375, 50, 50);
   
    fill (R, G, B2, 255);
   rect (300, 375, 50, 50);
   
    fill (R, 5, 31, A);
   rect (375, 375, 50, 50);
    
     fill (8, 5, B2, 255);
   rect (450, 375, 50, 50);
   
   
   
    fill (8, 5, 31, A);
   rect (150, 450, 50, 50);
   
    fill (R, 5, B, A);
   rect (225, 450, 50, 50);
   
    fill (8, G, B2, 255);
   rect (300, 450, 50, 50);
   
    fill (R, G, B2, 255);
   rect (375, 450, 50, 50);
    
     fill (8, G, B2, 255);
   rect (450, 450, 50, 50);
   
  
  // o 
  fill (255, G2, 255, A);
  rect (75, 75, 50, 50);
  rect (75, 150, 50, 50);
  rect (75, 225, 50, 50);
  rect (75, 300, 50, 50);
  rect (75, 375, 50, 50);
  rect (75, 450, 50, 50);
  rect (75, 525, 50, 50);
  rect (150, 525, 50, 50);
  rect (225, 525, 50, 50);
  rect (300, 525, 50, 50);
  rect (375, 525, 50, 50);
  rect (450, 525, 50, 50);
  rect (525, 525, 50, 50);
  rect (525, 450, 50, 50);
  rect (525, 375, 50, 50);
  rect (525, 300, 50, 50);
  rect (525, 225, 50, 50);
  rect (525, 150, 50, 50);
  rect (525, 75, 50, 50);
  rect (450, 75, 50, 50);
  rect (375, 75, 50, 50);
  rect (300, 75, 50, 50);
  rect (225, 75, 50, 50);
  rect (150, 75, 50, 50);
  
  
  
   
}
   
   //key commands
  void keyPressed() {
    if (key == 'a') {
      R = R + 5; 
    } 
    if (key == 'e') {
      G = G + 1;
    }
    if (key == 'i') {
      B = B + 5;
    }
    if (key == 'o') {
      G2 = G2 - 3;
    }
    if (key == 'u') {
      B2 = B2 - 2;
      A = A - 2;
      
    }
      
  } 
    
 
void keyReleased() {
  if (key == 'a') {
    R = 8;
  } 
  if (key == 'e') {
    G = 5;
  }
  if (key == 'i') {
    B = 31;
  }
  if (key == 'o') {
    G2 = 255;
  }
 if (key == 'u') {
   B2 = 31;
   A = 255;
 }
    
}



