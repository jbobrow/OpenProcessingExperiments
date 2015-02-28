
//Beatriz Bukvic, March 12th, Creative Computing B, Benjamin Bacon

void setup() {
size(700,700);
background(23,3,25);
}


int i = 0;
int e = 0;
int o = 0;


void draw(){
  
while (i < 550) {
  fill(68,20,49);
  noStroke();
  ellipse(100, i+100, 10, 10);
  ellipse(150, i+100, 10, 10);
  ellipse(200, i+100, 10, 10);
  ellipse(250, i+100, 10, 10);
  ellipse(300, i+100, 10, 10);
  ellipse(350, i+100, 10, 10);
  ellipse(400, i+100, 10, 10);
  ellipse(450, i+100, 10, 10);
  ellipse(500, i+100, 10, 10);
  ellipse(550, i+100, 10, 10);
  ellipse(600, i+100, 10, 10);
  i = i + 50;
  } 
  
while (e < 550) {
  fill(255);
  ellipse(e+100, 300, 10, 10);
  ellipse(e+100, 350, 10, 10);
  ellipse(e+100, 400, 10, 10);
  e = e + 50;
}

while (o < 550) {
  fill(255);
  ellipse(300, o+100, 10, 10);
  ellipse(350, o+100, 10, 10);
  ellipse(400, o+100, 10, 10);
  o = o + 50;
}
  
}



