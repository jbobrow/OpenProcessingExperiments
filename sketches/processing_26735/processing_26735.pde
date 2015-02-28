
//faith watling processing
//Ex2 "jupee"

void setup(){
//intialise display
size(200,200);

}

void draw(){
  
background(148,218,252);
smooth();

stroke(0); 
line(100,100,100,100); 
line(100,100,100,100);

// Fill a black color noStroke(); 
fill(33,39,191);
if (mouseX < 100 && mouseY < 100) { 
  rect(0,0,200,200);
} else if (mouseX > 50 && mouseY < 50) { 
  rect(200,0,200,200); 
} else if (mouseX < 50 && mouseY > 50) { 
  rect(0,200,200,200);
} else if (mouseX > 50 && mouseY > 50) { 
  rect(200,200,200,200);

}

ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);

  
//legs
fill(0);
rect(91,120,10,80);
rect(109,120,10,80);
rect(91,120,30,30);
rect(109,120,30,30);

//torso
fill(22,196,29);
ellipse(100,100,50,50);
fill(0);
arc(80,100,60,60,PI/2,PI);
arc(120,100,60,60,0,PI/2);

//head
fill(6,142,11);
ellipse(100,70,80,80);
//eyes
fill(0);
rect(81,70,10,20);
rect(119,70,10,20);
//halo
fill(255,247,5);
ellipse(100,10,50,5);


}

