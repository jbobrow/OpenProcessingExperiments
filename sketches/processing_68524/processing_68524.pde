
int a=0;

void setup(){
  size (500,100);
  
}

void draw(){
  background(0);
  
PFont miLetra;                   //enséñame todas las tipografías de la computadora

//Declara un arreglo de tipos de letras

String[] misLetras=PFont.list();

println(misLetras);




miLetra =createFont(misLetras[a], 62);
textFont(miLetra);
text("Hola Mario", 10,50);

a++;

}


