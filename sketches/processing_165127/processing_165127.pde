
int [ ] Edat={19, 20, 20, 19, 21, 20}; //Declaració i inicialització de variables
int [ ]Talla={167, 174, 169, 173, 182, 168};
float [ ]PR={52, 73, 55, 60, 62, 70};
float [ ]PI=new float [6];
float [ ]DP=new float [6];
float Perdre, Guanyar; 
 
for (int i=0; i<6; i++)
{
    PI [i] = Talla[i]-100+(Edat[i]/10) *0.9;
println ("Per l'edat "+ Edat [i] +" anys i l'alçada de "+ Talla [i] +" centímetre el teu PI és "+ PI[i]+".");

    DP [i] = abs (PI [i] - PR [i]);
          
        Perdre = PR[i]-PI [i];
        Guanyar = PI[i]-PR [i];
     
          if (PR[i]>PI[i]) {println ("És necessari que perdis " + Perdre+ ".");}
          else         
              {if (PR [i] == PI [i]) 
                  println ("Estàs perfecte!");
          else     
                  println("T'has d'engreixar i guanyar "+ Guanyar+ ".");}
  }
