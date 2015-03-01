

void setup(){
size(400,500);
}

void draw(){
background(random(255), random(255), random(43));



noStroke();// bg shade
fill(244, 223, 28);
rect(0, 0, 200, 500);

fill(186, 47, 130); //hair side
beginShape();
vertex(130, 0);
vertex(500, 0);
vertex(500, 120);
endShape();

fill(random(247), random(77), random(247)); //hair
noStroke();
beginShape();
vertex(0, 0);
vertex(500, 0);
vertex(500, 35);
vertex(0, 130);
endShape();

fill(225, 53, 229); //hair shade
noStroke();
beginShape();
vertex(0, 130);
vertex(400, 0);
vertex(400, 55);
endShape();
 
fill(0, 66, 61); //ribben
rect(0, 170, 500, 120); 

fill(0, 56, 51); //ribben No.2
rect(0, 170, 200, 120); 

fill(random(255)); //eyes
ellipse(100, 220, 100, 10);
ellipse(300, 220, 100, 10);



stroke(0); //teeth
strokeWeight(5);
rect(170, 350, 60, 30, 0, 0, 5, 5);
line(200, 350, 200, 380);

noStroke();

fill(random(36), random(162), random(141)); //left collar
beginShape();
vertex(0, 430);
vertex(300, 500);
vertex(0, 500);
endShape();

fill(51, 204, 141); //right collar
beginShape();
vertex(100, 500);
vertex(400, 430);
vertex(400, 500);
vertex(150, 500);
endShape();

fill(random(244), random(223), random(28)); //cover left
beginShape();
vertex(100, 370);
vertex(200, 350);
vertex(200, 300);
vertex(100, 300);
endShape();

fill(random(255), random(255), random(43)); //cover rihgt
beginShape();
vertex(200, 300);
vertex(300, 300);
vertex(300, 330);
vertex(200, 350);
endShape();


fill(51, 32, 19); //mouth
bezier(100, 370,         //first control point
       100, 370,   //first control point
       200, 370,  //second control point
       300, 330);//second control point
       
fill(random(255), random(64), random(169));
rect(mouseX, mouseY, 50, 50);
}


