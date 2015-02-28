
//El color ha sido definido como colorRect= color del rectángulo
color colorRect;
float angle;

void setup()

{

size (600,600);
background (138,252,250);
//Para que el ratón se situe en el centro del rectángulo
rectMode(CENTER);

}

void draw()

{

fill(138,252,250,75); 
// Para que la ristra del rectángulo desaparezca de forma gradual
rect(width/2, height/2, width, height);
// Para cambiar el origen del 0,0 a la posición del ratón
translate(mouseX,mouseY);
// Ángulo de rotacion del rectángulo
angle=atan2(mouseX,mouseY);
// Para que el rectángulo gire sobre si mismo// 10* para que el efecto sea más visible
rotate(10*angle);
fill(colorRect);
// Como hemos cambiado el origen de coordenadas al ratón en X y Y, lo situamos en el 0,0
rect(0,0,75,75); 

 
}

//Cuando se pincha con el ratón cambia de color el rectángulo
void mouseClicked()

{ 
  
//Se define el colorRect: para que sea un color aleatorio cada vez que se pincha con el ratón
colorRect=color(random(255),random(255), random(255));

}


