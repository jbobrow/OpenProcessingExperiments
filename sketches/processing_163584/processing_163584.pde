
int Edad,Talla;
float PI;
float Peso,Engordar,Adelgazar;

Peso=51.8;
Edad=20;
Talla=160;

PI=Talla-100+(Edad/10)*0.9;

Engordar=PI-Peso;
Adelgazar=Peso-PI;

print("Para la edad "+Edad+" y altura "+Talla+" el Peso ideal es "+PI+".");

if (Peso>PI) {println(" Por tu salud es necesario que pierdas "+Adelgazar+" kilos.");}
else {

if (Peso==PI) {println(" Estás en tu peso ideal.");}
else {println(" Es importante que ganes "+Engordar+" kilos.");}

}
