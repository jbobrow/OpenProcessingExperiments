
int Edad, Talla;
float PI, KG, Peso;

Edad = 20;
Talla = 164;
Peso = 65.8;

PI = Talla - 100 + (Edad/10) * 0.9;
KG = abs (PI - Peso);

println("Para la edad "+Edad+" y altura "+Talla+" el peso ideal es "+PI);

if (PI>Peso) {
  println("T'has d'engreixar "+KG);
}

else {
  if (Peso == PI) {
    println("Estás perfecta");
  }
  else {
    println("T'has d'aprimar "+KG);
  }
}
