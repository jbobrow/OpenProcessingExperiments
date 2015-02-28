
void setup() {
  size(600,600);
  smooth();
  frameRate(60);
}

void draw () {
background(50,0,200);
if(mousePressed) {
 happyCreature();
} 
else{
  angryCreature();
}
}

void angryCreature() {
 // ellipse (body)
fill(255,0,0);
strokeWeight(1);
ellipse(mouseX, mouseY,300,300);

// ellipse (eye)
fill(240);
strokeWeight(10);
ellipse(mouseX,mouseY - 30,130,130);

// ellipse (center of eye)
strokeWeight(0);
fill(1);
ellipse(mouseX, mouseY-30,60,60);

// ellipse (eye lighting)
fill(240);
ellipse(mouseX+19,mouseY-30,10,10);

// ellipse (eye lighting)
fill(240);
ellipse(mouseX,mouseY-50,10,10);

// ellipse (eye lighting)
fill(240);
ellipse(mouseX+15,mouseY-48,10,10);

// line (right arm)
strokeWeight(5);
line(mouseX+200,mouseY+100,mouseX+100,mouseY);

// line (left arm)
strokeWeight(5);
line(mouseX-100,mouseY,mouseX-180,mouseY+100);

// line (eye brow)
strokeWeight(10);
line(mouseX+70,mouseY-100,mouseX-70,mouseY-100);
 
}

void happyCreature() {
// ellipse (body)
fill(0,100,0);
strokeWeight(1);
ellipse(mouseX, mouseY,300,300);

// ellipse (eye)
fill(240);
strokeWeight(10);
ellipse(mouseX,mouseY - 30,130,130);

// ellipse (center of eye)
strokeWeight(0);
fill(1);
ellipse(mouseX, mouseY-30,60,60);

// ellipse (eye lighting)
fill(240);
ellipse(mouseX+19,mouseY-30,10,10);

// ellipse (eye lighting)
fill(240);
ellipse(mouseX,mouseY-50,10,10);

// ellipse (eye lighting)
fill(240);
ellipse(mouseX+15,mouseY-48,10,10);

// ellipse (mouth)
fill(1);
ellipse(mouseX,mouseY+100,60,60);

// line (right arm)
strokeWeight(5);
line(mouseX+200,mouseY+100,mouseX+100,mouseY);

// line (left arm)
strokeWeight(5);
line(mouseX-100,mouseY,mouseX-180,mouseY+100);
  
}
