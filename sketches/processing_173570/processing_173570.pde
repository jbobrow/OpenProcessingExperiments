
void setup () {
  
  size(800,800);
  background( 255);

text ("pulsa ´s´ y se impirimen rectangulos", 300,50);
text("pulsa 'x' y vulve al principio",300,70);
text("haz clic y saldran lineas",300,90);

}
  
void draw () {
    fill(mouseX,mouseY,mouseX,mouseY);
    strokeWeight(random(5));
    stroke(mouseX,mouseY,mouseX);
     //translate(mouseX,mouseY);
     stroke (random(0,255), random(0,255), random (0,255));
     fill(random(150),random(200),random(255));
     strokeWeight (1+5);
    beginShape();
    strokeWeight(random(30));
    curveVertex(mouseX,mouseY);
curveVertex(mouseX,mouseY);
curveVertex(mouseX,mouseY);
curveVertex(mouseX,mouseY);
 endShape ();
 
 if(mousePressed){
   fill(random(120),random(230),random(230),9);
   stroke(random(20),random(32),random(255));
 strokeWeight(random(2));
   line(pmouseX,pmouseY,mouseX,mouseY);
   line(500,350,mouseX,mouseY);
 }
  
}
void keyPressed () {
 if (key == 's') {


stroke(0,0,random(255));
strokeWeight(random(2));
line(pmouseX,pmouseY,200,350);
   line(200,350,mouseX,mouseY);

 }
 
if(key=='x'){
background(255); 
   
}
}


