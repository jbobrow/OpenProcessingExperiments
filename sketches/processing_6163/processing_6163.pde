
boolean verde=false;
boolean amarillo=false;
boolean borrador=false;
boolean naranja=false;
boolean morado=false;
boolean circulo1=false;
boolean circulo2=false;
boolean borrador2=false;
boolean borrador3=false;

void setup(){
size (500,500);
background (0);
smooth();
}


void draw (){
  
  stroke(255);
  strokeWeight (1);
  fill (153,255,10);  
  ellipse (475,475,30,30);// Esquina inf. derecha = Lineas verdes
  fill (255,255,0);
  ellipse(25,475,30,30);// Esquina inf. izquierda = Lineas amarillas
  fill (255);
  ellipse (250,250,30,30);
  fill (255,0,0);
  ellipse (250,250,20,20);; // Centro = Rojo = Borrador
  fill (255,102,0);
  ellipse (25,25,30,30);// Esquina sup. izquierda = Lineas naranja
  fill (255,0,255);
  ellipse (475,25,30,30); // Esquina sup. derecha = Lineas moradas
  fill (0);
  ellipse (250,25,30,30); // Centro sup. = Circulo negro = circulo1
  stroke(0);
  strokeWeight (1);
  fill (255);
  ellipse (250,475,30,30); // Centro inf. = Circulo blanco = circulo2
  stroke(255);
  strokeWeight (1);
  fill (255);
  ellipse (25,250,30,30);
  fill (255,0,0);
  ellipse (25,250,20,20); // Horizontal izq. centro = borrador2 = lineas horizontales delgadas
   fill (255);
  ellipse (475,250,30,30);
  fill (255,0,0);
  ellipse (475,250,20,20); // Horizontal der. centro = borrador3 = lineas verticales gruesas
  
  
  
 if (verde==true){if (mousePressed){

  strokeWeight(1);
   stroke (153,255,10);
  line (pmouseX,pmouseY,250,250);// Lineas Verdes

  }} 

  
  if (amarillo==true){if (mousePressed){
     
   
    strokeWeight (1);
    stroke(255,255,0);
    line (pmouseX,pmouseY,250,250); // Lineas Amarillas
    

 }}
 
   if (borrador==true){if (mousePressed){
  
    line (pmouseX,pmouseY,mouseX,mouseY);
    
    background(0); // Borrador

   }}
   
   if (naranja==true){if(mousePressed){
     
 
    strokeWeight (1);
    stroke(255,102,0);
    line (pmouseX,pmouseY,250,250); // Lineas Naranja
  }}
  
  if (morado==true){if(mousePressed){
     
  
    strokeWeight (1);
    stroke(255,0,255);
    line (pmouseX,pmouseY,250,250); // Lineas moradas
    
  }}
  
  if (circulo1==true){if(mousePressed){
     
 
    strokeWeight (1);
    stroke(255);
    fill (0);
    ellipse (pmouseX,pmouseY,25,25); // Circulos negros
    
  }}
  
  if (circulo2==true){if(mousePressed){
     
   
    strokeWeight (1);
    stroke(0);
    fill (255);
    ellipse (pmouseX,pmouseY,25,25); // Circulos blancos
  }}
  
  if (borrador2==true){if(mousePressed){
     
  noStroke ();
    fill (0);
    ellipse (pmouseX,pmouseY,25,280); // Borrador2
  
}}

 if (borrador3==true){if(mousePressed){
     
  
  noStroke();
    fill (0);
    ellipse (pmouseX,pmouseY,100,350); // Borrador3


  
}}
 }

  void mousePressed (){
    if(((mouseX>=460)&&(mouseX<=490))&&((mouseY>=460)&&(mouseY<=490)))  
    {verde=true;
    amarillo=false;
    borrador=false;
    naranja=false;
    morado=false;
    circulo1=false;
  circulo2=false;
borrador2=false;
borrador3=false;} //Lineas Verdes

    if(((mouseX>=10)&&(mouseX<=40))&&((mouseY>=460)&&(mouseY<=490)))
{verde=false;
amarillo=true;
borrador=false;
naranja=false;
morado=false;
circulo1=false;
circulo2=false;
borrador2=false;
borrador3=false;}//Lineas Amarillas


if (((mouseX>=235)&&(mouseX<=265))&&((mouseY>=235)&&(mouseY<=265)))
{verde=false;
amarillo=false;
borrador=true;
naranja=false;
morado=false;
circulo1=false;
circulo2=false;
borrador2=false;
borrador3=false;}//Borrador

if(((mouseX>=10)&&(mouseX<=40))&&((mouseY>=10)&&(mouseY<=40)))
{verde=false;
amarillo=false;
borrador=false;
naranja=true;
morado=false;
circulo1=false;
circulo2=false;
borrador2=false;
borrador3=false;}//Lineas Naranja

if(((mouseX>=460)&&(mouseX<=490))&&((mouseY>=10)&&(mouseY<=40)))
{verde=false;
amarillo=false;
borrador=false;
naranja=false;
morado=true;
circulo1=false;
circulo2=false;
borrador2=false;
borrador3=false;}//Lineas moradas


if(((mouseX>=235)&&(mouseX<=265))&&((mouseY>=10)&&(mouseY<=40)))
{verde=false;
amarillo=false;
borrador=false;
naranja=false;
morado=false;
circulo1=true;
circulo2=false;
borrador2=false;
borrador3=false;}//Circulos negros

if(((mouseX>=235)&&(mouseX<=265))&&((mouseY>=460)&&(mouseY<=490)))
{verde=false;
amarillo=false;
borrador=false;
naranja=false;
morado=false;
circulo1=false;
circulo2=true;
borrador2=false;
borrador3=false;}//Circulos blancos

if(((mouseX>=10)&&(mouseX<=40))&&((mouseY>=235)&&(mouseY<=265)))
{verde=false;
amarillo=false;
borrador=false;
naranja=false;
morado=false;
circulo1=false;
circulo2=false;
borrador2=true;
borrador3=false;}//Borrador2

if(((mouseX>=460)&&(mouseX<=490))&&((mouseY>=235)&&(mouseY<=265)))
{verde=false;
amarillo=false;
borrador=false;
naranja=false;
morado=false;
circulo1=false;
circulo2=false;
borrador2=false;
borrador3=true;}//Borrador3


  }


