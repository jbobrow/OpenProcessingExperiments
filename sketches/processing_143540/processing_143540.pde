

void setup(){
size (600,600);
}


void draw(){
background(255);

//cap
stroke(0);
strokeWeight(3);
fill(250,255,0);
triangle(mouseX-182,mouseY-60,mouseX-100,mouseY+120,mouseX-60,mouseY-50);

strokeWeight(3);
fill(250,255,0);
triangle(mouseX+182,mouseY-60,mouseX+100,mouseY+120,mouseX+60,mouseY-50);

beginShape();
vertex(mouseX-60, mouseY-50);
vertex(mouseX+60, mouseY-50);
vertex(mouseX+100, mouseY+120);
vertex(mouseX-100, mouseY+120);
endShape(CLOSE);

strokeWeight(3);
fill(250,255,0);
ellipse(mouseX,mouseY-120,400,300);

//tapar
fill(250,255,0);
noStroke();
beginShape();
vertex(mouseX-175, mouseY-50);
vertex(mouseX+176, mouseY-50);
vertex(mouseX+99, mouseY+122);
vertex(mouseX-97, mouseY+122);
endShape(CLOSE);

//ulls
pushMatrix();
translate(mouseX-75,mouseY);
rotate(-0.2);
stroke(0);
strokeWeight(2);
fill(255);
ellipse(0,0,60,170);
popMatrix();

pushMatrix();
translate(mouseX-67,mouseY+39);
rotate(-0.2);
strokeWeight(2);
fill(0,159,255);
ellipse(0,0,50,90);
popMatrix();

pushMatrix();
translate(mouseX-63,mouseY+60);
rotate(-0.2);
strokeWeight(2);
fill(0);
ellipse(0,0,25,50);
popMatrix();

pushMatrix();
translate(mouseX+75,mouseY);
rotate(0.2);
stroke(0);
strokeWeight(2);
fill(255);
ellipse(0,0,60,170);
popMatrix();

pushMatrix();
translate(mouseX+67,mouseY+39);
strokeWeight(2);
rotate(0.2);
fill(0,159,255);
ellipse(0,0,50,90);
popMatrix();

pushMatrix();
translate(mouseX+63,mouseY+60);
fill(0);
strokeWeight(2);
rotate(0.2);
ellipse(0,0,25,50);
popMatrix();

//galtes
pushMatrix();
translate(mouseX-78,mouseY+140);
strokeWeight(3);
fill(250,255,0);
rotate(radians(-10));
ellipse(0,0,120,70);
popMatrix();


pushMatrix();
translate(mouseX+93,mouseY+140);
fill(250,255,0);
rotate(radians(10));
ellipse(0,0,120,70);
popMatrix();

//tapargaltes
noStroke();
rect(mouseX-100,mouseY+98,204,65);

//boca
stroke(0);
strokeWeight(2);
stroke(0);
fill(255,205,0);
ellipse(mouseX+5,mouseY+120,60,20);

fill(255,205,0);
ellipse(mouseX+5,mouseY+120,80,40);

noStroke();
fill(250,255,0);
rect(mouseX-50,mouseY+120,100,30);

stroke(0);
fill(255,205,0);
ellipse(mouseX+5,mouseY+120,60,20);

stroke(0);
line(mouseX-35,mouseY+120,mouseX+45,mouseY+120);

noStroke();
fill(255,205,0);
rect(mouseX-25,mouseY+109,61,10);

//seies
noFill();
stroke(0);
curve(mouseX-75,mouseY-50,mouseX-125,mouseY-120,mouseX-80,mouseY-150,mouseX+150,mouseY-50);

noFill();
stroke(0);
curve(mouseX+50,mouseY-50,mouseX+125,mouseY-120,mouseX+80,mouseY-150,mouseX-150,mouseY-50);


//cabell
noFill();
stroke(0);
curve(mouseX,mouseY,mouseX,mouseY-230,mouseX-25,mouseY-285,mouseX,mouseY-150);

noFill();
stroke(0);
curve(mouseX,mouseY-200,mouseX+15,mouseY-260,mouseX,mouseY-285,mouseX+10,mouseY-150);


//cos
noStroke();
fill(250,255,0);
rect(mouseX-27,mouseY+160,70,100);

stroke(0);
strokeWeight(3);
noFill();
ellipse(mouseX-35,mouseY+210,20,100);

stroke(0);
strokeWeight(3);
noFill();
ellipse(mouseX+50,mouseY+210,20,100);

noStroke();
fill(255);
rect(mouseX-47,mouseY+168,10,100);

noStroke();
fill(255);
rect(mouseX+52,mouseY+168,10,100);
rect(mouseX-50,mouseY+256,140,50);



noCursor();

}




