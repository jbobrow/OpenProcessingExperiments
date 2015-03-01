
float angolo = 0;      //angolo di partenza della spirale.
float scalare = 50;    //misura raggio della spirale.
float vel = 800;       //velocità di rotazione
float offset = 300;    //centro della spirale. 

void setup() {
  size(600, 600);      //dimensioni della finestra.
  background(0);       //posto in Setup, il comando background rimane invariato.
  smooth();            //contorni uniformi.
  noFill();            //utilizzo sono il contorni.
  
}
void draw() {
   float x = offset + sin(angolo) * scalare; //funzioni per la spirale
   float y = offset + cos(angolo) * scalare; 
   
   //Provo a usare i valori Float x e Float Y anche nei colori per creare un leggero cambiamento
   stroke(0, x, y);                          
   
   arc(x, y, x/10, y/10, radians(30), radians(80));  //forme degli archi che compongono la spirale.
   stroke(x, 0, y);
   arc(y, x, x/20, y/20, radians(270), radians(360)); //le dimensioni sono relative alle variabili, modificando la forma degli archi.
   stroke(x, y, 0);
   arc(x, y, x/30, y/30, radians(50), radians(180));
   
   angolo += vel;
   if(mousePressed) {
   scalare += 0.8; //permette alla spirale di allargarsi.
   } else {
     scalare += 0.1; //modifico il valore del scalare nel caso si prema il pulsante del mouse
   }
   heptagram(); //chiamo il void del motivo a stella in centro.
}

void heptagram() {
  stroke(39, 30, 183); //gestisco i colori delle stelle
  beginShape(); //costruisco la stella blu con i vettori.
  vertex(300, 250);
  vertex(250, 310);
  vertex(325, 345);
  vertex(340, 270);
  vertex(260, 270);
  vertex(275, 345);
  vertex(350, 310);
  vertex(300, 250);
  endShape();
  
  stroke(30, 188, 47);
  beginShape(); //stella verde.
  vertex(300, 250);
  vertex(275, 345);
  vertex(340, 270);
  vertex(250, 310);
  vertex(350, 310);
  vertex(260, 270);
  vertex(325, 345);
  vertex(300, 250);
  endShape();
 
  stroke(188, 30, 20);
  beginShape(); //stella rossa.
  vertex(300, 250);
  vertex(300, 250);
  vertex(260, 270);
  vertex(250, 310);
  vertex(275, 345);
  vertex(325, 345);
  vertex(350, 310);
  vertex(340, 270);
  vertex(300, 250);
  endShape();
} //fine
  
   


 


