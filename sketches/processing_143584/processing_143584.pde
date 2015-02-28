
PImage bild;
PImage mosaikbild;
PImage grobmosaikbild;
int counter = 0;
int modi = 1;

void setup(){
size(793,1000);
smooth();
cursor(CROSS);
bild = loadImage("Der-Strom-des-Lebens-1_H-K-Schlegel-1_Original_H1000px_rgb.png");
mosaikbild = loadImage("Der-Strom-des-Lebens-1_H-K-Schlegel-1_Mosaik_rgb.png");
grobmosaikbild = loadImage("Der-Strom-des-Lebens-1_H-K-Schlegel-1_Mosaik-grob_rgb.png");
background(255);
}

void draw(){
if(modi==4){
//background(255);
//image(bild,0,0);

//fill(bild.get(mouseX,mouseY));

for(int i = 0; i<100;i++){
int x = mouseX+int(random(-200,200));
int y = mouseY+int(random(-200,200));
fill(bild.get(x,y));
//ellipse(mouseX,mouseY,50,50);
noStroke();
ellipse(x,y,30,30);
}
}
if(modi==1){
background(255);
image(bild,0,0);
fill(bild.get(mouseX,mouseY));
float red = red(bild.get(mouseX,mouseY));
float green = green(bild.get(mouseX,mouseY));
float blue = blue(bild.get(mouseX,mouseY));

translate(25,25);
ellipse(mouseX,mouseY,50,50);
translate(15,5);
fill(255);
stroke(0);
rect(mouseX-5,mouseY-15,105,20);
fill(0);
//stroke(0);
text("R" + int(red) + "G"+int(green) + "B"+int(blue), mouseX,mouseY);
}

if(modi==2){
background(255);
image(mosaikbild,0,0);
fill(mosaikbild.get(mouseX,mouseY));
float red = red(mosaikbild.get(mouseX,mouseY));
float green = green(mosaikbild.get(mouseX,mouseY));
float blue = blue(mosaikbild.get(mouseX,mouseY));

translate(25,25);
ellipse(mouseX,mouseY,50,50);
translate(15,5);
fill(255);
stroke(0);
rect(mouseX-5,mouseY-15,105,20);
fill(0);
//stroke(0);
text("R"+int(red)+ "G"+int(green)+ "B"+int(blue), mouseX,mouseY);
}

if(modi==3){
background(255);
image(grobmosaikbild,0,0);
fill(grobmosaikbild.get(mouseX,mouseY));
float red = red(grobmosaikbild.get(mouseX,mouseY));
float green = green(grobmosaikbild.get(mouseX,mouseY));
float blue = blue(grobmosaikbild.get(mouseX,mouseY));

translate(25,25);
ellipse(mouseX,mouseY,50,50);
translate(15,5);
fill(255);
stroke(0);
rect(mouseX-5,mouseY-15,105,20);
fill(0);
//stroke(0);
text("R"+int(red)+ "G"+int(green)+ "B"+int(blue), mouseX,mouseY);
}
}

void keyPressed(){
if(key=='1'){
modi = 1;
}
if(key=='2'){
modi = 2;
}
if(key=='3'){
modi = 3;
}

if(key=='s'){
saveFrame("Bild_"+counter+".png");
counter++;
}
}


