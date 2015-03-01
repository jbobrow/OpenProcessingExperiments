
int Edad, Talla;
float PI, Peso, Kg;

Edad = 20;
Talla = 157;
Peso = 58.8;
PI = Talla - 100 + (Edad/10)*0.9;
Kg = abs (PI - Peso);

println("Para la edad de "+ Edad + " años y la altura de "+Talla+" cm, tu peso ideal es de "+PI+" kg.");

if (Peso > PI) {
  println("Tienes que adelgazar "+ Kg+" Kg.");}
  
else { 
  if (Peso == PI) {
    println("¡tu peso es ideal!");}
    else {
      println("Tienes que ganar "+ Kg+" Kg.");}
}



