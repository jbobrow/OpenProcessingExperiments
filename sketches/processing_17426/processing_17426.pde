
void setup() {
//set the size of window
size(200,200);
smooth();
frameRate(10);
}

void draw() {
  background(138,240,234);

//these are his ears
noStroke();
fill(0);
//ellipse(45,20,15,15);
//ellipse(155,20,15,15);
//strokeWeight(1);
//stroke(0);
//line(70,35,50,22);
//line(130,35,150,22);
ellipse(75,20,25,25);
ellipse(125,20,25,25);

//this is his body
noStroke();
fill(0);
ellipse(100,120,100,115);

//this is his belly
noStroke();
fill(220);
ellipse(100,120,70,105); 


//this is my avatar
//this is his head
//stroke(0);
//strokeWeight(2);
noStroke();
fill(255);
ellipse(100,50,75,80);

//these are his eyes
noStroke();
fill(0);
ellipse(86,45,25,30);
ellipse(116,45,25,30);

//these are his pupils
noStroke();
fill(255);
ellipse(86,45,10,15);
ellipse(116,45,10,15);
noStroke();
fill(3,100,255);
ellipse(86,45,5,5);
ellipse(116,45,5,5);

//this is his nose
noStroke();
fill(0);
triangle(100,57,105,65,95,65);

//this is his mouth
strokeWeight(1);
stroke(0);
line(100,65,100,72);
line(100,72,105,69);

//these are his hands
//strokeWeight(2);
noStroke();
fill(255);
ellipse(55+mouseX/10,90+mouseY/10,20,30);
ellipse(70+mouseX/10,170+mouseY/10,20,20);

ellipse(145+mouseX/10,90+mouseY/10,20,30);
ellipse(130+mouseX/10,170+mouseY/10,20,20);

//this is his bowtie
noStroke();
fill(mouseX,mouseY,255);
triangle(100,100,120,88,120,109);
triangle(100,100,80,88,80,109);

strokeWeight(1);
stroke(255);
fill(0);
ellipse(100,100,10,10);

//this is his hair
strokeWeight(1);
stroke(0);
line(100,11,100,5);
line(100,11,105,5);

//this is his voice!
//void mousePressed(); {
  //println("

}





