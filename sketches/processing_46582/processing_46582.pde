
PImage piramide1;
PImage piramideesfera1;
PImage esfera1;
PImage esferaylinea1;

PImage piramide;
PImage piramideesfera;
PImage esfera;
PImage esferaylinea;
PImage luz;
PFont font;
 

 
void setup (){
size (900,650);
 
smooth();
noStroke();
font = loadFont ("Chiller-Regular-48.vlw");

 
luz = loadImage("luz.JPG");  
piramide1 = loadImage("piramide1.jpg");
piramideesfera1 = loadImage("piramideesfera1.jpg");
esferaylinea1 = loadImage("esferaylinea1.jpg");
esfera1 = loadImage("esfera1.jpg");
 

piramide = loadImage("piramide.jpg");
piramideesfera = loadImage("piramideesfera.jpg");
esferaylinea = loadImage("esferaylinea.jpg");
esfera = loadImage("esfera.jpg"); 


}
 
void draw (){
background(0);
image (luz,340,220,350,270);

  image (esferaylinea,90,55);
 image (piramide,90,385);
 image (piramideesfera,690,55);
 image (esfera,710,400);
text("Portal", 450,400); 

if (mouseX >= 50 && mouseX <= 200 && mouseY >= 0 &&  mouseY <= 200){
  image (esferaylinea1,275,140);
}
if (mouseX >= 650 && mouseX <= 900 && mouseY >= 0 &&  mouseY <= 200){
  image (piramideesfera1,275,140);
}
if (mouseX >= 50 && mouseX <=200 && mouseY >= 400 &&  mouseY <= 600){
  image (piramide1,275,140);
}
if (mouseX >= 650 && mouseX <= 900 && mouseY >= 450 &&  mouseY <= 650){
  image (esfera1,275,140);
}

 
fill(255);//

textFont(font);   
textAlign(CENTER);
text("esferaylinea",150,200);
text("piramide",150,550);
text("piramideesfera",755,200);
text("esfera",755,550);
  

}



