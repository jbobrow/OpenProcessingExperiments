
String [] homes = { "Toni", "Jaume", "Pere", "Lluís", "Jordi", "Ramon" };
String [] dones = { "Laura", "Irene", "Sara", "Elisabet", "Vanessa", "Paula" };
int i;

for (i=0;i<4;i++)
//no volem dos fors, ja que no decessitem dos dimensions, simplement la mateixa, 
//però recorreguda al revés.
{ 
  int x=3-i; //busquem l'equació que ens fa l'inversa per les dones
  println ("En "+homes[i]+" està del inlof amb la "+dones[x]);
}
