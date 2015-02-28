
float tono=0;


void setup() {

size (400,400);


  

}

void draw() {
background (tono,24,25);
smooth();

//pushMatrix();

// definir dibujar desde el centro
rectMode(CENTER);
translate (width/2,height/2);

// dibuja cabeza

//stroke (255, 50);
stroke(tono+ random(5), 255 +random(5), 255 + random(5),60);
strokeWeight (10*random(2));
fill(25*random(23),40,40);
ellipse (0,-60,100,100);

//dibujo cara
//popMatrix();

fill(70*random(55), 65*random(55), 85*random(55));
strokeWeight(5);
ellipse (-20,-70,15,15);
ellipse (20,-70,15,15);
fill(255,30);
strokeWeight(2);


ellipse(-20,-70,30,30);

//cuerda yoyo
line (90,6*random(12),90,3*random(0.1));

frameRate(90);
strokeWeight(20);
//dibujo cuerpo
line(0,0,0,110);
noFill();
ellipse(0,210,210,200);



//dibujo brazos
line(0,30,90,-30*random (1));
line(0,30,-90,-30*random (0.3));

//yoyo


ellipse(90,10*random(10),10,-10);


//cuadro sube baja
noStroke();
fill(tono,24,25);
rect(-100,210,120,100*random(0.8));



}



