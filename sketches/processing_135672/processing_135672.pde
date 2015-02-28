
void setup(){
size(400,400);
background (255,231,186);
smooth();
}
 
void draw(){
  
if ((mouseX<200) && (mouseY<200)){
  
  strokeWeight(2);
stroke(0);
line(200,200,100,100);
line(200,200,150,100);
line(200,200,250,100);
line(200,200,300,100);
line(200,200,200,100);


stroke(0);
fill(255,245,238);
ellipse(200,200,130,130);
//solid eye
 
strokeWeight(6);
stroke(85,107,47);
fill(110,139,61);
ellipse(200,200,73,73);
//colored part of eye solid
 
noStroke();
fill(0);
ellipse(200,200,38,38);
//iris black part


}
else {
  stroke(255,231,186);
  strokeWeight(10);
  fill(255,231,186);
  rect(50,50,250,250);

  
}
}
