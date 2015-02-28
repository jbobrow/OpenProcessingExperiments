
int posicion=20;
void setup (){
noStroke();
size (200,200);

}
void draw(){
noStroke();
  size(200,200);
  background (0,0,0);
  fill (224,195,158); 
  ellipse(0,100,100,100)  ;
  fill (0,0,0); 
  ellipse(20,85,10,10)  ;
  arc (50,130,50,25,3.14,6.28);
  fill (224,195,158); 
  //rect(0,99,posicion,10);
  arc (0,99,posicion,10,3.14,8);
  posicion=(posicion+1)%200;
  fill (0,0,0);
  stroke (255,255,255,255);
  rect (0,55,50,10);
  rect (0,15,30,40);

}

