
//*Càlcul del pes idel de la fórmula de Perroult */


int Talla, Edat; //Declaració de variable
float PI, Pes;

Talla = 163; //Inicialitzar la variable
Edat = 20;
Pes = 64.8;


PI = Talla - 100 + (Edat/10)*0.9;

print( "Per l'edat de "+ Edat + " anys i l'alçada de "+ Talla + " cm, el teu Pi és "+ PI + " per tan,"); //Print escriu i no salta de línea


if ( Pes > PI ) {println(" t'has d'aprimar ");}
    else { //Aleshores Pes<=PI;
        if(Pes==PI) {println(" estàs bé de pes");}
        else {println(" t'has d'engraixar");}
    }
