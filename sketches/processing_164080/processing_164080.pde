
int[] Edat={19,20,20,19,21,20};
int[] Talla={167,174,169,173,182,168};
float[] PR={52,73,55,60,92,70};
float[] PA= new float[6];
float[] DP= new float[6];

for (int i=0; i<6; i++)
{
PA[i]= Talla[i]-100+(Edat[i] /10)*0.9;
DP[i]= abs(PA[i]-PR[i]);

println ("Per l'edat de "+Edat[i]+" i l'alçada "+Talla[i]+" el PI és "+ PA[i]);
if (PR[i] > PA[i]) {println ("Per la teva salut t'has d'aprimar,has de perdre "+ DP[i]);}

else         {if (PR[i] == PA[i]) {println ("El teu pes és l'ideal");}
              else {println ("Per la teva salut t'has d'engreixar, has de guanyar "+ DP[i]);}
             }
}
