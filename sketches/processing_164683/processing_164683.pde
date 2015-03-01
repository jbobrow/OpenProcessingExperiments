


String [] homes = { "Toni", "Jaume", "Pere", "Lluís"};
String [] dones = { "Laura", "Irene", "Sara", "Elisabet"};


for (int i=0, j=dones.length-1; i<homes.length; i++) //en ves de ficar un número fico length, així si vull afegir noms no haure de cambiar re, m'ho fara sol.
{  
  println ("En "+homes[i]+ " li agrada la " +dones[j]+"."); //fico homes.length-1 perque en aquest cas vull que sigui 3
}

