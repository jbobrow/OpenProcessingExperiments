
PFont font;
PFont font2;
String a = "N0R";
String b = "1A0";

void setup() {
  size(250,250);
  background(120);
  smooth();
  font = createFont("",48);
  font2 = loadFont("ARBONNIE-48.vlw");
}

void draw(){
  fill(50,20);
  textFont(font,14);
  for (
  int i=10; i<250; i+=15)
  {
    text(a,i,20);
    text(a,i+20,40);    
    text(a,i+40,60);    
    text(a,i+60,80);    
    text(a,i+80,100);
    text(a,i+100,120);
    text(a,i,240);
    text(a,i+20,220);    
    text(a,i+40,200);    
    text(a,i+60,180);    
    text(a,i+80,160);
    text(a,i+100,140);
  }
  for (
  int j=215; j>-20; j-=15)
  {
    fill(205,20);
    text(b,j,25);
    text(b,j-20,45);    
    text(b,j-40,65);    
    text(b,j-60,85);    
    text(b,j-80,105);
    text(b,j-100,125);
    text(b,j,245);
    text(b,j-20,225);    
    text(b,j-40,205);    
    text(b,j-60,185);    
    text(b,j-80,165);
    text(b,j-100,145);
  }
  textFont(font2,380);
  text("N",20,250);
  text("1",110,250);
  fill(255,0,0,20);
  textFont(font2,150);
  text("0",45,140);
  text("R",50,240);
  text("A",150,140);
  text("0",140,240);
}

