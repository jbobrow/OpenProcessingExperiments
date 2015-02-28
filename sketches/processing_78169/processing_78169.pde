
//variabletyp / name = wert 


int xPos  = 0;


float kommazahl = 0.4;

String textAbschnitt = "creatve coading";

float r = 0;
float b = 0;
float g = 0;


void setup () {
  size(400, 400);

  noStroke();
  
r = random (200,255);
b = random (200,255);
g = random (200, 255);
}


void draw() {
  background(200);
  
  ellipse (xPos, height/2, 40, 40);

  xPos = xPos + 3;


  if (xPos > width){
  xPos = 0;
r = random (200,255);
b = random (200,255);
g = random (200, 255);

  }


fill(r,g,b);


println(xPos);
}
