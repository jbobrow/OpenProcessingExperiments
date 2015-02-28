
float diameter=120;
float angle =0.0;
void setup(){
size(400,400);
}
void draw(){

    
  background(0);
  stroke(0,255,0);
  translate(width/2,height/2);

  rotate(angle); angle +=.1;
  ellipse(0,0,2*diameter,2*diameter);
  
  for(int i= 1 ; i < 7 ; i++ )
  {
    rotate(PI/3);
    fill(0,0,0,100);
   ellipse(0,diameter/2,diameter,diameter);
  }
   fill(0,0,0,5);
  ellipse(0,0,diameter,diameter);
  //triangle();


}
