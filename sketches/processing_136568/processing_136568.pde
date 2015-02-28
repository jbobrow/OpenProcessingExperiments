
void setup(){
size(600,600);
colorMode(HSB);
}
void draw(){
for(int a=0;a<60;a++){
  for(int b=0; b<60; b++){
    //float t = dist(a**20,b*+20,mouseX, mouseY) ,50* noise ((a*mouseX,a*0.5,b*mouseY, mouseXrandom(30));
    fill(mouseX, mouseY, a*205, b*105);
    fill(mouseX *0.232,b*30,94, random(70));
    ellipse(a*12,b*15,a*12,b++*4);
  }
}
}
