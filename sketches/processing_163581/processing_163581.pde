
int Altura, Edad; //Declaración de variables: Edad y Altura son números enteros
float PI, Peso, Perder, Ganar;  //Declaración de variables: Peso y PI son números reales

Altura = 160;  //Asignación de un valor inicial a los datos
Edad = 20; 
Peso = 49;  

PI = Altura - 100 + (Edad/10) * 0.9;  //Declaración de cálculo del PI
Perder = Peso - PI;
Ganar = PI - Peso; 

println ("Para la edad de "+ Edad +" años y la altura de "+ Altura +" centímetros el PI es "+ PI);  //println escribe y no salta línea

if (Peso > PI) {println ("Por tu salud es necesario que pierdas " + Perder);}
else           {if (Peso == PI) println ("Éstás en tu peso ideal");
           else             println ("Es importante que ganes "+ Ganar);}

