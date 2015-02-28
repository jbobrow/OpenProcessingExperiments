
/////////////////////////////////////////////////////////
/// Written by Angela Blachnitzky, 18th February 2011 ///
/////////////////////////////////////////////////////////

int form1 = 500/6;

void setup(){
  size(500,500);
  background(0);
  stroke(255);
  
  for(int i = 0; i < width/form1; i++){
   for(int j = 0; j < height/form1; j++){
     fill(255);
     smooth();
     
     beginShape();
      vertex(i*form1, j*form1);
      vertex(i*form1+random(15,25), j*form1+random(15,25));
      vertex(i*form1+form1, j*form1+form1);
      vertex(i*form1+random(15,25), j*form1+random(15,25));
     endShape(CLOSE);
     
     noFill();
     bezier(i*form1, j*form1+form1, i*form1+form1/2-random(1,8), j*form1+form1/2-random(1,8), i*form1+form1/2+random(1,8), j*form1+form1/2+random(1,8), i*form1+form1, j*form1);
     
      }
}
}

