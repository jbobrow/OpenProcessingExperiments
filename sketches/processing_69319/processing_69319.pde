
//CREAR UN SKETCH QUE ESCRIBA SU NOMBRE CON TODOS LOS TIPOS DE LETRA QUE TENGA LA COMPUTADORA
//UNO A LA VES
int letra=0;
void setup(){
  size (500,90);
}


void draw(){
  background (0);
PFont miLetra;
//println (PFont.list());

size (500,100);

//Declara un arreglo de tipos de letras 
String[] misLetras = PFont.list();

println(misLetras);

miLetra= createFont(misLetras[letra],50);

textFont(miLetra);
text ("FernandaReygadas", 10,50);

letra++;

//Para tener una tipografía aleatoria usamos INT antes antes de random. 

}
