
int anzahlKreise =4;
int faktor = 3;

//Objekte
kreisObjekt[] kreis;

void setup()
{
  size (400*faktor,200*faktor);
  background (220,220,200);
  kreis = new kreisObjekt[anzahlKreise];
  for (int i=1; i<anzahlKreise;i++)
  {
     kreis[i] = new kreisObjekt(i);
  } 
}  

void draw()
{
for (int i=1; i<anzahlKreise; i++)
  {
    kreis[i].kreisBerechnen();
    kreis[i].sinusKreisBerechnen();
    kreis[i].draw();
  }
    
}
  



