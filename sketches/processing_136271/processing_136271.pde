
/* ESPIROGRAFICO
Curves and lines appear on central axis.
Instructions: Click and drag to draw.

KEYS: 

A: Clean canvas.
S: Save image.
1-3: Change stroke color.

*/

void setup(){
size(1024,720);
background(200);
noFill();
stroke(150,random(100));
ellipseMode(CENTER);
}

void draw(){
if (mousePressed){
  ellipse(width/2,height/2,mouseX+50,mouseY+50);
}

// STROKE COLOR
if (keyPressed){
  if (key=='1' || key=='!'){
  stroke(100,random(100));
  }
}
if (keyPressed){
  if (key=='2' || key=='@'){
  stroke(150,random(100));
  }
}
if (keyPressed){
  if (key=='3' || key=='#'){
  stroke(255,random(100));
  }
}

// CLEAN CANVAS
if (keyPressed){
  if (key=='a' || key=='A'){
  background(200);
  }
}

// SAVE IMAGE
  if (keyPressed){
  if (key=='s' || key=='S'){
   saveFrame("espirografico-######.png");
  }
}

}
