
int x; 

void setup() {
size(340,500);
background(170);
smooth(); 
x = 0; 
}


void draw() {
    background(170);
  if(mouseX > 170 && x < 170) {
    x ++; 
  }
  if(mouseX < 170 && x > -170) {
    x --;
  }
  
int neckh = 250;
int eye = 20;

//Head
noStroke();
fill(185,5,40);
rect(x+100,100,90,90); 
strokeWeight(5);
stroke(250);
ellipse(x+140,150,eye+35,eye+35);
noStroke();
if(mousePressed) {
  fill(185,5,40);
  ellipse(x+135,150,eye,eye); 
} else {
fill(255,215,75); 
ellipse(x+135,150,eye,eye);
}

//Anteannae
stroke(185,5,40);
strokeWeight(2);
line(x+170,100,x+200,55);
line(x+190,150,x+225,152);
line(x+80,150,x+100,140);
  fill(255,215,75); 
ellipse(x+200,55,10,10); 
ellipse(x+225,152,5,5); 
ellipse(x+80,150,3,3); 

//Neck
strokeWeight(3); 
line(x+145,190,x+145,neckh);
line(x+140,190,x+140,neckh);
line(x+150,190,x+150,neckh); 

//Body
fill(185,5,40);
beginShape(); 
vertex(x+100,neckh);
vertex(x+190,neckh); 
vertex(x+220,neckh+70);
vertex(x+70,neckh+70);
vertex(x+100,neckh);
endShape(); 
stroke(255,215,75);
strokeCap(SQUARE);
strokeWeight(5);
line(x+120,neckh,x+120,neckh+80); 
line(x+170,neckh,x+170,neckh+80); 
noStroke();
fill(255,215,75);
arc(x+145,neckh+80,80,80,0,radians(180)); 
}

