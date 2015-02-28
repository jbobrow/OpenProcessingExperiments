
String estado = "pregunta";
int num1, num2;

int resultado;
int propuesta;

int cont = 0;
int bien = 0;
int mal = 0;

void setup() {
}

void draw() {

  if ( estado.equals( "pregunta" ) ) {
    num1 = int( random( 10000 ) ) % 8 + 2;
    num2 = int( random( 10000 ) ) % 8 + 2;
    resultado = num1 * num2;
    propuesta = 0;
    println( "\n¿cuánto es "+num1+" por "+num2+"?" );
    estado = "respuesta";
    cont++;
  }
}
void keyPressed() {
  if ( estado.equals( "respuesta" ) ) {
    if ( key == ENTER || key == RETURN ) {
      if( propuesta == resultado ){
        print( " MUY BIEN !!! " );
        bien++;
      }else{
        print( " mmm.... mal :-( " );
        mal++;
      }
      println(    "-->"+bien+" bien   | "+mal+" mal de "+cont+". PUNTAJE="+int((bien*1.0/cont*100)) );
      estado = "pregunta";
    }
    else {
      if ( key >= '0' && key <= '9' ) {
        propuesta *= 10;
        propuesta += key-48;
      }
      else if ( key == BACKSPACE ) {
        propuesta = int( propuesta / 10 );
      }
      println( ">"+propuesta );
    }
  }
}

