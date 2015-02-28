
//Andrew McKee  HW #4 

//All code taken from processing.org and in-class examples

//-Assignment:
//"Create an interactive pattern using for loops and conditionals. It should:
//*Use at least 3 for loops (you will probably use 2 for the intitial grid)
//*Have movement (either using mouse interaction or changing variables)
//See Chapters 5 and 6 in the book"


int fillColor;

void setup(){
  size(500,500);
  background(140);
  smooth();
  colorMode(HSB, 350, 100,100,100);
  
  fillColor = 50;
}

void draw(){
  
  for(int i = 0; i < 520; i += 20){
    for(int j = 0; j < 520; j += 20){
    ellipse(i, j,33,33);
    if(mouseX > i && mouseX< i + 20 && mouseY > j && mouseY < j+20){
      fill(fillColor++, 100,100);
    }else{
      noFill();
    }
    
  }
}
for(int k = 0; k < 500; k += 20){
  for(int l = 0; l < 500; l += 20){
    stroke( 50,60,40);
  line(k, l, k + 40, l + 40);
} }
}


