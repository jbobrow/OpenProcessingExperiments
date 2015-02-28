
void setup()
{
  size (400,400); 
  smooth();
}

int x = 0; // x position  
int y = 0; // y position  
  
int speed = 3;    
int state = 0;    
  
void draw() 
{  
  background (random (0,255)); 
 fill(0);
    
// Beweging  
noStroke();  

fill(299,9,251,60);  
ellipse(x,y,50,50); //hoofdje
ellipse(x,y+50,50,80); //buikje
ellipse(x-25,y+40,50,20); // arm links
ellipse(x+25,y+40,50,20); // arm rechts
ellipse(x-15,y+100,20,50); // been links
ellipse(x+15,y+100,20,50); // been rechts

fill(0,255,0,98);
ellipse(x,y+50,10,80); // ruggengraat verticaal
ellipse(x,y+40,100,10); // ruggengraat horizontaal
ellipse(x,y-10,50,10); //

fill(0,0,0,95);
ellipse(x-10,y-10,5,5);
ellipse(x+10,y-10,5,5);
rect(x-10,y+7, 20,2);

if(state == 0 ) {  
  x = x + speed;  
  if (x > width-50) {  
    x = width-50;  
    state = 1;  
    }  
} else if (state == 1) {  
  y = y + speed - 2;  
  x = x - speed + 1;  
  if (x < 0) {  
   y = 175;  
   x = 0;  
   state = 2;  
  }   
} else if (state == 2) {  
    x = x + speed;  
  if (x > width-50) {  
   y = 175;  
   x = 350;  
   state = 3;  
}  
} else if (state == 3) {  
  y = y + speed - 2;  
  x = x - speed + 1;  
  if (x < 0) {  
   y = 350;  
   x = 0;  
   state = 4;  
}  
} else if (state == 4) {  
    x = x + speed;  
  if (x > width-50) {  
   y = 350;  
   x = 350;  
   state = 5;  
}  
} else if (state == 5) {  
  x = 0;  
  y = 0;  
  state = 0;  
}  
}  
  


