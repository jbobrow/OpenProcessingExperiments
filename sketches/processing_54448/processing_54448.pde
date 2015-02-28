
int x = 5;
float b = 400;
PFont myfont;

void setup(){
  size(400,500);
  myfont = loadFont("Onyx-48.vlw");
}

void draw(){
  b= random(400);
  //Random sized circles out of ellipses?
  ellipse(230,400,b,b);
  fill(b,135,130);
    
    textFont(myfont);
    textSize(random(500));
    text("South Main St.",10,b);
    //text, begining placement, font size );-

}
void mousePressed(){
  //b = b - 10;
  //Makes background change color after each time mouse is pressed
  //background(random(255), random(255), random(255));

  //Draws ellipse. 
  //ellipse(mouseX, mouseY, 30, 30);

  b = b - 10;

}
void keyPressed(){
  ////Fills with random shade of red. 
  fill(random(255), 0,0);
  
  
 ellipse(random (800), random(800), 30,30);
}
