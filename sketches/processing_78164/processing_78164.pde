
//VariablenTyp Name (=) Wert
int xPos = 1;
float kommaZahl = 0.4;


String textAbschnitt = "Creative Coding 2012";


void setup() {
  size(260, 230);

 noStroke();
 
}

void draw(){
  background(200);
  
  ellipse(xPos, height/2, 20, 20);
  
  xPos = xPos + 2;
  
  if(xPos > width){
    xPos = 0;
    fill(random(200, 255), random(200,255), random(200, 255));
  }
  println(xPos);
  
}
