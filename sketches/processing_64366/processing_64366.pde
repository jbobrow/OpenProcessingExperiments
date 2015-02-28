
void setup(){
  size(500,500);
  background (0);
}
 int x = 250;
  int y = 0;
void draw(){
  float a = random (500);
  float b = random (500);
  float c = random (500);
  float g = random (500);
  float d = random (255);
  float e = random (255);
  float f = random (255);
  float q = 0;
  float r = 0;
  float time = millis();
 
  blend(0,0,mouseX,mouseY, 0, 0, 500, 500, DIFFERENCE);
   blend(0,0,mouseX,mouseY, 0, 0, 500, 500, DIFFERENCE);
   if (mousePressed)
   {
     background (255);
     q = millis();
     r = millis()+1000;
     if (q==r){
       q=0;
       r=0;
       background(0);
     }
   }
   
   if (key == 'w'||key == 'W')
   {
     y++;
   }
   if (key == 's')
   {
     y--;
   }
   if (key == 'a')
   {
     x--;
   }
   if (key == 'd')
   {
     x++;
   }
    
     stroke (d,e,f);
  line (x,y,c-50,a-50);
}

