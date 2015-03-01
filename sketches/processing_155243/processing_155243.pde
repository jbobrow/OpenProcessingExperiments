
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/151380*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float theta =random(0, 6.289);
  float num_simm=5;
float zoom=0;
void setup(){
  size(255*2, 255*2);
//  frameRate(70);
}
 
void keyReleased() {
    if( key == CODED ) {
      if( keyCode == RIGHT && num_simm < 10 ) { num_simm++;} else
      if( keyCode == LEFT && num_simm >1  ) { num_simm--;} 
    }
}

void draw()
{     
  background(0);
 theta = radians((mouseX / (float) width) *360);
//  theta=theta+0.05;
  translate(width/2, height/2);
  int num_levels=6;
  float par=map(mouseY,0,height,-0,3);// ratio of parent/children
  for (int i =0; i <num_simm*1; i++ ){
  branch(height/3,num_levels, par);// depend on scale
  rotate(2*PI/num_simm);
}
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom=zoom+e/10;
}
void branch(float len, int num, float par)
{
  len = 1+sqrt(len);  // len/sqrt(2) scale size
  num = num-1;
  int num_b=6;
 for (int b =0; b <num_b-1; b++ ){
     if ((len > 1) && (num > 0))
  {
     pushMatrix();
    rotate(-theta/(1+b) ); // -1-b
    stroke(152,247,255);
    strokeWeight(num/4);
   // line(0, 0, 0, +len/(zoom+par*b) ); //how smaller it gets
     noFill();
     arc(0, 0, len/(zoom+par*b), len, HALF_PI, PI ); // FIND NEW 
    translate(0, +len/ (zoom+par*b) ); // how further it is shifted
    branch(len, num, par);
    popMatrix();
  }
 }
}
