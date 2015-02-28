
void setup() {
  size(500,500);
background(230);
}

void draw() {

 // en dış kare 
noStroke();
fill(99,129,209);
rect(50,50,400,400);

//orta kare
noStroke();
fill(74,102,170);
rect(85,100,330,330);

//beyaz kare
stroke(255);
rect(118,150,260,260);

//en iç kare
noStroke();
fill(51,71,118);
rect(150,195,195,195);
}

