
// Opdracht 1 (Heel veel ....)
// Barbara Kamphuis
// ECP1a

//100, omdat je 100 vierkantjes wilt hebben
int [] xPosities = new int[100];
int [] yPosities = new int[100];

float r;
float g;
float b;
float a;

int x = 0; 
int y = 0; 
int speed = 8; 
int state = 0; 

void setup () {
  size (1000, 1000);
  smooth();
  stroke(255);

//Hier 100, vanwege de 100 vierkantjes en de 10 van de grootte van je vierkant  
  for(int i=0;i<100;i++)
  { xPosities[i] = int(random(0,10))*100;
    yPosities[i] = int(random(0,10))*100;
  }
}

void draw()
{
  background(193,187,174);
  
  // 1 vierkantje met random kleur
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  
  fill(r,g,b,a);
  rect (0,0,100,100);
  
  //2 cirkels met random kleur
  ellipse(x,y,250,250);
  ellipse(x,y,100,100);
  
  //2 cirkels bewegen met speed 8
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
  
  //Muis naar linker scherm geen kleuren muis naar rechter scherm wel kleuren
  if (mouseX < 500 && mouseY < 500) { 
  fill (149,143,130); 
 }else if (mouseX > 500 && mouseY < 500) { 
 } 
  
  // 100 vierkantjes met random kleur
  for(int i=0;i<100;i++)
  { tekenVierkant(xPosities[i],yPosities[i]);
  }

}

void tekenVierkant(float x, float y)
{ // x, y, width, height
  rect(x+50, y+0, 100, 100);
}

//Als je een nieuwe void toevoegt moet dit altijd opnieuw. Dus tussen nieuwe haakjes. Elke void moet je sluiten.


