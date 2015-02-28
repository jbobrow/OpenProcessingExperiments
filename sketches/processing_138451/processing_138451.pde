

String [] lineas;
PFont [] miFuente= new PFont [9] ;
int c=0;
void setup(){
  size (1080,980);
  background (4,214,232);
    for (int i = 0; i<miFuente.length; i++){
  miFuente [6] = loadFont (i+".vlw");
  textFont (miFuente[6]);
  
    }
    lineas = loadStrings ("Texto.txt");
}
void draw (){
  background (random (0));
  
  if (c<miFuente.length-1){
    c++;
  }else{
   c=0;
  } 
  textFont (miFuente[6]);
  fill (random (213), random (215), random (240));
  for (int i = 0; i<lineas.length; i++)
  {
    text (lineas [i], random (400), random (i*400), random (width), random  (height));
  }}


