
String [] lineas;
PFont mifuente;
void setup () {
  size (1303,1900);
  background (1345,4003,2073);  
  mifuente = loadFont ("Didot-48.vlw");
  
  lineas = loadStrings ("texto.txt");
}

void draw (){
  textFont (mifuente);
  fill (2,21,880);
  for (int i= 0; i<lineas.length; i++){
  text (lineas [i],0,i*40 ,width,height); 
}
}


