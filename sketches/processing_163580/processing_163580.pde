
//DECLARACIÓ VARIABLES

int talla, edat; //declaració de variables amb números enters.
float PI, PR, a, b; //declaració de variables amb números reals.

//ASSIGNACIÓ VARIABLES

talla = 181;
edat = 20;
PR = 50.8;
PI = talla - 100 + (edat/10) * 0.9;
a = PR - PI;
b = PI - PR;

println ("Per l'edat de "+edat+ " anys i l'alçada de "+talla+" cm el PI és "+PI+"kg");

//CÀLCULS

if (PR > PI) //Si el Pes real és superior al Pes Ideal
{
  println ("Has de menjar menys per baixar "+a+"kg i aconseguir els "+PI+"kg");
} 

else //Si el pes és igual o més petit, aleshores
{

  if (PR == PI) //Si és igual
  {
    println ("Estàs en el teu Pes Ideal, segueix menjant així!");
  }
  
  else //Si és més petit
  {
    println ("Has de menjar més per pujar "+b+"kg i aconseguir els "+PI+"kg");
  }
}
