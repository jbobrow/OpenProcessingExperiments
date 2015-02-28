
PFont font;

String name1 = "Margret";
String name2 = "Mahadev";

void setup() {
size(600, 600);

font = loadFont("font.vlw");
textFont(font);

colorMode(HSB, 360, 100, 100);

background(360);
smooth();
frameRate(15);


}

void draw(){

fill(random(255), random(255), random(255), 150);

textSize(random(5, 90));
pushMatrix();
translate(random(10,250),random(10,250));

if(name1==name2){
    
    text("Poorvi pass ho gayi", random(-150,width), random(height));
    
}else{

text("Are you kidding me!!", random(-150,width), random(height));
text("Poorvi", random(-150,width), random(height));
popMatrix();
}
}

void mousePressed(){
redraw();
}
