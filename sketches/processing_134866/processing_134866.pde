
float x=3;
float y=3;
float counter = 0;
float a;



void setup(){
size(800, 600);
background (0,0,0);
a = height/2;
}

  
 void draw (){
   background (0);
   stroke(255);
   line(0, random(600), 799, random(600));
   
   line(0, random(500), 799, random(700));
   
   line(0, random(600), 799, random(600));
   
   
  
 for (int x = 0; x < 800; x = x+4) {
  for (int y = 0; y < 600; y = y+4) {
    float r = random (1, 100);
  strokeWeight (random (2));
 stroke (#C4C0C0);
 noFill();
 float d = random (200);
    point(x, y);  
  }
 }
 
 line(0, a, width, a);  
  a = a - 0.5;
  if (a < 0) { 
    a = height; 
  }
 }



  


