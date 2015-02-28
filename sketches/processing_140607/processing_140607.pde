
float cervena, modra, zelena;
float rndCol;


void setup(){
smooth(1);
size(800,600);
background(129,120);
}

void draw(){
if(mousePressed){
  float vzdalenost = dist(mouseX,mouseY,pmouseX,pmouseY);
println(vzdalenost);
rndCol = random(0,96);
stroke(abs(cervena-rndCol),abs(modra-rndCol),abs(zelena-rndCol),vzdalenost * 8);
strokeWeight(vzdalenost);
line(mouseX,mouseY,pmouseX,pmouseY);
}
cervena += 0.5;
modra += 0.7;
zelena += 1.1;

if(cervena>255){
cervena = 0;
}
if(modra>255){
modra = 0;
}
if(zelena>255){
zelena = 0;
}

}


