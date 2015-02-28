
PFont font;
PImage img;
//string (dataset="zz")
String popup = "ZzzZ";
//definining a variable s
 int s;
   int C=40;
void setup(){
  //size
  size (675,506);
  //smoothing
    img = loadImage("_0778758044.jpg");
  smooth();
  background(img);
  //creating the font arial on float
  font = createFont("arial",250);
}
  
void draw(){



}
 
  
  //when mouse is pressed
void mousePressed(){
  //text font @ size 800 that appear
  textFont(font,100);
  //fill on click (random colors)
  fill( random(255), random(255), random(255), random(255));
  //smoothing
  smooth();
  //the string value popup word "appear"
  text(popup,random(350),random(350));
   
}


