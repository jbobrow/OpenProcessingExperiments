
float px = 1;

//una vez al comienzo del programa
void setup (){
size (600,600);
}

// repetidas veces durante el programa
void draw(){
px = px +1;

background (255,255,255);
stroke(20,200,100);
fill(20,200,100);
ellipse(px,300,10,10);

println(px);
}
