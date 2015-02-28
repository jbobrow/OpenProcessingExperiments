
// DANIEL MASTRETTA // PARSONS BOOTCAMP 2013 FLATIRON - ASSIGNMENT 1

//basicos
size(1000,1000);
background(240,240,240);
noStroke();

//rectangulos
fill(250,0,0); //rojo
rect(100,100,500,500);
rect(950,700,1000,1000);

fill(250,250,0); //amarillo 
rect(0,700,100,300);
rect(600,0,350,350);

fill(0,0,255); //azul
rect(600,700,350,225);

fill(0,0,0); //negro
rect(100,600,250,250);
rect(350,850,250,70);

//LINEAS NEGRAS

stroke(0,0,0);
strokeWeight(10);
strokeCap(SQUARE);

textSize(15);
text("P M  '21", 380, 960); 

//lineas verticales
line(100,100,100,950); 
line(225,40,225,100);
line(350,600,350,960);
line(600,30,600,920);
line(950,40,950,960);
line(775,350,775,600);

//lineas horizontales
line(20,100,950,100);
line(20,350,100,350);
line(100,600,950,600);
line(20,700,1000,700);
line(100,850,600,850);
line(350,920,950,920);
line(600,350,950,350);
