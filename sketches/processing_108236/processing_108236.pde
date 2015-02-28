
void setup(){
 size(285, 285);
 strokeWeight(3);
 noFill();
  
 line(75, 75, 75, 185); //B
 arc(76, 100, 50, 50, PI+HALF_PI, TWO_PI+HALF_PI);
 arc(76, 155, 60, 60, PI+HALF_PI, TWO_PI+HALF_PI); 
 
 line(125, 75, 125, 185); //R
 arc(126, 100, 50, 50, PI+HALF_PI, TWO_PI+HALF_PI);
 //line(125, 125, 155, 185);
 arc(125, 185, 60, 115, PI+HALF_PI, TWO_PI);
 
 line(180, 75, 180, 185); //H
 line(210, 75, 210, 185);
 line(180, 125, 210, 125);
 
 rect(50, 50, 185, 160);
}
