
int wysokoscOkna   =  400;
int szerokoscOkna  =  400;

int pozycjaXstatku=szerokoscOkna/2;
int wysokoscstatku=20;

int pozycjaXpocisku=pozycjaXstatku;
///int pozycjaXpocisku=mouseY;
int pozycjaYpocisku=0;

int pozycjaXlatawca=szerokoscOkna/2;
int pozycjaYlatawca=110;
int pozycjaXlatawcaZmiana=2;
int szerokoscLatawca=50;
int wysokoscLatawca=20;

int licznikStrzalow=0;
int licznikTrafien=0;

int licznikLevelu=1;


void setup()
{
  size (szerokoscOkna, wysokoscOkna);
  background(0);
}


void draw()
{



  background(0);

  pozycjaXstatku=mouseX;
  statek();

  if ( mousePressed & (pozycjaYpocisku <= 0) )
  {
    pozycjaYpocisku = wysokoscOkna - 40;
    pozycjaXpocisku = mouseX;
    licznikStrzalow+=1;
  }    
  pocisk();


  // latawiec - CEL 

  latawiec();
  if ( (pozycjaXlatawca<=0) || (pozycjaXlatawca>=szerokoscOkna-(szerokoscLatawca)) ) 
  {   
    pozycjaXlatawcaZmiana= -pozycjaXlatawcaZmiana;
  }
  pozycjaXlatawca+=pozycjaXlatawcaZmiana;


  // TRAFIENIE

  if ( 
  (pozycjaYpocisku <  pozycjaYlatawca)
    &
    (pozycjaYpocisku >  (pozycjaYlatawca-wysokoscLatawca) )
    &
    ( pozycjaXpocisku > pozycjaXlatawca )
    &
    (pozycjaXlatawca+szerokoscLatawca) > pozycjaXpocisku )
  {

    pozycjaXlatawca=( int (random(szerokoscOkna/2)));
    pozycjaYpocisku = 0;
    licznikTrafien+=1;

    if ( (licznikTrafien % 4) == 0 ) {
      pozycjaXlatawcaZmiana+= (pozycjaXlatawcaZmiana/(abs(pozycjaXlatawcaZmiana)))*2; 
      licznikLevelu+=1;
    }
  }



  pushMatrix();
  fill (255);
  textSize(12);
  text(licznikStrzalow, 10, 20);
  text(licznikTrafien, 40, 20);
  text("level: ", szerokoscOkna-60, 20);
  text(licznikLevelu, szerokoscOkna-20, 20);
  popMatrix();
  pushMatrix(); 
  if (licznikLevelu>=10) { 
    textSize(16); 
    text("WOOOOOHOOO!!!", szerokoscOkna/3, wysokoscOkna/5);
  }  
  popMatrix();
}

// ******************************************
// ******************************************
// ******************************************


void statek()
{
  triangle(
  pozycjaXstatku-20, height-5, 
  pozycjaXstatku+20, height-5, 
  pozycjaXstatku, height-30);
}

void pocisk()
{
  pozycjaYpocisku-=7;
  rect(pozycjaXpocisku, pozycjaYpocisku, 2, 12);
}


void latawiec()
{
  rect(pozycjaXlatawca, pozycjaYlatawca, szerokoscLatawca, wysokoscLatawca);
}

