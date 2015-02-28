
// Laura Gafuri
//EF6

void setup() { 
  size(200, 200); 
  background(220);
}

void draw() {   
  for (int i=25; i<180; i=i+25) { 
    for (int j=25; j<180; j=j+25) {  
      if (j>140&&j<160 && i>120&&i<160) { 
        fill (#FFF68F);
      }
      else {
        stroke(#CD0000);
      }

      ellipse (i, j, 10, 10);
      stroke(#228B22);

      // desenha as linhas
      if (j<160) {
        line (i, j+5, i, j+24);
      }
      if (i<160) {
        line (i+5, j, i+24, j);
      }
    }
  }
}

