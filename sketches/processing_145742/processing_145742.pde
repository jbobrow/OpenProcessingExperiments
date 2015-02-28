
boolean flipFlop = false;
int eyeballDiam;
 
void setup(){
  size(500,500);
}
 
void draw(){
 background(50,50,50); 
  if (flipFlop == false) {
    eyeballDiam = 50;
  }
  else{
    eyeballDiam = 70;
  }
 //Horns
 pushMatrix();
 translate(140,80);
 fill(24,170,25);
 triangle(30, 75, 58, 20, 86, 75);
 popMatrix();
 //Horns2
  pushMatrix();
 translate(240,80);
 fill(24,170,25);
 triangle(30, 75, 58, 20, 86, 75);
 popMatrix();
  //Head
fill(24,170,25);
noStroke();
ellipse(250,250,250,250);
//eyelid
fill(0,0,0);
ellipse(247,230,150,200);
fill(24,170,25);
ellipse(247,240,150,200);
//Eye
translate(100,150);
fill(255,255,255);
ellipse(150,50,100,100);
fill(0,0,0);
ellipse(150,50,80,80);
//Pupil
translate(50,75);
fill(16,125,196);
ellipse(100,-30,eyeballDiam,eyeballDiam);
fill(255,183,75);
//Mouth
arc(88,89, 80, 80, 0, PI/1.0);
}
 
void keyPressed(){
  flipFlop =! flipFlop;
}



