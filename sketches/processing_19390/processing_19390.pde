
float x;
float i;
void setup(){
size(250, 250); 
background(99,206,260,9); 
stroke(255);
smooth(); }

void draw (){
  for(int i = 1/2; i < 250; i += 9) {
   for(int x=0;x<=width;x+=70){
    fill(x,30,220,11);
    //stroke(x+70,i+100,i,x);
    stroke(225,x+55,i,x);
    strokeWeight(2);
    bezier(mouseX, mouseY, mouseX,mouseY, mouseX, mouseY, i, 200+x);
}
  }
}

