
int option = 1;
void setup() {
size(400, 500);
smooth();
noFill();

}


void draw() {
background(0);
if (option == 1) {

// Option 1: Stitches
size(400,500);
for (int i=1; i < height; i+=3) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(248,255,70);
  line(60, i, 370, i);
  
}
for (int i=3; i < height; i+=4) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(248,255,70);
 line(30, i, 180, i);
  
}

}

else if (option == 2) {

// Option 2: Perspective

size(400,500);
for (int i=3; i < height; i+=4) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(165,255,70);
  line(60, i, 370, i);
  
}
for (int i=5; i < height; i+=6) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(165,255,70);
 line(30, i, 150, i);
  
}

}

else if (option == 3) {

// Option 3: Overlapping circles

size(400,500);
for (int i=5; i < height; i+=6) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(70,255,133);
  line(60, i, 370, i);
  
}
for (int i=7; i < height; i+=8) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(70,255,133);
 line(30, i, 140, i);
  
}

}

else if (option == 4) {

// Option 4: Rotating arcs

size(400,500);
for (int i=7; i < height; i+=8) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(70,255,210);
  line(60, i, 370, i);
  
}
for (int i=9; i < height; i+=10) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(70,255,210);
 line(30, i, 130, i);
  
}

}

else if (option == 5) {

size(400,500);
for (int i=9; i < height; i+=10) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(67,150,170);
  line(60, i, 370, i);
  
}
for (int i=11; i < height; i+=12) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(67,150,170);
 line(30, i, 120, i);
  
}
}

else if (option == 6) {

size(400,500);
for (int i=11; i < height; i+=12) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(54,121,137);
  line(60, i, 370, i);
  
}
for (int i=13; i < height; i+=14) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(54,121,137);
 line(30, i, 120, i);
  
}
}

else if (option == 7) {

size(400,500);
for (int i=13; i < height; i+=14) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(38,86,98);
  line(60, i, 370, i);
  
}
for (int i=15; i < height; i+=16) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(38,86,98);
 line(30, i, 120, i);
  
}
}



else if (option == 8) {

size(400,500);
for (int i=15; i < height; i+=16) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(27,63,72);
  line(60, i, 370, i);
  
}
for (int i=17; i < height; i+=18) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(27,63,72);
 line(30, i, 120, i);
  
}
}


else if (option == 9) {

size(400,500);
for (int i=17; i < height; i+=18) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(19,43,49);
  line(60, i, 370, i);
  
}
for (int i=19; i < height; i+=20) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(19,43,49);
 line(30, i, 120, i);
  
}
}

else if (option == 9) {

size(400,500);
for (int i=17; i < height; i+=18) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

 stroke(13,32,36);
  line(60, i, 370, i);
  
}
for (int i=19; i < height; i+=20) { //for es para y se utiliza para un siclo
//es donde se define la instrucción 
//en este caso para la variable 

stroke(13,32,36);
 line(30, i, 120, i);
  
}
}


}




void mousePressed() {

option++;

if (option > 10) option = 1;

}
