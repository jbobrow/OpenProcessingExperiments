
void setup() {
  size(500, 500);
  background (0);

};


void draw() {
 
//------------------------------------- blue 

if(mouseX <250) {
  strokeWeight(2);
  stroke(0,122,180);
  line(mouseX,mouseY,125,250);

// white line
strokeWeight(.5);
stroke(255);
line(mouseX,mouseY,125,250); 
}
 //------------------------------------ orange
 
 if(mouseX < 125) {
 strokeWeight(2);
 stroke(218,62,50);
 line(mouseX,mouseY,125,250);

 //white line
strokeWeight(.5);
stroke(255);
line(mouseX,mouseY,125,250); 
 }

 //------------------------------------ yellow green

if((mouseX > 200) && (mouseX <400)) 
if(mouseY >250) {
strokeWeight(2);
stroke(203,220,52);
line(mouseX,mouseY,275,275);

//white line
strokeWeight(.5);
stroke(255);
line(mouseX,mouseY,275,275); 
}

//------------------------------------ pink 

if((mouseX > 200)&&(mouseY <250)) {
  strokeWeight(2);
  stroke(255,124,102);
  line(mouseX,mouseY,275,275);

// white line
strokeWeight(.5);
stroke(255);
line(mouseX,mouseY,275,275); 
}

//------------------------------------ darker green 

if((mouseX > 300) && (mouseY>250)) {
strokeWeight(2);
stroke(117,216,129);
line(mouseX,mouseY,375,375);

// white line
strokeWeight(.5);
stroke(255);
line(mouseX,mouseY,375,375); 
}

//------------------------------------ bright pink 

if((mouseX >300) && (mouseY < 250)) {
  strokeWeight(2);
  stroke(213,24,71);
  line(mouseX,mouseY,500,0);

// white line
strokeWeight(.5);
stroke(255);
line(mouseX,mouseY,500,0); 
}
//------------------------------------ dark blue

if(mouseX >450) {
strokeWeight(2);
stroke(39,46,149);
line(mouseX,mouseY,500,500);
//white
strokeWeight(.5);
stroke(255);
line(mouseX,mouseY,500,500); 
}
//------------------------------------ purple
if((mouseX < 270) &&(mouseY > 450)) {
strokeWeight(2);
stroke(103,46,157);
line(mouseX,mouseY,0,500); 
//white 
strokeWeight(.5);
stroke(255);
line(mouseX,mouseY,0,500); 

}
};
