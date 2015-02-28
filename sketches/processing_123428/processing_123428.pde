
int unaVariable;

void setup() {  //setup function called initially, only once
  size(400, 400);
  unaVariable =10;  //set background white
  }

void draw() { 
background(255); 
ellipse (200,200,unaVariable,unaVariable);
unaVariable +=1;
println(unaVariable);
}
