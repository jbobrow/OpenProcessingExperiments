
/*Càlcul del pes ideal segons la fórmula de Perroult*/

/*Declaració de variables*/

int [] Edat= {19,20,20,19,21,20}; //Declaració + inicialització
int [] Talla= {167,174,169,173,182,168};
float [] Pes= {52,73,55,60,62,70};

float [] PE= new float [6];
float [] DP= new float [6];

int i;



/*Càlculs*/

for (i=0 ; i<6 ; i++)

 {
PE [i]=Talla[i]-100+(Edat[i]/10)*0.9;
 print(i+ "Per l'edat de "+ Edat[i] + " anys i l'alçada de "+ Talla[i] + " cm, el teu Pi és "+ PE[i] + " per tan,");

    
DP [i]=abs(PE[i]-Pes[i]);

 if ( Pes[i] > PE[i] ) {println(" t'has d'aprimar " +DP[i]+ " kg");}
   
    else { //Aleshores Pes<=PI;
    
        if(Pes[i]==PE[i]) {println(" estàs bé de pes");}
        else {println(" t'has d'engraixar "+ DP[i]+ " kg");}
          };
 
 
 };
