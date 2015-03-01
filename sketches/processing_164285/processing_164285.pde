
//*Càlcul del pes idel de la fórmula de Perroult */
 
 
int Talla, Edat; //Declaració de variables: Edat i Talla són números enters
float PI, Pes; //Declaracio de variables: PI i Pes són números reals
 
Talla = 162; //Asignació d'un valor inicial de dades
Edat = 20;
Pes = 46.8;
 
 
PI = Talla - 100 + (Edat/10)*0.9;
 
print( "Per l'edat de "+ Edat + " anys i l'alçada de "+ Talla + " centímetres, el teu Pi és "+ PI + " kg per tan,"); //Print escriu i no salta de línea
 
 
if ( Pes > PI ) {println(" has de perdre pes. ");}
    else {                  // Si es igual o menor al PI
      if(Pes==PI) {println(" estas perfecte!");}
      else {println(" has de guanyar pes.");}
    }

