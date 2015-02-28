
//Problem Set 2 - Question 1
// Vanessa Faienza

void setup(){
size(400, 400);
}
 
color from = color (245,44,198); //first colour (pink)
color to = color (20,79,250); // end colour (blue)
 
void draw () {
   for (int i = 0; i < width; i++){ //loop
    color interA = lerpColor (from, to, (float)i/width); //lerpColor function
    stroke(interA);
    line(i,0,i, height);
  }
}


                
                
