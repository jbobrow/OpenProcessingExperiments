
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: JEONG eunyeah
// ID: 201420106
int x = 20;
int y = 40;
int speed = 3;

void setup(){
size (600, 600);
smooth();
}

void draw(){
  background(#e3dfd7);
  
   x = x + speed;
   y = y + speed;
   if ((x > width) || (x < 0))
   if ((y > width) || (y < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speed = speed * 100;
  }

  // Display circle at x location
  stroke(15);
  fill(#cfb2b4);
  ellipse(x,120,200,200);
  
  stroke(15);
  fill (#ba9288);
  ellipse(y,230,200,200);
  
  stroke(15);
  fill (#f24946);
  ellipse(y,350,200,200);
  
  stroke(15);
  fill (#6c6770);
  ellipse(y,480,200,200);
  
}


//professor..T.T Sorry, i'm supid
//Also das nächste Mal werde ich nur PROCESSING studieren das Buch kaufen.
//Es tut mir leid, so viel. Ich will nur, um aufzuholen den Fortschritt. Dann werde ich überraschen.
