
//Artist Statement
//In this project, I decided to create a work based on Mondrian's use of rectangular shapes.
//I imagined it moving, only this time, I decided that it must have the palette of the future - rendering in the tradition of Tokyo's neon lights.

//setup
int x = 500;
int y = 150;
int z = 200;
color [] palette = {#D45F75, #A98C83, #6E615D, #78D969, #F6FC31, #F9319C, #FCDE5C, #45A1D6, #224F66};



void setup() {
  //size and background color
  size(800, 600);
  background(palette[8]);

}

//shadowing Mondrian
void draw(){
  float j = random(3,6);
  strokeWeight(random(5));
  stroke(palette[int(j)]);
  noFill();
  rect(x, random(height), 200, 300);
  float g = random(2, 4);
  rect(z, random(height), 100, 200);
 
 
  
}
//end of the assignment
