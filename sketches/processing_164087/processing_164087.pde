
int [] Edat={19,20,20,19,21,20};
int [] Talla={167,174,187,156,198,167};
float [] PR={52,74,55,60,62,70};
float [] PA=new float [6];
float [] DP=new float [6];
int i;
for (i=0; i<6 ; i++)
    {
     PA[i]=Talla[i]-100+(Edat[i]/10)*0.9;
     println("Per l'edat "+ Edat[i] +" i alçada "+Talla[i]+" el pes ideal es "+ PA[i] +"Kg"); 
     
     DP[i]=abs(PA[i]-PR[i]);
      if (PR[i] < PA[i]) 
     println("T'has d'engreixar " + DP[i] + "kg");
    
else {
      
      if (PR[i] > PA[i]) {println("t'has d'aprimar " + DP[i] +"kg");}
      else { println("Ja estàs bé"); }
}
    }

