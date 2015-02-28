

void setup() {
 size(600,650);
background(230);
    
}
  
void draw() {
  if(mousePressed){
// start of after click version
    size(600,650);
background(230);
 
//FROG`s body
smooth();
ellipseMode(CENTER);
noStroke();
fill(0,180,60);
ellipse(300,300,300,320);
 
noStroke();
fill(238,205,43);
ellipse(170,234,20,20);
ellipse(227,209,20,20);
ellipse(310,190,20,20);
ellipse(209,180,20,20);
ellipse(345,154,20,20);
ellipse(290,230,20,20);
ellipse(270,156,20,20);
ellipse(390,178,20,20);
ellipse(368,220,20,20);
ellipse(431,235,20,20);
 
//FROG`s leg left
stroke(0,180,60);
noFill();
smooth();
strokeWeight(35.0);
strokeCap(ROUND);
line(280,482,100,300);
line(230,470,100,300);
smooth();
noStroke();
fill(0,180,60);
arc(280,500,350,80,PI, TWO_PI-PI/2);
 
//FROG`s leg right
stroke(0,180,60);
noFill();
smooth();
strokeWeight(35.0);
strokeCap(ROUND);
line(320,482,500,300);
line(370,470,500,300);
smooth();
noStroke();
fill(0,180,60);
arc(320,500,350,80,TWO_PI-PI/2, TWO_PI);
 
//FROG`s face
//FROG`s mouth
stroke(0,100,10);
smooth();
strokeWeight(8.0);
strokeCap(ROUND);
fill(0);
ellipse(300,350,250,200);

//FROG's tongue
stroke(350, 60, 100);
strokeWeight(60);
line(300, 350, 200, 400);
 
//FROG`s eye left
smooth();
fill(255);
noStroke();
ellipseMode(CENTER);
ellipse(225,250,50,50);
fill(0);
ellipse(225,250,20,20);
 
//FROG`s eye right
fill(255);
noStroke();
ellipseMode(CENTER);
ellipse(370,250,50,50);
fill(0);
ellipse(370,250,20,20);
 
//FROG`s eyebrows
stroke(0);
noFill();
smooth();
strokeWeight(3.5);
strokeCap(ROUND);
arc(225,250,60,60,PI,TWO_PI-PI/2);
arc(370,250,60,60,TWO_PI-PI/2, TWO_PI);
    
 
//else

}else{
  
// frog number one before click

//FROG`s body
smooth();
ellipseMode(CENTER);
noStroke();
fill(0,180,60);
ellipse(300,300,300,320);
 
noStroke();
fill(238,205,43);
ellipse(170,234,20,20);
ellipse(227,209,20,20);
ellipse(310,190,20,20);
ellipse(209,180,20,20);
ellipse(345,154,20,20);
ellipse(290,230,20,20);
ellipse(270,156,20,20);
ellipse(390,178,20,20);
ellipse(368,220,20,20);
ellipse(431,235,20,20);
 
//FROG`s leg left
stroke(0,180,60);
noFill();
smooth();
strokeWeight(35.0);
strokeCap(ROUND);
line(280,482,100,300);
line(230,470,100,300);
smooth();
noStroke();
fill(0,180,60);
arc(280,500,350,80,PI, TWO_PI-PI/2);
 
//FROG`s leg right
stroke(0,180,60);
noFill();
smooth();
strokeWeight(35.0);
strokeCap(ROUND);
line(320,482,500,300);
line(370,470,500,300);
smooth();
noStroke();
fill(0,180,60);
arc(320,500,350,80,TWO_PI-PI/2, TWO_PI);
 
//FROG`s face
//FROG`s mouth
stroke(0,100,10);
smooth();
strokeWeight(8.0);
strokeCap(ROUND);
fill(0);
ellipse(300,350,75,50);
 
//FROG`s eye left
smooth();
fill(255);
noStroke();
ellipseMode(CENTER);
ellipse(225,200,50,50);
fill(0);
ellipse(225,200,20,20);
 
//FROG`s eye right
fill(255);
noStroke();
ellipseMode(CENTER);
ellipse(370,200,50,50);
fill(0);
ellipse(370,200,20,20);
 
//FROG`s eyebrows
stroke(0);
noFill();
smooth();
strokeWeight(3.5);
strokeCap(ROUND);
arc(225,200,60,60,PI,TWO_PI-PI/2);
arc(370,200,60,60,TWO_PI-PI/2, TWO_PI);
  }
}

