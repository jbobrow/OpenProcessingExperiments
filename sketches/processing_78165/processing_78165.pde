
//variabletyp / name = wert 


int xPos  = 0;


float kommazahl = 0.4;

String textAbschnitt = "creatve coading";



void setup () {
  size(400, 400);

  noStroke();
}


void draw() {
  background(200);
  
  ellipse (xPos, height/2, 40, 40);

  xPos = xPos + 1;


  if (xPos > width){
  xPos = 0;

  fill(random (200, 255), random (200, 255), random (200, 255));
}

println(xPos);
}
