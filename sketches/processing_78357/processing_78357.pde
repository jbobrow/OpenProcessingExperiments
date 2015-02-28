
//Candice Ferreira: Problem set 2, Question One
//lerpColor() = calculates the colour between two points at a certain incriment.
 
void setup(){
size(400, 400);
}
// colours orange - blue 
color from = color (252,55,12); 
color to = color (25, 68, 78); 
 
void draw () {
   for (int i = 0; i < width; i++){ //loop to go thoughout sketch
    color interA = lerpColor (from, to, (float)i/width); //lerpColor function
    stroke(interA);
    line(i,0,i, height);
  }
}


