
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
int speed = 5; 
int state = 0; 

void setup () {
  size (500, 500);
  smooth();
  stroke(255);

  //Hier 100, vanwege de 100 vierkantjes en de 10 van de grootte van je vierkant  
  for(int i=0;i<50;i++)
  { xPosities[i] = int(random(0,10))*50;
    yPosities[i] = int(random(0,10))*50;
  }
}

void draw()
{ // achtergrond kleur van het scherm
  background(193,187,174); 
  
  //2 cirkels met random kleur
  fill(250,10,154);
  ellipse(x,y,100,100);
  fill(247,140,204);
  ellipse(x,y,50,50);

  //2 cirkels bewegen met speed 5
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
  
  // ================ interactie met de blokjes 
  // Muis naar linker scherm geen kleuren muis naar rechter scherm wel kleuren
  if (mouseX < (width/2) && mouseY < (height/2)) { 
      r = random(255);
      g = random(255);
      b = random(255);
      a = random(255);
      
  } 
  
  // 100 vierkantjes met random kleur
  for(int i=0;i<100;i++)
  { tekenVierkant(xPosities[i],yPosities[i]);
  }

}

void tekenVierkant(float x, float y)
{ fill (r,g,b,a); 
  // x, y, width, height
  rect(x+50, y+0, 100, 100);
}



//Als je een nieuwe void toevoegt moet dit altijd opnieuw. Dus tussen nieuwe haakjes. Elke void moet je sluiten.


