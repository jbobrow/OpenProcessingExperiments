
//calculo del peso ideal según la formula de perroult
int Talla,Edad;
float PI,Engord,Adelg,Peso;

//asignaciones
Talla=176;
Edad=36;
Peso=75;
 PI=Talla-100+(Edad/10)*0.9;
Engord=PI-Peso;
Adelg=Peso-PI;


println("El individuo número 4 tiene "+Edad+" ,pesa "+Peso+" y mide "+Talla+" por tanto su P.I es "+PI+" ");

if (Peso>PI) {println("Has de adelgazar "+Adelg);}
else {
if (Peso==PI) {println("¡Estas genial!");}
else  {println("Debes engordar "+Engord);}
}
