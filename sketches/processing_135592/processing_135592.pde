
/*
Jacqueline Miller
Int Art 
Schotter Grid

http://www.artsnova.com/Nees_Schotter_Tutorial.html*/

float columns =12;
float rows = 22; 
float square= 30; 
float margin=square;

float wiggle;
float product_wiggly;
float please;

float move;
float abit=.5;

float it_spins;
float weee;
float dizzy;
float spin;


void setup(){
 size(420, 720);
 background (255);
  noLoop();
}
 
  void draw(){
 
for (float r=0; r<rows; r++){
float please=multiply_these(r, .5);
println("please = " + please);
float dizzy= spin_squares(r, .2);
  println("dizzy = " + dizzy);

for (float c=0; c<columns; c++){
  

pushMatrix();
move = random (-please, please);
spin= (random(-dizzy, dizzy))*(abit);
println("move = " +move);
translate(margin+(square*c)+(move*abit),margin+(square*r)+(move*abit));
rotate(random(spin));
noFill();
stroke(0);
strokeWeight(1);
rect (0,0, square, square);
popMatrix();
println(dizzy);
}}}

 float multiply_these(float r, float wiggle) {
 float product_wiggly = r*wiggle;
 return product_wiggly;
 }
 
 float spin_squares(float r, float it_spins){
   float weee=(r*it_spins);
   return weee;
   
 }

