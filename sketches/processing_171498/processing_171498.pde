
int x,y;
PFont f;
PImage miimagen;
PImage miimagen2;
boolean boton = false;
boolean boton2 = true;

void setup(){
size(400,400);

miimagen=loadImage("AYOT2.jpg");
miimagen2=loadImage("AYOT3.jpg");
f= loadFont("MarkerFelt-Thin-48.vlw");
}
void draw(){
if (key == 's'){
  boton2= true;
  boton = false;
}
if (boton2 ==true){
  background(0);
  textFont(f,36);
fill(#F20505);
text("#AyotzinapaVive",70,350);
text("#LosQueremosVivos",60,50);
text("#",20,70);
text("Y",20,100);
text("a",20,130);
text("M",20,165);
text("e",20,190);
text("C",20,225);
text("a",20,250);
text("n",20,280);
text("s",20,310);
text("e",20,340);
text("#",350,70);
text("4",350,100);
text("3",350,135);
text("C",350,170);
text("o",350,195);
text("n",350,220);
text("V",350,255);
text("i",355,290);
text("d",350,320);
text("a",350,350);
image(miimagen,120,80);
}
if(key=='a'){
boton = true;
boton2 = false;
}
if(boton == true) {
  background(0);
  
  image(miimagen2,120,100);
    textFont(f,36);
fill(#F20505);
text("#AyotzinapaVive",70,350);
text("#LosQueremosVivos",60,50);
text("#",20,70);
text("Y",20,100);
text("a",20,130);
text("M",20,165);
text("e",20,190);
text("C",20,225);
text("a",20,250);
text("n",20,280);
text("s",20,310);
text("e",20,340);
text("#",350,70);
text("4",350,100);
text("3",350,135);
text("C",350,170);
text("o",350,195);
text("n",350,220);
text("V",350,255);
text("i",355,290);
text("d",350,320);
text("a",350,350);

}

x= x+1;
y= y*1;
}


