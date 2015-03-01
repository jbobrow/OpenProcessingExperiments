
float px = 1;

//una vez al comienzo del programa
void setup (){
size (600,600);
//colorMode(HSB);

}

// repetidas veces durante el programa
void draw(){
px = px +1;

//background (px,0,255);
stroke(px,0,255);
fill(px,0,255);
ellipse(mouseX,mouseY,10,10);

println(px);
}
