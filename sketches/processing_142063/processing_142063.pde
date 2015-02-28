
int korszam=5;

void setup()
{
  size(512,512);
background (0);
frameRate(6);
strokeWeight (18);
}


void draw()
{
 int kormeret =width/korszam;
 int i=0;
 int j=0;
 int szin1=mouseX/4+95;
 int szin2=mouseY/4+95;
 stroke (0,szin1,szin2);

 
 
 fill (szin2,szin1,0);
background (0, szin2, szin1);
 
 for( j=0;j<korszam;j++){
 
 for( i=0;i<korszam;i++){

  int x=kormeret/2+i*kormeret;
  int y=kormeret/2+j*kormeret;

    
   ellipse(x,y,kormeret,kormeret);
 }
 }
 
 
 //ellipse (width/2, height/2, kormeret, kormeret);
}//
  
  

