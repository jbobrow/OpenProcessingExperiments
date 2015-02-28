
//Charlotte Stiles copyright homework#3

  float x,y;
void setup() {
  size(500,500);
  x=250;
  y=160;
}
void draw() {

background(250,170,170);
fill(40, 150, 50);
noStroke();

//body

ellipse (x + mouseX/30, y + mouseY/30, (x/2.7), (y/2));
ellipse (x + mouseX/20, y*1.4 + mouseY/20, (x/2.7), (y/2));
ellipse (x + mouseX/8, y*1.8 + mouseY/15, 100, 90 );

//mouth

 fill(219,0,0);
 ellipse(x+mouseX/30,(y*1.1)+mouseY/80,15,15+mouseY/80);
 
//eyes

  stroke(0);
  strokeWeight(5);
  line(270+mouseX/40,150-mouseY/70,275+mouseX/40,150+mouseY/90);
  line(230+mouseX/40,150+mouseY/90,235+mouseX/40,150-mouseY/70);
  
//1st arm

noFill();
strokeWeight(5);
beginShape();
curveVertex(x*.5 + mouseX/20, y*1.3 - mouseY/30);
curveVertex(x*.5 + mouseX/50, y*1.4 - mouseY/30);
curveVertex(x*.6 + mouseX/18, y*1.4 - mouseY/30);
curveVertex(x*.82 + mouseX/20, y*1.45 + mouseY/20);
curveVertex(x*.82 + mouseX/20, y*1.5 + mouseY/20);
endShape();
//2nd arm
beginShape();
curveVertex(x*.85 + mouseX/8, y*1.8 + mouseY/15);
curveVertex(x*.8 + mouseX/8, y*1.8 + mouseY/15);
curveVertex(x*.7 + mouseX/15, y*1.8 + mouseY/50);
curveVertex(x*.7 + mouseX/16, y*2 - mouseY/50);
curveVertex(x*.6 + mouseX/14, y*2- mouseY/50);
curveVertex(x*.6 + mouseX/14, y*2 - mouseY/50);
endShape();

//3rd arm

beginShape();
curveVertex(x*1.25 + mouseX/8, y*1.8 + mouseY/15);
curveVertex(x*1.2 + mouseX/8, y*1.8 + mouseY/15);
curveVertex(x*1.3 + mouseX/15, y*1.8 + mouseY/30);
curveVertex(x*1.3 + mouseX/16, y*2 - mouseY/30);
curveVertex(x*1.34 + mouseX/14, y*2- mouseY/30);
curveVertex(x*1.36 + mouseX/14, y*2 - mouseY/30);
endShape();

//4th arm
noFill();
strokeWeight(5);
beginShape();
curveVertex(x*1.5 + mouseX/20, y*1.3 - mouseY/30);
curveVertex(x*1.5 + mouseX/50, y*1.4 - mouseY/30);
curveVertex(x*1.4 + mouseX/18, y*1.4 - mouseY/30);
curveVertex(x*1.18 + mouseX/20, y*1.45 + mouseY/20);
curveVertex(x*1.18 + mouseX/20, y*1.5 + mouseY/20);
endShape();

//1 leg

noFill();
strokeWeight(5);
beginShape();
curveVertex(x*.8, y*2.5);
curveVertex(x*.9, y*2.5);
curveVertex(x*.94 + mouseX/30, y*2.4 - mouseY/30);
curveVertex(x*.93 + mouseX/18, y*2.3 - mouseY/30);
curveVertex(x*.9 + mouseX/8, y*2 + mouseY/15);
curveVertex(x*.8 + mouseX/8, y*1.9 + mouseY/15);
endShape();

//2 leg

noFill();
strokeWeight(5);
beginShape();
curveVertex(x*1.1 , y*2.5);
curveVertex(x*1.1 , y*2.5);
curveVertex(x* 1.2 + mouseX/50, y*2.4 - mouseY/30);
curveVertex(x* 1.2 + mouseX/18, y*2.3 - mouseY/30);
curveVertex(x* 1.1 + mouseX/8, y*2 + mouseY/15);
curveVertex(x* 1.1 + mouseX/8, y*1.9 + mouseY/15);
endShape();
}

