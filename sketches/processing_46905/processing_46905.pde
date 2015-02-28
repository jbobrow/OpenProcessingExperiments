
float[] x , y , tinta , radio ; //declaracion de los arreglos
// necesarios para dibujar los círculos: la posición -x,y-
// el color -la tinta- y el tamaño -radioint
int limite; //variable para definir el limite de los arreglos
int cantidad; //variable para contar los circulos
int zumbidon;
float radion;
void setup(){
    zumbidon =0;
size(600,600);
// INICIALIZAR LA MEMORIA
limite = 1000; //se define que la cantidad limite de circulos es de 50
cantidad = 0; //se inicia la cantidad de circulos en cero
x = new float[limite]; //declara los arreglos con 50 posiciones de memoria cada uno
y = new float[limite];
tinta = new float[limite];
radio = new float[limite];
colorMode(HSB);
noStroke();
smooth();
 fill( random(255),50 ,255 ,50 );
}
void draw(){
 colorMode(HSB);
background(240);
if( mousePressed ){ //verifica si se presionó el mouse
boolean tocoAlguno = false; //se declara esta variable para verificar si el mouse toco
// algún círculo
// VERIFICA SI SE HIZO CLICK SOBRE UN CÍRCULO YA EXISTENTE
for( int i=0 ; i<cantidad ; i++ ){ //recorre los círculos existentes
if( dist( x[i] , y[i] , mouseX , mouseY ) < radio[i] ){
 //revisa en cada círculo
// para ver si el cursor está dentro del círculo
//CAMBIAR EL ASPECTO DEL CÍRCULO SELECCIONADO
x[i] = mouseX; // entonces actualiza la posición del círculo en función del mouse
y[i] = mouseY;
tinta[i] = ( tinta[i] + 1 ) % 255; // incrementa la tinta
tocoAlguno = true; 

// fue tocado
//break; // rompe el ciclo for
}
}
//SI NO TOCÓ NINGÚN CÍRCULO
if( ! tocoAlguno && cantidad<limite ){ // si no tocó ningún círculo
// y todavía existen lugares pendientes entonces crea uno nuevo
//ALMACENAR EN MEMORIA UN NUEVO CÍRCULO
x[cantidad] = mouseX; // crea el círculo en la posicion del mouse
y[cantidad] = mouseY;
tinta[cantidad] = random(255); // le asigna una tinta al azar
radio[cantidad] = random(2,100); // le asigna un tamaño al azar
cantidad++; // incrementa la cantidad de círculos
radion = radio[cantidad] + sin( frameCount*300);
}
}
// DIBUJAR LOS CÍRCULOS ALMACENADOS EN MEMORIA
for( int i=0 ; i<cantidad ; i++ ){ // recorre cada círculo creado para dibujarlo
fill( tinta[i] , 255 , 255 , 150 );
ellipse( x[i] , y[i] , radio[i]*PI , radio[i]*PI);// pone la variable en "true" para especificar que un círculo



}
}

