
int[] sizes = new int[25];
color[] pallette = new color[25];
int[] Xpos = new int[5];
int[] Ypos = new int[5];

int Xo, Yo;

void setup () {

size (500, 500);
  
rectMode (CENTER);

Xo = 70;
Yo = 70;

for (int i = 0; i < 5; i++ ){
  
  Xpos[i] = Xo + 90*i;
  Ypos[i] = Yo + 90*i;
  
}

for (int i = 0; i < 25; i++) {
 
 sizes [i] = 50;
 pallette [i] = color (random(255), random (255), random (255), 150);
}

noStroke();
  
}

void draw () {

background (255);  
  
 for (int j = 0 ; j < 5; j++) {
  
   for (int i = 0; i < 5; i++) {
    
    fill (pallette[(j*5) + i]);
    rect (Xpos[i], Ypos[j], sizes[(j*5) + i], sizes[(j*5) + i]);
     
   }
  
 }
  
}

void mouseClicked () {
 
for ( int j = 0; j < 5; j++ ){  
  
  for (int i = 0; i < 5; i++) {
  
    if (mouseX > Xpos[i] - (sizes[(j*5)+i] / 2) && mouseX < Xpos[i] + (sizes[(j*5)+i] / 2) && mouseY > Ypos[j] - (sizes[(j*5)+i] / 2) && mouseY < Ypos[j] + (sizes[(j*5)+i] / 2)) {
     
     sizes [(j*5) + i] = sizes[(j*5) + i] + 10;
      
    }
    
 }
 
}
 
  
}


