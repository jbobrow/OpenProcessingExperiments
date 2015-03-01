
//Understanding radians and its use in arcs (where 
//to start and finish the arc)

void setup(){
size(480, 480);
background (0);
}

void draw(){
noStroke();
fill (126, 11, 115);
arc(90, 60, 80, 80, 0, HALF_PI);
arc(190, 60, 80, 80, 0, PI);
arc(290, 60, 80, 80, 0, PI+HALF_PI); 
arc(390, 60, 80, 80, 0, TWO_PI); 

fill (51, 169, 203);
arc(90, 160, 80, 80, HALF_PI, PI); 
arc(190, 160, 80, 80, HALF_PI, PI+HALF_PI);
arc(290, 160, 80, 80, HALF_PI, PI+PI);
arc(390, 160, 80, 80, 0, PI+PI);

pushMatrix();
translate(0, 260);             //translation of the (0,0) coordenates
fill (206, 56, 154);
arc(90, 0, 80, 80, PI, PI+HALF_PI);
arc(190, 0, 80, 80, PI, TWO_PI);
arc(290, 0, 80, 80, PI, TWO_PI+HALF_PI);
arc(390, 0, 80, 80, PI, TWO_PI+TWO_PI);

fill (65, 193, 57);
arc(90, 100, 80, 80, PI+HALF_PI, TWO_PI);
arc(190,100, 80, 80, PI+HALF_PI, TWO_PI+HALF_PI);
arc(290, 100, 80, 80, PI+HALF_PI, TWO_PI+PI);
arc(390, 100, 80, 80, PI+HALF_PI, TWO_PI+PI+HALF_PI);

popMatrix();
}





