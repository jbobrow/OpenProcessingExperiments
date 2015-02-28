
size(700, 400);
smooth();
 
int numPetals = 20;
int talloLargo = height/3;
int talloAncho = height/40; 
int centroAncho = height/10;
int petaloAncho = height/30;
 
background(100, 150 , 290);
translate(0, 2*talloLargo);
 
// ground
fill(100,40,9);
stroke(0);
strokeWeight(talloAncho);
rect(0, 0, width, talloLargo);
 
// Tallo
stroke(#09A702);
strokeCap(PROJECT);
strokeWeight(talloAncho);
translate(width/2, 0);
line(0, 0, 0, -talloLargo);
 
// Flower
translate(0, -talloLargo);
stroke(255,60,90);
fill(255, 7, 89);
ellipse(0, 0, centroAncho, centroAncho);
 
// Petals
strokeWeight(talloAncho/3);
fill(255, 7, 89);
stroke(#9B025B);
for(int i=0; i<numPetals; i++){
  rotate(TWO_PI/numPetals);
  ellipse(0, centroAncho, petaloAncho, centroAncho);
}
 
 //bee
 image ( loadImage ("bee.jpg") , mouseX, mouseY,20,20) ;
 
 // I changed sizing, colors, and added a bee. The original was found on Open Processing

