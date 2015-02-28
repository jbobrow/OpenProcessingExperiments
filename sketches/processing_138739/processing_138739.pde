
float i=0, j=0;
float biggness=50;
float frames2=0;
//float[] randoms = new float[500];
float k;
void setup(){
//  background(20);
  size(150,150);
  noStroke();
/*  for(i=0;i<500;i++){ //x
    randoms[i]=random(360);
    
  } */
}

void draw(){
  background(20);
  frames2++;
  if(frames2>=360){
    frames2=0;
  }
  for(i=biggness/2;i<width+biggness;i+=biggness){ //x
    for(j=biggness/2;j<height+biggness;j+=biggness){ //y
      fill(235);
      ellipse(i,j,biggness,biggness);
      fill(50);
      arc(i,j,biggness*4/5,biggness*4/5, 0+radians(frames2+i), 3*QUARTER_PI+radians(frames2+i));
      fill(235);
      arc(i,j,biggness*3/5,biggness*3/5, 0-1+radians(frames2+i), 3*QUARTER_PI+1+radians(frames2+i));
      
      fill(50);
      arc(i,j,biggness*3/5,biggness*3/5, 4*QUARTER_PI+radians(frames2*3+j), 7*QUARTER_PI+radians(frames2*3+j));
      fill(235);
      arc(i,j,biggness*2/5,biggness*2/5, 4*QUARTER_PI-1+radians(frames2*3+j), 7*QUARTER_PI+1+radians(frames2*3+j));
    
      fill(50);
      arc(i,j,biggness*2/5,biggness*2/5, 4*QUARTER_PI+radians(frames2*9), 7*QUARTER_PI+radians(frames2*9));
      fill(235);
      arc(i,j,biggness*1/5,biggness*1/5, 4*QUARTER_PI-1+radians(frames2*9), 7*QUARTER_PI+1+radians(frames2*9));
      
      fill(50);
      ellipse(i,j,biggness/5,biggness/5);
    } 
  }
}
