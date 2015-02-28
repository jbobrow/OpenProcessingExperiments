
PFont font;
//string (dataset="popup")
String popup = "Appear";
//definining a variable s
 int s;
  
void setup(){
  //size
  size (400,350);
  //smoothing
  smooth();
  //background
  background(0);
  //creating the font arial on float
  font = createFont("arial",250);
}
 
void draw(){
  s = s + 1;
   // (rotate line variable s)
rotate(radians(s));
//line -x -y -x -y for all height
line(-height, -height, height, height);

}

 
  //when mouse is pressed
void mousePressed(){
  //text font @ size 800 that appear
  textFont(font,800);
  //fill on click (random colors)
  fill( random(255), random(255), random(255), random(255));
  //smoothing
  smooth();
  //the string value popup word "appear"
  text(popup,random(350),random(350));
  
}

