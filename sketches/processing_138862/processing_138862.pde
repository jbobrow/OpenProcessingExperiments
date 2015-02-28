
String []lineas;
PFont[]mifuente = new PFont [5];
int c = 0; 
void setup () {
  size(600, 500);
  for (int i = 0; i<mifuente.length; i++) {

    mifuente[i]=loadFont(i+".vlw");
  }


  lineas=loadStrings("poema.txt");
}
void draw() {
  fill(random(225), random(225), 90);
  background(0);
  if(c<mifuente.length-1){
    c++;
  }else{
    c=0;
  }
  textFont(mifuente[c]);
  for (int i = 0; i<lineas.length; i++) {
    text(lineas[i],random(1000), random (300),random(1000),random(500));
  }
}


