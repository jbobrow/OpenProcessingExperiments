
float px,py;

void setup()
{
size(400,600);
smooth();
stroke(70);
strokeWeight(3);


//eyeball_bg
background(255,225,78);
fill(235);
ellipse(120,200,130,120);
ellipse(280,200,130,120);





noFill();
beginShape();
curveVertex(200, 250);
curveVertex(200, 250);
curveVertex(150, 255);
curveVertex(145, 290);
curveVertex(190, 300);
curveVertex(190, 300);
endShape();

beginShape();
curveVertex(100, 320);
curveVertex(100, 320);
//curveVertex(150, 255);
curveVertex(45, 350);
curveVertex(180, 363);
curveVertex(350, 360);
curveVertex(350, 360);
endShape();

curve(348,352,348,352,355,365,355,365);
}



void draw(){
  //eyeball
fill(255);
noStroke();
ellipse(117,200,118,110);
ellipse(277,200,118,110);

stroke(70);
fill(100);
px=random(-10,30);
ellipse(120+px,170,20,15);
ellipse(280+px,170,20,15);

}


