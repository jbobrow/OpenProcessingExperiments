
void setup (){
size (250, 250);
background (#d66418);
}
 
 
void draw (){
 noFill();
for (int y = 130; y <= 250; y += 5) {


ellipse (238, 250, y, 300); //right circle
ellipse (18, 250, y, 300); //left circle
ellipse (127, 150, y, 250); //centered circle
}
}


