
int kuutionX = 250;
int kuutionY = 250;
int kuutionNopeus = 2;

void setup() {
size(500,500);
}

void draw () {
rect (-1,-1,501,501);  
rect (kuutionX,kuutionY,20,20);
if (mouseX >= kuutionX){
kuutionX = kuutionX + kuutionNopeus;
}
if (mouseX <= kuutionX){
kuutionX = kuutionX - kuutionNopeus;
}
if (mouseY >= kuutionY) {
kuutionY = kuutionY + kuutionNopeus;
}
if (mouseY <= kuutionY) {
kuutionY = kuutionY - kuutionNopeus;
}
}


