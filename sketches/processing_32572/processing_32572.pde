
void setup(){
  background(145);
size(400,400);
}

void draw() {
fill(255,255,0);
arc(200,400,300,400,PI,TWO_PI-PI/2);
arc(200,400,300,400,TWO_PI-PI/2,TWO_PI);

fill(255,255,255);
ellipse(150,300,60,90);
ellipse(250,300,60,90);

//eyes
//up and down
if(!(mouseY < 250 || mouseY > 320 )) {  
  fill(0,0,0);
ellipse(150,300,50,50);
ellipse(250,300,50,50);
}

if(mouseY < 250 && mouseX < 150) {
  fill(0,0,0);
ellipse(140,280,50,50);
ellipse(240,280,50,50);
} else if(mouseY < 250 && mouseX > 300) {
  fill(0,0,0);
ellipse(160,280,50,50);
ellipse(260,280,50,50);
} else if(mouseY < 250) {
  fill(0,0,0);
  ellipse(150,280,50,50);
  ellipse(250,280,50,50);
  }

if(mouseY > 320) {
  fill(0,0,0);
ellipse(150,320,50,50);
ellipse(250,320,50,50);
}

//eyes
//left and right

noFill();
arc(150,275,90,90,PI,TWO_PI-PI/2);
arc(250,275,90,90,TWO_PI-PI/2,TWO_PI);

fill(0,0,0);
triangle(190,350,210,350,200,370);

//red cheek
fill(255,0,0);
ellipse(100,370,20,20);
ellipse(300,370,20,20);


println("Still I Rise by Maya Angelou");
println();
println("You may write me down in history");
println("With your bitter, twisted lies,");
println("You may trod me in the very dirt");
println("But still, like dust, I'll rise.");
println();
println("Does my sassiness upset you?");
println("Why are you beset with gloom?");
println("'Cause I walk like I've got oil wells");
println("Pumping in my living room.");
}


