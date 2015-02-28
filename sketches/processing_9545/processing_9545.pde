
float r=random(255);
float g=random(255);
float b=random(255);


boolean doFill=true;
boolean turnOff=false;


void setup()
{

  size(500,500);
  smooth();
  background(r,g,b); 
  
}

void draw()
{

  if(doFill){
    fill(int(random(255)),int(random(255)),int(random(255)));
    stroke(int(random(255)),int(random(255)),int(random(255))); 
    strokeWeight(abs(pmouseX-mouseX));
  }
  else{
    fill(r,g,b);
    stroke(r,g,b);  

  }
  if(mousePressed == true) {
    noCursor();
  } 
  else {
    cursor(HAND);
  }

  line(mouseX,mouseY,pmouseX,pmouseY);
  ellipse(mouseX-50,mouseY+100,20,26);


}


void keyPressed(){
  if (key == ' '){
    r=random(255);
    g=random(255);
    b=random(255);
    background(r,g,b);
  }
  if (key == 'e')
  {
    doFill=false;

  }
  if (key=='w')
  {
    doFill=true;
  }  
  saveFrame("drawing_tool-####.jpg");
  
}





