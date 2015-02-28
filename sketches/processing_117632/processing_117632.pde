
int tamano;

void setup(){
    size(300,300);
    noFill();
    stroke(255,0,0);
}

void draw(){
    background(0);
    for(int i=5; i<= 25; i = i + 10){
        ellipse(150, 150, tamano+i, tamano+i);
    }
    tamano = tamano + 1;
    if(tamano > 80){
        tamano = 1;
    }
}
