
String input = "";
int tamany = 20;

float bx; 
float by;

void setup(){
  size(320, 240);
  noStroke();
  background(129);
  bx = width/2.0;
  by = height/2.0;
  tamany = 0;
  rectMode(RADIUS); 
  
}

//dibuixem el quadrat
void draw(){
    fill(255);
    rect(bx, by, tamany, tamany);
}

void keyPressed(){
    println( "La tecla premuda fou: "  + char(key) );

  if( key >= '0' && key <= '9' ){
    input+=char(key);
    println( "El valor actual es: " + input );
  } 
  

  else if( key == BACKSPACE && input.length() > 0 ){
    println( "Esborrem l'ultim caracter inserit" );
    input = input.substring(  0, input.length()-1 );
    println( "El valor actual es: " + input );
  } 

else if (key == RETURN || key == ENTER){
    background(0);
    int finalInput = int( input );
    tamany= int( input);
    println( "El valor aplicat es: " + finalInput );    
    input = "";
  }
}

