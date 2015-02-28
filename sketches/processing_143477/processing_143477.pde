
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: CHAE Seo Rin
 // ID: 201420110


void setup(){
size (600, 600);
smooth();
 }

void draw(){
for(int a = 20; a< width; a = a+20){
  for(int b = 20; b< width; b = b+20){
    strokeWeight(15);
    stroke(255, 0, 0);
    fill(255);
    ellipseMode(CENTER);
    ellipse(a, b, 5, 5);
    strokeWeight(5);
    stroke(0);
    noFill();
    rectMode(CENTER);
    rect(a, b, 40, 40);

  }
}
    
    
    
}

