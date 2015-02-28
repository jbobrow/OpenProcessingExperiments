
void setup(){
  size(700, 600);
  background(#D1C7BE);
  smooth();
  noStroke();

  for (int i=0 ; i<700 ; i = i+110) { 
    for (int k=0; k<700; k = k+100) {
      fill(150);
      rect(i, k, 100, 42);
    }

  }
    for (int i=0-50 ; i<700 ; i = i+110) {
    for (int k=0-50; k<700; k = k+100) {
      fill(100);
      rect(i, k, 100, 42);
    }
}
 }
 void draw(){
   fill(230,243,71);
   rect(200,200,300,200);
   rect(500,250,30,90);

 if (mousePressed ==true){
   fill(#ED4224);
   rect(210,210,50,180);
   
   fill(random(100),random(150));
   rect(50,50,mouseX,mouseY);
   
 }else{
   fill(#50CE38);
   rect(210,210,50,180);
   rect(270,210,50,180);
 }

 }
