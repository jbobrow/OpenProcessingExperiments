
/*--
Assignment 2
To draw something. Combine more than one shape to 
create a more complex form — for instance, how 
would you draw a line with shapes on its endpoints? 
Use arguments to pass the attributes of your shape — 
coordinates, width, height, color — to the function.
--*/

void setup() {
    size(500,500);
    background(100);

}

void draw() {
  smiley(mouseX,mouseY);
}

void smiley(float x, float y){
  //face
    noStroke();
    fill(x,y,x+y);
    ellipse(x,y,100,100);
  //eyes
    fill(x,200,80);
    ellipse((x-25),(y-10),20,20);
    ellipse((x+25),(y-10),20,20);
  //mouth
    fill(y,x,x+y);
    ellipse(x,(y+25),30,20);
}


  



