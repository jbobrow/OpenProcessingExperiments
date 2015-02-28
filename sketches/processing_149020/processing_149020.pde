
// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: Lee hyejin 
// ID: 201420103 hye-jin 


float a; 

float angle; 

void setup() { 
  size(600, 600); 
  smooth(); 
  background(#FFF0F4); 


} 

void draw() { 
  angle += 0.01; 
  translate(width/2, height/2);  
  for (int i = -250; i < 400; i = i + 100) { 
    for (int j = -250; j < 400; j = j + 100) { 
      quad1(i, j); 

    } 


  } 
}

 
void quad1 (int x, int y) { 
  noStroke();
  fill(#FF43B1); 
  quad (x, y-50, x+20, y-30, x, y-20, x-20, y-50); 
  fill(#2CE8FF);
  quad (x, y+10, x+20, y+30, x, y+50, x-20, y+50); 
  fill(#FCB0C3);
  quad (x+20, y-20, x+50, y, x+30, y+20, x+10, y); 
  fill(#B0F4FC);
  quad (x-30, y-20, x-50, y, x-30, y+20, x-10, y); 


}   

void keyPressed() { 
  background(255); 

} 
