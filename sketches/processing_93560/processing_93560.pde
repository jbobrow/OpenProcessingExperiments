
//Brennda
void setup(){
size(200,200);
background(0);
}
void draw(){
  int i=3;
fill(#0DFA89);
while(i<=255){
  rect((i*i),5,5,5);
  rect((i*i),30,10,10);
  rect((i*i),75,15,15);
  rect((i*i),120,20,20);
  rect((i*i),170,35,35);
  i=i+2;
}
}
