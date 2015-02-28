
int[][] sizes = new int[5][5];
color[][] pallette = new color[5][5];
int[][] Xpos = new int[5][5];
int[][] Ypos = new int [5][5];
boolean[][] grow = new boolean [5][5];
int [][] growLimits = new int [5][5];
int [][] growCount = new int [5][5];

int Xo, Yo;

void setup () {

size (500, 500);
  
rectMode (CENTER);

Xo = 70;
Yo = 70;

for (int j = 0; j < 5; j++ ){
  
  for (int i = 0; i < 5; i++) {
    
   Xpos[j][i] = Xo + 90*i;
   Ypos[j][i] = Yo + 90*j;
   sizes[j][i] = 50;
   pallette [j][i] = color (random(255), random (255), random (255), 150);
   grow[j][i] = false;
   growLimits[j][i] = 0;
   growCount [j][i] = 0;
  }
}

noStroke();
  
}

void draw () {

background (255);  
  
 for (int j = 0 ; j < 5; j++) {
  
   for (int i = 0; i < 5; i++) {
     
     if (grow[j][i] == true && growCount[j][i] < growLimits[j][i]) {
       sizes [j][i] += 1;
       growCount [j][i] += 1;
       
     } else {
       
       grow[j][i] = false;
       growCount [j][i] = 0;
       
     }
    
    fill (pallette[j][i]);
    rect (Xpos[j][i], Ypos[j][i], sizes[j][i], sizes[j][i]);
     
   }
  
 }
  
}

void mouseClicked () {
 
for ( int j = 0; j < 5; j++ ){  
  
  for (int i = 0; i < 5; i++) {
  
    if (mouseX > Xpos[j][i] - sizes[j][i] / 2 && mouseX < Xpos[j][i] + sizes[j][i] / 2 && mouseY > Ypos[j][i] - sizes[j][i] / 2 && mouseY < Ypos[j][i] + sizes[j][i] / 2) {
     
     grow [j][i] = true;
     growLimits[j][i] = int (random (20, 60));
      
    }
    
 }
 
}
 
  
}


