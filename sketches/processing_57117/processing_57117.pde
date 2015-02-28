
int option = 1;

void setup() {

size(400, 400);

smooth();



}



void draw() {

background(142,193,183);



if (option == 1) {

// Option 1: Stitches

for (int i=0; // se declara la variable, con valor 0
    i< width;
    i+=25) { // se le asigna la variable 25
    
    for (int j=0;
    j<height; //cuenta hasta que se tranforme en el alto
    j+=25) {
    
    fill (i,j,100); // colores
    ellipse (i+11,j+11,20,20);
    
    }
 }

} 

else if (option == 2) {

// Option 2: Perspective

for (int i=0; // se declara la variable, con valor 0
    i< width;
    i+=25) { // se le asigna la variable 25
    
    for (int j=0;
    j<height; //cuenta hasta que se tranforme en el alto
    j+=25) {
    
    fill (i,j,100); // colores
    ellipse (i+12,j+12,30,30);
    
    }
 }

} 

else if (option == 3) {

// Option 3: Overlapping circles

for (int i=0; // se declara la variable, con valor 0
    i< width;
    i+=25) { // se le asigna la variable 25
    
    for (int j=0;
    j<height; //cuenta hasta que se tranforme en el alto
    j+=25) {
    
    fill (i,j,100); // colores
    ellipse (i+20,j+20,60,60);
    
    }
 }

} 

else if (option == 4) {

// Option 4: Rotating arcs

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

fill (x,y,100); // colores
  
ellipse(x, y, 50, 50);

}

}


} 

else if (option == 5) {

// Option 5: Groups of fiv
for (int x = 80; x <= width-80; x += 30) {

for (int y = 80; y <= height-80; y+=30) {

fill (y,x,100); // colores
  
ellipse(x, y, 50, 50);

}

}
}


else if (option == 6) {
  
for (int x = 140; x <= width-140; x += 40) {

for (int y = 140; y <= height-140; y+=40) {

fill (x,y,100); // colores
  
ellipse(x, y, 50, 50);

}

}

}



else if (option == 7) {
  
for (int x = 160; x <= width-160; x += 50) {

for (int y = 160; y <= height-160; y+=50) {

fill (206,199,158); // colores
  
ellipse(x, y, 50, 50);

}

}

}


else if (option == 8) {
  
for (int x = 130; x <= width-130; x += 50) {

for (int y = 130; y <= height-130; y+=50) {

fill (x,y,600); // colores
  
ellipse(x, y, 50, 50);

}

}

}


else if (option == 9) {
  
for (int x = 100; x <= width-100; x += 50) {

for (int y = 100; y <= height-100; y+=50) {

fill (y,x,600); // colores
  
ellipse(x, y, 50, 50);

}

}

}
else if (option == 10) {

for (int i=0; // se declara la variable, con valor 0
    i< width;
    i+=25) { // se le asigna la variable 25
    
    for (int j=0;
    j<height; //cuenta hasta que se tranforme en el alto
    j+=25) {
    
    fill (i,j,600); // colores
    ellipse (i+11,j+11,20,20);
    
    }
 }

}
}

void mousePressed() {

option++;

if (option > 10) option = 1;

}
