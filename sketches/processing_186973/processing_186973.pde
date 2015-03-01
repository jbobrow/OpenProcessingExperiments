
/* @pjs preload="sfondo.jpg",1_accessori.png,1_accessori2.png,1_accessori3.png,1_corpo.png,1_corpo2.png,1_corpo3.png,
1_faccia.png,1_faccia2.png,1_faccia3.png,2_accessori.png,2_accessori2.png,2_accessori3.png,2_corpo.png,2_corpo2.png,
2_corpo3.png,2_faccia.png,2_faccia2.png,2_faccia3.png,3_accessori.png,3_accessori2.png,3_accessori3.png,3_corpo.png,
3_corpo2.png,3_corpo3.png,3_faccia.png,3_faccia2.png,3_faccia3.png,4_accessori.png,4_accessori2.png,4_accessori3.png,
4_corpo.png,4_corpo2.png,4_corpo3.png,4_faccia.png,4_faccia2.png,4_faccia3.png,5_accessori.png,5_accessori2.png,
5_accessori3.png,5_corpo.png,5_corpo2.png,5_corpo3.png,5_faccia.png,5_faccia2.png,5_faccia3.png,6_accessori.png,
6_accessori2.png,6_accessori3.png,6_corpo.png,6_corpo2.png,6_corpo3.png,6_faccia.png,6_faccia2.png,6_faccia3.png; */


String[] nomi = {"1", "2", "3",
                 "4", "5", "6"};
int scena=1;                 
                 
//scena1
PImage Sfondo;
                 
//scena 2
PImage[] faccia = new PImage[nomi.length];               
PImage[] corpo = new PImage[nomi.length];              
PImage[] accessori = new PImage[nomi.length];

//scena3
PImage[] faccia2 = new PImage[nomi.length];              
PImage[] corpo2 = new PImage[nomi.length];             
PImage[] accessori2 = new PImage[nomi.length];

//scena4
PImage[] faccia3 = new PImage[nomi.length];               
PImage[] corpo3 = new PImage[nomi.length];              
PImage[] accessori3 = new PImage[nomi.length];


void setup()                                         
{
  size(600,700);
  frameRate(0.5);                                       
  draw();                                           
 
  //scena2
  
  for (int i=0; i<nomi.length; ++i) {                 
    faccia[i] = loadImage( nomi[i] + "_faccia.png" );  
    corpo[i] = loadImage( nomi[i] + "_corpo.png" );  
    accessori[i] = loadImage( nomi[i] + "_accessori.png" );
  }
  
  //scena3
  
  for (int i=0; i<nomi.length; ++i) {                 
    faccia2[i] = loadImage( nomi[i] + "_faccia2.png" );  
    corpo2[i] = loadImage( nomi[i] + "_corpo2.png" );  
    accessori2[i] = loadImage( nomi[i] + "_accessori2.png" );
  }
  
  //scena4
  
  for (int i=0; i<nomi.length; ++i) {                 
    faccia3[i] = loadImage( nomi[i] + "_faccia3.png" );   
    corpo3[i] = loadImage( nomi[i] + "_corpo3.png" );  
    accessori3[i] = loadImage( nomi[i] + "_accessori3.png" );
  }   
}



void draw()                                                                    
{
  
  if (scena == 1) {
    
    Sfondo = loadImage("sfondo.jpg");
    image(Sfondo, 0, 0);
      
  } else if (scena == 2) {
    
  background(random(230,255),random(230,255),random(230,255));  

  int iAccessori = floor( random(nomi.length) );          
  image( accessori[iAccessori], 0, 70 );    

  int iCorpo = floor( random(nomi.length) );          
  image( corpo[iCorpo], 0, 70 );                     
  
  int iFaccia = floor( random(nomi.length) );          
  image( faccia[iFaccia], 0, 70 ); 

  }else if (scena == 3) {
  
  background(random(230,255),random(230,255),random(230,255));  

  int iCorpo2 = floor( random(nomi.length) );          
  image( corpo2[iCorpo2], 0, 70 );                     
  
  int iAccessori2 = floor( random(nomi.length) );          
  image( accessori2[iAccessori2], 0, 70 ); 
  
  int iFaccia2 = floor( random(nomi.length) );          
  image( faccia2[iFaccia2], 0, 70 );   

  } else {
  
  background(random(230,255),random(230,255),random(230,255));
  
  int iAccessori3 = floor( random(nomi.length) );          
  image( accessori3[iAccessori3], 0, 70 );   
     
  int iCorpo3 = floor( random(nomi.length) );          
  image( corpo3[iCorpo3], 0, 70 );                     
  
  int iFaccia3 = floor( random(nomi.length) );          
  image( faccia3[iFaccia3], 0, 70 );     
  }
}


void mousePressed() {
  if (scena < 4) {
     scena = scena+1;   
  } else {
     scena = 1;   
  }
}


