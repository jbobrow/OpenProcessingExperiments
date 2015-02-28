
void setup()
 {
size(500, 500);
}
  
void draw()
{
background(#4C4D4C);
 
translate(width/2, height/2);

pushMatrix();
noStroke();
fill(#D10643);
rotate (radians (6*second()-90));
triangle(150, 150, 20, 20, 40, 20);
popMatrix();
 
pushMatrix();
noStroke();
fill(#5FFBFF);
rotate (radians (6*minute()-90));

ellipse(0, 0,20,70);
popMatrix();
 
pushMatrix();
noFill();
stroke(#5FFBFF);
rotate (radians (30*(hour()+minute()/60.0)-90));
strokeWeight(4);
ellipse(0, 0,200,80);
popMatrix();
 
}

