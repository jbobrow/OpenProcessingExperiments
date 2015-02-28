
void setup()
 {
size(500, 500);
}
 
void draw() 
{
background(255);

translate(width/2, height/2); 

pushMatrix();
fill(255,64,64);
ellipse(0,0,330, 330);
noStroke();
fill(200);
ellipse(0,0,300, 300);
popMatrix();


pushMatrix();
stroke(0,0,139);
rotate (radians (6*second()-90));
strokeWeight(1)
line(0, 0,130,0);
popMatrix();


pushMatrix();
stroke(0,0,139);
rotate (radians (6*minute()-90));
strokeWeight(2)
line(0, 0,120,0);
popMatrix();


pushMatrix();
stroke(0,0,139);
rotate (radians (30*(hour()+minute()/60.0)-90));
strokeWeight(4)
line(0, 0,90,0);
popMatrix();


pushMatrix();
noStroke();
fill(255, 64, 64);
ellipse(0, 0, 15, 15);
popMatrix();
}
