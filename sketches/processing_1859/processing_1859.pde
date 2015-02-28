
void setup(){
  
size(400,400);
background(0);

rectMode(CENTER);
translate(width/2, height/2);

//box
strokeWeight(6);
fill(#A57408);
rect(150, 150, 800, 110);


//tallo
stroke(#287936);
strokeWeight(15);
line(0,-20,0,90);

//medio flor
stroke(#FFFFFC);
strokeWeight(10);
fill(#FCF505);
ellipse(0, -40, 30, 30);
translate( 0,-40);
smooth();


//petalas

smooth();
for (int i = 0; i < 13; i++) {
strokeWeight(5);
stroke(#74226F);
fill(#8E1786);
rotate(TWO_PI/13);
ellipse(0, -40, 30, 56);



}


}



