
int startX = 50;
int startY = 50;
int space = 50; 

void setup () { 
  size (500,500); 
  background (0,0,0); 
  smooth(); 
  fill (#65E8E0);
  noStroke (); 
}

void draw () { 
  smooth (); 
  for (int i = 0; i < 450; i = i + space) { 
    for (int j = 0; j < 450; j = j + space) {
      fill (101 - j/2, 232 - j/2, 224 - j/2); 
      //color c = color (#65E8E0);
      //float value = alpha (c - j); 
      ellipse (startX + i, startY + j, 3+i/13, 3+i/13); 
    }
  }
}
                
                
