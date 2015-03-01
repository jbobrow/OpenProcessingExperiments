
//DECLARACIÓ VARIABLES + ASSIGNACIÓ VARIABLES

int i; //Declaració de variables amb números enters.
int [] talla = {
  170, 162, 150, 200, 189, 210
};
int [] edat = {
  20, 23, 18, 17, 22, 20
};

float [] PR = {
  52, 73, 55, 60, 64, 89
};


float [] PI = new float [6]; //declaració del array de reals PI, de 6 posicions.
float [] DP = new float [6];


//CÀLCULS

for (i=0; i<6; i++) //obrim el bucle que servirà fins que arribi al valor 6è de i
{

  PI [i] = talla [i] - 100 + (edat[i]/10) * 0.9;
  println ("Per l'edat "+edat[i]+" i l'altura "+talla[i]+" el pes ideal és "+PI[i]);

  DP [i] = abs (PI[i] - PR[i]);


if (PR[i] > PI[i]) //Si el Pes real és superior al Pes Ideal
{
  println ("Has de menjar menys per baixar "+DP[i]+"kg per aconseguir els "+PI[i]+"kg ideals");
} 

else //Si el pes és igual o més petit, aleshores
{

  if (PR [i] == PI [i]) //Si és igual
  {
    println ("Estàs en el teu Pes Ideal, segueix menjant així!");
  }
  
  else //Si és més petit
  {
    println ("Has de menjar més per pujar "+DP[i]+"kg per aconseguir els "+PI[i]+"kg ideals");
  }
}

}

