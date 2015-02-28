
// Sinan Tok 050411037 grafik tasarım stgalatasaray1905@gmail.com
// Kürşat Sandıkçı 050411031 grafik tasarım qrsad53@yahoo.com
// Ersoy Bölükbaşı 050411018 grafik tasarım ersoybolukbasi@gmail.com
// Barbaros Kurt 050411027 grafik tasarım barbaroskurtbkurt@hotmail.com

// karesel çakışmaların insan üzerinde ki etkisiyle göz yanılmaları



void setup() {
  background(255, 204, 0);
  size(800 , 600);
}

void draw(){
  
    for (int x = 0; x < 800; x += 110) { 
    for (int y = 0; y < 600; y += 110) { 
 
      int r = (int) (15 * (6.0 - dist(x, y, mouseX, mouseY) / 80)); 
       
      ciz (x, y, r); 
    } 
  } 

  }
void ciz(int x, int y, int r) { 
  rectMode(CENTER); 
  rect(x, y, r*2, r*2); 
} 




