
PImage Title;
PImage BG;
void setup(){
  size(301,400);
  background(255);
  Title=loadImage("http://i.imgur.com/FhMFPte.png");
  BG=loadImage("http://i.imgur.com/TwZLvxf.png");
  image(Title,0,0);
  image(BG,0,101);
  image(BG,0,202);
  image(BG,0,303);
}
void draw(){
  smooth();
  BG.display();
  Title.display();
  
  if (mousePressed){
    
      //ArabicCalligraphyBrush
  if (mouseButton==LEFT){
    strokeWeight(1);
    line(mouseX,mouseY,mouseX-10,mouseY+10);
    line(pmouseX,pmouseY,pmouseX-10,pmouseY+10);
  }
  //Erase Tool
    if (mouseButton==RIGHT){
      stroke(255);
      strokeWeight(10);
        line(mouseX,mouseY,mouseX-20,mouseY-20);
    line(pmouseX,mouseY,pmouseX-20,pmouseY-20);
  }
  }
}


