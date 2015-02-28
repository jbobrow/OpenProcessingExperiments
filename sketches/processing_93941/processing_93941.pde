

PFont  fuente;
float altot;
float altoa;
float altoe;
float altoi;
float altoo;
float altou;
float altob;
float altoc;
float altod;

void setup(){
  size (1000,600);
  smooth();
  fuente= loadFont("Arial-Black-48.vlw");
  altot=45;
  altoa=15;
  altoe=15;
  altoi=15;
  altoo=15;
  altou=15;
  altob=15;
  altoc=15;
  altod=15;

}

void draw () {
background (0);
textFont(fuente,altot);
text ("Confieso que...",50,100);
textFont(fuente,altoa);
text ("1  He corrido en la vía pública",50,200);
textFont(fuente,altoe);
text ("2  He hecho ruido o música en la vía pública",50,250);
textFont(fuente,altoi);
text ("3  He jugado o practicado deportes en la vía pública",50,300);
textFont(fuente,altoo);
text ("4  Me he reunido con más de 20 personas con la vía pública",50,350);
textFont(fuente,altou);
text ("5  He interrumpido el descanso de los vecinos",50,400);
textFont(fuente,altob);
text ("6  He pintado o realizado grafitis en la vía pública",50,450);
textFont(fuente,altoc);
text ("7  He mendigado",50,500);
textFont(fuente,altod);
text ("8  He impedido la libre circulación de los ciudadanos",50,550);
}

    void keyReleased() { 
   if (key =='1') {
   altoa=1+ altoa;}
   
   if (key =='2') {
   altoe=1+ altoe;}

   if (key =='3') {
   altoi=1+ altoi;}
   
    if (key =='4') {
   altoo=1+ altoo;}
   
    if (key =='5') {
   altou=1+ altou;}
   
    if (key =='6') {
   altob=1+ altob;}
   
    if (key =='7') {
   altoc=1+ altoc;}
   
   if (key =='8') {
   altod=1+ altod;}
   }
  



