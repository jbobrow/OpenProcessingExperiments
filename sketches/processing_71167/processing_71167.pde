
void setup() {
size(400,400);
background(255);
frameRate(40);
rectMode(CENTER);

smooth();

 
}


void draw() { 
  
fill(0);
stroke(255);
strokeWeight(1.5);
line(72,210,125,220);
line(72,230,125,225);
line(72,250,125,230);
 
line(325,210,275,220);
line(325,230,275,225);
line(325,250,275,230); 
  
//ear
noStroke();
smooth();

fill(255);
beginShape();
vertex(245,130);
vertex(310,100);
vertex(292,165);
endShape(CLOSE);
//ear

smooth();

fill(255);
beginShape();
vertex(90,100);
vertex(150,130);
vertex(110,165);
endShape(CLOSE);
//face
noStroke();
fill(255);
ellipse(200,200,200,160);

//eyes
fill(0);
ellipse(150,215,20,25);
ellipse(250,215,20,25);
  
//nose
fill(246,255,0);
ellipse(200,230,20,15);

//butterfly circle
  
fill(255,0,random(120,255));
beginShape();
vertex(340,160);
vertex(295,215);
vertex(270,150);
endShape(CLOSE);
 
fill(255,0,random(120,255));
beginShape();
vertex(230,100);
vertex(200,150);
vertex(270,150);
endShape(CLOSE);

 
 
fill(random(234,255),random(255),0);
ellipse(270,150,30,30);

  

// bg change color
noStroke();
smooth();

fill(random(120,217),random(170),255);
rect(pmouseX,pmouseY,25, 25);
fill(random(120,217),random(170),255);
rect(pmouseX,pmouseY,20, 20);
fill(random(120,217),random(170),255);
rect(pmouseX,pmouseY,10, 10);
fill(random(120,217),random(170),255);
rect(pmouseX,pmouseY,5, 5);
fill(255,random(255),0);




//fill(0,random(78,255),random(192,255));
//ellipse(pmouseX,pmouseY,40, 40);
//fill(0,random(78,255),random(192,255));
//ellipse(pmouseX,pmouseY,30, 30);
//fill(0,random(78,255),random(192,255));
//ellipse(pmouseX,pmouseY,20, 20);
//fill(0,random(78,255),random(192,255));
//ellipse(pmouseX,pmouseY,10, 10);
//fill(255,random(255),0);





//ellipse(random(800),random(800),100, 100);

//fill(random(186,255),0,random(255));
//rect(0,0,random(800), 100);

//fill(random(234,255),random(255),0);
//rect(0,400,random(800), 100);
 
  
}

