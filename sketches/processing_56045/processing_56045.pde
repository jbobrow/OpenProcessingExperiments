
int activeScreen;
PFont font1; //Variabel typsnitt 1
PFont font2;//Variabel typsnitt 2
PImage uplip;//Variabel bild 1
PImage downlip;//Variabel bild 2

void setup() {
size(350,350);
background(255);
activeScreen =1;
uplip = loadImage("lip1.png");//Läs in bildfil
downlip = loadImage("lip2.png");//Läs in bildfil 
font1 = loadFont ("AngsanaNew-48.vlw");//Läs in font 1
font2 = loadFont ("Verdana-10.vlw");//Läs in font 2
}

void draw() {
image(uplip, 100,24);//Överläpp-bild
image(downlip, 100, 120);//Underläpp-bild
fill(0);//Textfärg
textFont(font1);//Använd font1 för text
text("FEED ME", 10, 300);//Texten feed me
textFont(font2);//Använd font2 för text
text("Använd musen och klicka för att mata mig", 10, 315);//Texten Använd musen och klicka för att mata mig
text("Tryck på valfri tangent för att byta godis", 10, 325);//Texten Tryck på valfri tangent för att byta godis


  if (activeScreen == 1) {
    if (mousePressed){
stroke(0);
  fill(random(256), random(256), random(256));//Variera färg
  ellipseMode(CENTER);
  ellipse (mouseX,mouseY,16,16);//Rita godisen efter musens X och Y pos. Mått 16x16
}//Om Screen1, ge färglada godisar

}else if (activeScreen == 2){
  if (mousePressed){
    fill(93,64,34);//Chokladfärg
rectMode(CENTER);
rect(mouseX,mouseY,17,29);//Rita chokladen efter musens X och Y pos. Mått 17x29
  }}}//Om Screen2, ge choklad

void keyPressed(){//Vid tangenttryck, byt godis.
  if(activeScreen == 1){
    activeScreen =2;

}else if(activeScreen ==2){
  activeScreen = 1; 
}}


