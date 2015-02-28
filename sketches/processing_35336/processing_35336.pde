
void setup(){
  size(400,400);
    background(255);
    smooth();
    ellipse(200,200,400,400);
   // ellipse(200,200,380,380); optional
    ellipse(200,200,360,360);
   // ellipse(200,200,340,340); optional
    ellipse(200,200,320,320);
  //  ellipse(200,200,300,300); optional
    ellipse(200,200,280,280);
}
  
  int a=0;
  int b=400;
  int c=400;
  int d=0;
  int e=100;
  
void draw(){
  stroke(255,a,0);
  fill(255,a,0);
  ellipse(a,a,a-300,a-300);//top left to bottom right
  ellipse(b,b,a-300,a-300);//bottom right to top left
  stroke(0,b,a);
  fill(0,b,a);
  ellipse(a,b,a-300,a-300);//bottom left to top right
  ellipse(b,a,a-300,a-300);//top right to bottom left
   
  a++;
  b--;
 }


