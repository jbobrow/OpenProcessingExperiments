
size (700, 400);
background (255);
smooth();

int circle = 10;
float pos = random (-10,10);

for (int i = 0; i<=70; i++){
   ellipse (i*10, height/2+random(-30,30), circle, circle);
}      
                
