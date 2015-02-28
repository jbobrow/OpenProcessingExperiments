
//setting up variables
PFont font;
float x1=-250;
float x2=250;

//load font into program
void setup(){
  size(250,250);
  font = loadFont("LeagueGothic-250.vlw");
    textFont(font);

}

//first half of postal code 'm1x' in yellow 
void draw(){
  background(#6C8B9B);
  fill(#E0CD61, 200);
  text("M1X", x1, 220);
  x1 += 1.0;
  if (x1 > 250){
    x1 = - 250;
  }
  
//second half of postal code '1z7' in white   
  { fill(#E5E5E5, 100);
  text("1Z7",x2,220);
  x2 -=1.0; //goes in the opposite direction
  if (x2 < -200){
    x2=250;
  }}
}

