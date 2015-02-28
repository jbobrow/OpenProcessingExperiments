
sunPac sunPac;
color [] workingColors1 = new color[4];

void setup(){
size(512,160);
pasarColores();
sunPac = new sunPac(workingColors1);

}

void draw(){
background(0);
frameRate(8);
sunPac.dibujar(width/2,height/2,30);
sunPac.grow();

}


void pasarColores(){
workingColors1[0] = color(#AA0000);
workingColors1[1] = color(#FF0000);
workingColors1[2] = color(#BB0000);
workingColors1[3] = color(#CC0000);
}

