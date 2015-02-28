
PFont font;
float randomx = 70;
float randomy = 75; // variable random starts at 75
float opacity = 170; //opacity starts at 150

void setup() {
  size(250, 250);
  font = loadFont("Futura-Medium-20.vlw"); //futura
  smooth();
  frameRate(30);
}

void draw() {
  background(30);
  textFont(font);
  frameRate(15);
  
  fill(#C01900, 200); 
  text("V 5 B 1 Z 9", random(72, 77),pmouseY);
  
  
}
void mouseClicked (){
  randomy += 10; //random perimeters increase with each click
  randomx -= 10; 
  opacity -= 10; //opacity lowers by 10 with each click
  fill(#C01900, opacity); 
  text("V 5 B 1 Z 9", random(randomx, randomy),pmouseY+10);
  text("V 5 B 1 Z 9", random(randomx, randomy),pmouseY-10);
  
  if(opacity < 70){
    opacity = 150;}
  if (randomx < 0) {
    randomx = 70;}
  if (randomy > 250) {
    randomy = 75;}
}


