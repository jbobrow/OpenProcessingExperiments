

PFont f;
String typing = "";
String saved = "";


void setup() {
  size(800, 600);
  f = createFont("Arial", 16, true);
}

void draw() {
  background(255);
  int indent = 25;
  textFont(f);
  fill(0);

  text("\nPresiona 0 para guardar. Haga click al finalizar para sacudir el texto ", indent, 40);
  text(typing, indent, 90);
  text(saved, indent, 130);
  if(mousePressed){
   background(255);
    String[] cargar = loadStrings("lal.txt");
  
  println("there are " + cargar.length + " lines");
for (int i = 0 ; i < cargar.length; i++) {
  println(cargar[i]);
  textMode(SHAPE);
  textSize(20);
  text(cargar[i],300+random(200),100+10*i);
  textAlign(CENTER, CENTER);
}}
}

void keyPressed() {
  if (key == '0' ) {
    saved = typing;
    typing = ""; 
    String[] data = split(saved, ' ');
    saveStrings("data/lal.txt", data);
  } else {
    typing = typing + key;
  }
}
void cargar() {
if (mousePressed){
  background(255);
 String[] t = loadStrings("lal.txt");
  text(t[0],100,100);
  }
}




