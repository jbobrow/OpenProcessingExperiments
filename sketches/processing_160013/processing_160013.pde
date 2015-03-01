
color[] dessert = {#9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC};
color[] palette = dessert;

int s = 300;

void setup(){
  size(600,600);
  background(palette[0]);
  smooth();
  //noStroke();
  frameRate(1000);
  
  for(int x = 0; x<width; x += s){ //x += s  means x = x + s
    for(int y = 0; y<height; y += s){
      stroke(palette[int(random(1,5))]);//the int will make the number just 1 2 3 4 5 not 3.5 etc
      line(s,s,x,y);
    }
  }
}
 //intager x starts with 0 and increases by s. This only happens when x < width
 
 void draw(){
   stroke(palette[int(random(1,5))]);
   int x = int(random(0,600));//the x only belongs to this block
   int y = int(random(0,600));
   line(s, s, x, y);
 }


