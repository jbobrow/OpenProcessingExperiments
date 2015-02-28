
PFont bob;
int bobSize = 32;

void setup(){
  size(250,250);
  smooth();
  background(0);
  bob = createFont("Garamond",65);
}
  
void draw (){
  textFont(bob,65);
  fill(0);
  rect(0,0,250,250);
 
 // FIRST LINE
 
 //Dark Purple
  fill(183,77,251,60);
  text("P",30,180);
  text("L",30,60);
  text("0",30,250);
  text("A",30,10);
  text("1",30,80);
  text("P",30,240);
  text("P",30,150);
  
  //Medium Purple
  fill(204,129,252,60);
  text("1",30,10);
  text("L",30,20);
  text("0",30,120);
  text("A",30,180);
  text("1",30,170);
  text("1",30,250);
  
  //Light Purple
  fill(223,172,255,60);
  text("L",30,20);
  text("0",30,50);
  text("A",30,220);
  text("1",30,100);
  
  // SECOND LINE 

  //Dark Purple
  fill(183,77,251,60);
  text("P",90,180);
  text("L",90,30);
  text("0",90,250);
  text("A",90,240);
  text("1",90,130);
  text("P",90,240);
  
  //Medium Purple
  fill(204,129,252,60);
  text("1",90,160);
  text("L",90,40);
  text("0",90,70);
  text("A",90,150);
  text("1",90,170);
  text("1",90,250);
  text("0",90,220);
  
  //Light Purple
  fill(223,172,255,60);
  text("L",90,20);
  text("0",90,50);
  text("A",90,40);
  text("1",90,100);
  }


