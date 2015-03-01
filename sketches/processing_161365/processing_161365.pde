
PFont a;

void setup(){
size(400,400);

String[] fontList = PFont.list();
for(int i = 0; i < fontList.length; i++){
println(i + "\t" + fontList[i]);

}

a = createFont("Veranda", 32);

}
void draw(){
  background(0);
  textFont(a, 48);
  text("Sup", mouseX, height/2);
  textFont(a, 24);
  text("Braw", mouseY, height/2+50);
}


