
/* Cálculo de peso ideal según la fórmula de Perroult */

int Talla=180, Edad=20, Peso=65;

float PI, Perder, Ganar, Ideal;
PI=Talla-100+(Edad/10)*0.9;

Perder=Peso-PI;
Ganar=PI-Peso;

print("Tengo "+Edad+" años, peso " +Peso+ " kg y mido "+Talla+" cm, mi P.I. es "+PI);

if (Peso>PI) {println (", por lo tanto debería perder " +Perder+ " kg.");}
else         {if (Peso==PI)println (", por lo tanto estás en tu peso ideal");
              else println (", por lo tanto debería ganar " +Ganar+ " kg.");}
