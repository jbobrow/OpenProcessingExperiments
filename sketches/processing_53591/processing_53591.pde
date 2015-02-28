
PImage guardia1;
PImage nuvoletta;
float posguardia, spostamentog;
float partenzag;
int ng;
int contanuvoletta;
boolean guardiacolpita = false;

Guardia guardia [];


void nemico ()
{

  
  
  guardia[i].posguardia= (guardia[i].partenzag)+guardia[i].k1-(guardia[i].spostamentog);

  
  if (guardia[i].guardiacolpita== false)
  {
     guardia[i].spostamentog+=5;
     guardia[i].posguardia= (guardia[i].partenzag)+guardia[i].k1-(guardia[i].spostamentog);
     image(guardia1,guardia[i].posguardia, 150);
     scontro ();

  }
  else 
    {     
     if (guardia[i].contanuvoletta > 20)
     {
      guardia[i].guardiacolpita = false;
      guardia[i].contanuvoletta = 0;
      image (nuvoletta, guardia[i].posguardia, 190);
      guardia[i].spostamentog=0;
      guardia[i].partenzag = random (700,1500)*(1+i); 
      guardia[i].k1=0; 
      guardia[i].posguardia= (guardia[i].partenzag);

    }
    else
    {
      guardia[i].contanuvoletta++;
      image (nuvoletta, guardia[i].posguardia, 190);
    }
    }
}


 
void guardiacolpita ()
{
 guardia[i].guardiacolpita = true;
 n2++;
}




void scontro ()
{
 if (guardia[i].posguardia < 160)
  {
   guardia[i].contanuvoletta = 130;
   guardia[i].spostamentog=0;
   guardia[i].partenzag = random (700,1500)*(1+i); 
   guardia[i].k1=0; 
   guardia[i].posguardia= (guardia[i].partenzag);
   n2--;
  }
    
}







class  Guardia
 {
   float posguardia, spostamentog, k1; 
   float partenzag;
   boolean guardiacolpita;
   int contanuvoletta;
   Guardia (float posguardia, float spostamentog, float partenzag, float k1, boolean guardiacolpita, int contanuvoletta)
   {
     this.posguardia = posguardia;
     this.spostamentog = spostamentog;
     this.partenzag= partenzag;
     this.k1=k1;
     this.guardiacolpita = guardiacolpita;
     this.contanuvoletta = contanuvoletta;
    }
  }







