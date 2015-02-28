


int offset = 25;
void setup(){
 size(200,400);
 
 background(#396a26);

 



}

void draw(){


stroke(#59e017);
strokeWeight(4);
noFill();
beginShape();

curveVertex(20+offset,15+offset);
curveVertex(55+offset,45+offset);
curveVertex(500+offset,20+offset);
endShape();

stroke(#125525);
noFill();
beginShape();


curveVertex(500+offset,455+offset);
curveVertex(35+offset,45+offset);
curveVertex(15+offset,500+offset);
curveVertex(200+offset,45+offset);

 endShape(); 
 
 stroke(#125525);
noFill();
beginShape();


curveVertex(455+offset,500+offset);
curveVertex(45+offset,35+offset);
curveVertex(550+offset,15+offset);
curveVertex(45+offset,200+offset);

 endShape(); 
 
 fill(#186247);
 quad(30+offset,100+offset,86+offset,20+offset,45+offset,30+offset,63+offset,76+offset);
 quad(76+offset,63+offset,30+offset,45+offset,20+offset,86+offset,100+offset,30+offset);




//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{

}





}

