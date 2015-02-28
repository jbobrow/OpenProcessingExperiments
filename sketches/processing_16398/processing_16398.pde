
//import processing.pdf.*;

float angulo1 = 0;
float angulo2 = 0;

void setup(){

frameRate(15);
 size (600,600);
//beginRecord(PDF, "PDF.pdf");
 smooth();
}


void draw(){
  
  fill(255,5);
  rectMode(CORNER);
  rect(0,0,600,600);
  //background(0);
  stroke (random(0,255),random(200,255),random(200,255));
  noFill();
  rectMode(CENTER);
  
pushMatrix();
  //translate(300,300);
  //rotate(angulo1);
  //ellipse(0,0,random(0,width-50),width-50);
  
 beginShape();
  curveVertex (random(-100,width+100),random(-100,width+100));
  curveVertex (random(-100,width+100),random(-100,width+100));
  curveVertex (random(-100,width+100),random(-100,width+100));
  curveVertex (random(-100,width+100),random(-100,width+100));
  curveVertex (random(-100,width+100),random(-100,width+100));
  endShape(); 
 
popMatrix();

/*pushMatrix();
  translate(200,200);
  rotateY(angulo2);
  rect(0,0,250,250);
  //box(0,0,100,100);
popMatrix();
*/

angulo1 += 0.02;
angulo2 += 0.02;


}

/*void keyPressed(){
noLoop();

//saveFrame(); //para guardar un screenshot
endRecord();

}*/             
