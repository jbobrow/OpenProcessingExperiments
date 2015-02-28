
int startX = -1;
int startY = -1;
int endX = 501;
int endY = 0; 
float space = 50.2; 

void setup () { 
  size (500,500); 
  background (0,0,0); 
  smooth(); 
  stroke (#50FFF5);
  strokeWeight (.02); 
}

void draw () { 
  for (float i = 0; i <= 502; i = i + space) { 
     line (startX + i, startY, endX, endY + i); 
  }
}

                
                
