
//Problem Set 2
//Question 1
//Natalie DeCoste 

void setup(){
size(400, 400);
}

color from = color (232,255,62); //first colour (yellow)
color to = color (255, 62, 143); // end colour (pink) 

void draw () {
   for (int i = 0; i < width; i++){ //loop to go thoughout sketch 
    color interA = lerpColor (from, to, (float)i/width); //lerpColor function 
    stroke(interA);
    line(i,0,i, height);
  }
}


