
int myState = 0;
int x1 = 10;
int x2 = 20;
int x3 = 35;
int x4 = 55;
int x5 = 80;



void setup ( ) {
  size (600,600);
  
}

void draw ( ) {
  
  switch (myState) {
    case 0:
    
    background (0, 15, 50);
    fill (0, 50, 50);
    ellipse (300, 300, x5, x5);
    fill (0, 50, 100);
    ellipse (300, 300, x4, x4);
    fill (0, 100, 100);
    ellipse (300, 300, x3, x3);
    fill (0, 150, 100);
    ellipse (300, 300, x2, x2);
    fill (1, 150, 150);
    ellipse (300, 300, x1, x1);
 
    break;
    
    case 1:
    
     background (0, 15, 50);
    fill (0, 50, 50);
    ellipse (300, 300, x5, x5);
    fill (0, 50, 100);
    ellipse (300, 300, x4, x4);
    fill (0, 100, 100);
    ellipse (300, 300, x3, x3);
    fill (0, 150, 100);
    ellipse (300, 300, x2, x2);
    fill (1, 150, 150);
    ellipse (300, 300, x1, x1);
    
    x1 = x1 + 5;
    x2 = x2 + 5;
    x3 = x3 + 5;
    x4 = x4 + 5;
    x5 = x5 + 5;
    
    if (x1 > 400) {
      x1 = 10;
      x2 = 20;
      x3 = 35;
      x4 = 55;
      x5 = 80;
    }
    
     break;
    
    case 2:
    
     background (15, 50, 0);
    fill (50, 50, 0);
    ellipse (300, 300, x5, x5);
    fill (50, 100, 0);
    ellipse (300, 300, x4, x4);
    fill (100, 100, 0);
    ellipse (300, 300, x3, x3);
    fill (150, 100, 0);
    ellipse (300, 300, x2, x2);
    fill (150, 150, 0);
    ellipse (300, 300, x1, x1);
    
     x1 = x1 + 5;
    x2 = x2 + 5;
    x3 = x3 + 5;
    x4 = x4 + 5;
    x5 = x5 + 5;
    
    if (x1 > 400) {
      x1 = 10;
      x2 = 20;
      x3 = 35;
      x4 = 55;
      x5 = 80;
    }
    
    break;
    
    case 3:
    
    background (50, 00, 15);
    fill (50, 0, 50);
    ellipse (300, 300, x5, x5);
    fill (100, 0, 50);
    ellipse (300, 300, x4, x4);
    fill (100, 0, 100);
    ellipse (300, 300, x3, x3);
    fill (100, 0, 150);
    ellipse (300, 300, x2, x2);
    fill (150, 0, 150);
    ellipse (300, 300, x1, x1);
    
      x1 = x1 + 5;
    x2 = x2 + 5;
    x3 = x3 + 5;
    x4 = x4 + 5;
    x5 = x5 + 5;
    
   if (x1 > 400) {
      x1 = 10;
      x2 = 20;
      x3 = 35;
      x4 = 55;
      x5 = 80;
    }
    
    break;
    
    case 4: 
    
    background (50);
    fill (100);
    ellipse (300, 300, x5, x5);
    fill (150);
    ellipse (300, 300, x4, x4);
    fill (200, 0, 100);
    ellipse (300, 300, x3, x3);
    fill (225, 0, 150);
    ellipse (300, 300, x2, x2);
    fill (255, 0, 150);
    ellipse (300, 300, x1, x1);
    
      x1 = x1 + 5;
    x2 = x2 + 5;
    x3 = x3 + 5;
    x4 = x4 + 5;
    x5 = x5 + 5;
    
    if (x1 > 400) {
      x1 = 10;
      x2 = 20;
      x3 = 35;
      x4 = 55;
      x5 = 80;
      
    }
    
    
    break;
    
    case 5: 
    
     background (x1);
    fill (x2);
    ellipse (300, 300, x5, x5);
    fill (x3);
    ellipse (300, 300, x4, x4);
    fill (x4, 0, 100);
    ellipse (300, 300, x3, x3);
    fill (x5, 0, 150);
    ellipse (300, 300, x2, x2);
    fill (x1, 0, 150);
    ellipse (300, 300, x1, x1);
    
      x1 = x1 + 5;
    x2 = x2 + 5;
    x3 = x3 + 5;
    x4 = x4 + 5;
    x5 = x5 + 5;
    
    if (x1 > 400) {
      x1 = 10;
      x2 = 20;
      x3 = 35;
      x4 = 55;
      x5 = 80;
      
    }
    
    
    break;
    
  }   
}

    
  

void mousePressed() {
  myState = myState + 1;
  
  if (myState > 5) {
    myState = 1 ;
  }
  
    x1 = x1 + 5;
    x2 = x2 + 5;
    x3 = x3 + 5;
    x4 = x4 + 5;
    x5 = x5 + 5;
    
    
      
}





    


