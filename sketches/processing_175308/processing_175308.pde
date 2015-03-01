
int paleta = {
    #675168,
    #A45582,
    #F74261,
    #FFAB4A,
    #FFC334
}

void setup() {  //setup function called initially, only once
  size(600, 600);
}

void draw() {
     
}

void keyPressed(){
    generar();
}

void generar(){
    background(rcol());
}

int rcol(){
    return paleta[int(random(paleta.length))];
}
