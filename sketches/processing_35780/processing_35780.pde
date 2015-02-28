
void setup() {
  // Canvas Set-Up
  size(500,500);
  background(247,62,9);
  smooth();
}

void draw() {
  // Used help from the processing.org reference link
  noStroke();
  fill(206,19,253);
  quad(150,125,250-125,360,375,360,350,125);
  stroke(0,0,0);
  // Upper Arc
  fill(206,19,253);
  arc(250,125,200,200,-PI,0);
  // Left Arc
  fill(206,19,253);
  arc(250-125,125,125,125,0,PI/2);
  arc(250-125,250,125,125,PI/2,TWO_PI-PI/2);
  fill(247,62,9);
  arc(250-125,250+125,125,125,TWO_PI-PI/2, TWO_PI);
  // Right Arc
  fill(206,19,253);
  arc(250+125,125,125,125,PI/2, PI);
  arc(250+125,250,125,125,-PI/2,PI/2);
  fill(247,62,9);
  arc(250+125,250+125,125,125,PI,TWO_PI-PI/2);
  // Bottom Arc
  fill(206,19,253);
  arc(250,250+125,125,60,0,PI);
  
  // Decorative circles in face
  noStroke();
  fill(23,236,204);
  ellipse(250-25,250-140,62,62);
  ellipse(250-125,250,42,42);
  ellipse(250+50,250,52,52);
  ellipse(250+25,250-110,25,25);
  ellipse(250,250+60,35,35);
  
  stroke(0,0,0);
  // Eye Balls
  fill(255,255,255);
  ellipse(250+125,250-125,125,125);
  ellipse(250-125,250-125,125,125);
  // Pupils
  fill(125,240,19);
  ellipse(250+125+20,250-125+20,125/2,125/2);
  ellipse(250-125+20,250-125+20,125/2,125/2);
  // Inside of Pupils
  fill(92,24,27);
  ellipse(250+125+30,250-125+30,125/5,125/4);
  ellipse(250-125+30,250-125+30,125/5,125/4);
  
  //Nosestrills
  fill(254,96,1);
  ellipse(250-10,250-40,8,10);
  ellipse(250+10,250-40,8,10);
  
  // Mouth
  fill(255,64,64);
  triangle(250-60,250,250,250+62,250+60,250);
  
  // Teeth
  fill(255,255);
  arc(250,250+1,15,15,0,PI);
  arc(250-15,250+1,15,15,0,PI);
  arc(250+15,250+1,15,15,0,PI);
}
