
// Koog's 4.0

float x = 200;
float y = 200;

float eyeR;
float eyeG;
float eyeB;


float xspeed =3;
float yspeed =1;

void setup() {
  //Configura el tamaño de la ventana
size(400, 400); 

smooth();
}

void draw() {

  // Cambia la ubicacion de zoog
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width) || (x <0)) {  // con el if y el OR se determina si Zoog ha llegado al limite izq o derecho y cuando
                                // se multiplica por -1 se cambia la direccion
    xspeed = xspeed *-1;
  }
  
  if ((y >height) || ( y < 0 )) {
     yspeed = yspeed *-1;
  }
  
  // Dibuja un fondo gris
background(150);  
// Configura las elipses y los rectangulos para que se dibujen desde el CENTRO
ellipseMode(CENTER);
rectMode(CENTER); 
noStroke();
// Draw Koog's body
strokeWeight(2);
stroke(0);
fill(100, 100, 150);
rect(x, y, 20, 50);
fill(150, 0, 200);
rect(x,y+36, 20, 28);

// Koog's Arms
strokeWeight(4);
noFill();
curve(x-50,y-30, x-30,y+20,x-10,y,x-29,y-39);
curve(x+80,y-60,x+30,y+20, x+10,y,x,y-40);


// Draw Koog's head
strokeWeight(2);   // Thicker
fill(235, 150, 50);
ellipse(x,y-30, 60, 60);

// Draw Koog's eyes
eyeR = random(255);
eyeG = random(255);
eyeB = random(255);
fill(eyeR,eyeG,eyeB); 
ellipse(x-18, y-30, 15, 22);
fill(eyeR,eyeG,eyeB);
ellipse(x+18,y-30, 16, 28);


// Draw Koog's legs
strokeWeight(5);
stroke(0);
line(x-10,y+50,x-10,y+61);
line(x+10,y+50,x+10,y+60);

}


