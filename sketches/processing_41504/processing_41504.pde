
PFont font;
PFont fontArial;
String headStr ="Battaglia relatività-neutrini, per ora Einstein resiste";
String textStr = "Einstein resta saldo sul piedistallo nonostante la pioggia di neutrini. Due settimane dopo l'annuncio dell'esperimento 1 che ha osservato i neutrini più veloci della luce, oltre 70 studi scientifici sono stati pubblicati per tentare di demolire la misurazione, oppure di rivedere la teoria della relatività. E anche questo è un record di velocità. ";

int x;
int y;

void setup() {
 size (400,400); 
 noStroke();
 
  background( 250);
  fill( 0);

 font = loadFont ("Courier-30.vlw");
 
 textFont(font);
 
 textSize(18);

 text (headStr, 20,80, 370,100);
 
 
 textSize (12);
 textLeading (16);
 text (textStr, 20,140, 300,300);
 
 textSize(10);
 text( "La Repubblica", 20,340);
 
  fontArial = loadFont ("ArialNarrow-20.vlw");
   textFont(fontArial);
    fill( 57,7,7);
   text ( ">>HIGHLIGHT TEXT WITH MOUSE PRESS<<" , 20,20);
}

void draw(){

 
 
 
  

}

void mousePressed (){
 
      x= mouseX;
  y=mouseY;
println(x);
}

void mouseDragged (){

     
 
  background( 250);
  fill( 0);


 
 textFont(font);
 
 textSize(18);

 text (headStr, 20,80, 370,100);
 
 
 textSize (12);
 textLeading (16);
 text (textStr, 20,140, 300,300);
 
 textSize(10);
 text( "La Repubblica", 20,340);
 

   textFont(fontArial);
   
   fill( 57,7,7);
   text ( ">>HIGHLIGHT TEXT WITH MOUSE PRESS<<" , 20, 20); 
     
    fill(255,210,0,50 );
    rect( x,y, mouseX-x,20);
  
}

void mouseReleased(){

 fill(255,210,0, 50 );
    rect( x,y, mouseX-x,20);
  
}

