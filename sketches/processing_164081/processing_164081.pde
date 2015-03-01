
int [] edat={19,20,20,19,21,20};
int [] talla={167,174,169,173,182,168};
float [] DP=new float [6];
float [] PIdeal=new float [6];
float [] PR={100,75.8,55,60,62,70};
int i;

for (i=0; i<6; i++)
{
PIdeal[i]=talla[i]-100+(edat[i]/10)*0.9;
  println (" Per l'edat "+edat[i]+" i l'alçada "+talla[i]+" el pes ideal és "+PIdeal[i]);
DP[i]=abs(PIdeal[i]-PR[i]);
  if (PR[i]>PIdeal[i])
  { println (" ti@, gordak@ d mierda, cierra la boca ya! Pesas "+(PR[i]-PIdeal[i])+" de más ");
  }
  else 
  {
    if (PR[i]==PIdeal[i])
    { println (" lo has clavao ti@, tu peso es igualiko a la formula prfesioná ");
    }
    else
    {println (" estás toh buen@ ti@, puedes komer jamburgesas, tanki. Pesas "+(PIdeal[i]-PR[i])+" de menos");
    }
  }
}
