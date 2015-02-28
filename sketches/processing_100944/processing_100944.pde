
//Day9 Q4
float  theta;
void  setup(){
  size(400,400);
  smooth();
  theta  =  0;
}
void  draw(){
  background(255);
  //The sun  
  translate( width/2, height/2 );
  stroke(255,10,10);
  fill(255,10,10);
  ellipse(0,0,40,40);
  theta  =  theta  +  1;
  //The Green Planet
  rotate(radians(theta));
  println("radians(theta)=" + radians(theta));
  translate(150 ,0);
  stroke(10,255,10);
  fill(10,255,10);
  ellipse(0,0,20,20);

}
