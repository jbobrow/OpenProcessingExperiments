
void setup(){
  size(500,500);
  background(255);
  smooth();
}
  //the centre
  int x = 250;
  int y = 250;
  //the width
  int wd = 60;
  //how much it changes each step
  int offset = 0;

  int mode = 1;

  int off = offset;
void draw(){  
  strokeWeight(4); 
    background(255);
     
  if(mode<3){
      //the lines for the left cross
  line(x-2*wd, y+wd, x, y-wd); 
  line(x-2*wd+offset, y-wd, x, y+wd); 
  //the lines for the right cross
  line(x+2*wd, y-wd, x, y+wd); 
  line(x+2*wd-offset, y+wd, x, y-wd);
     }
else if(mode<5){
    //the lines for the two arrows either side
  line(x-2*wd+offset, y-wd, x-wd+offset, y); //line A
  line(x-wd+offset, y, x-2*wd+offset, y+wd); //line B
  line(x+wd-offset, y, x+2*wd-offset, y-wd); //line G
  line(x+2*wd-offset, y+wd, x+wd-offset, y); //line H
//  //the lines for the central diamond
  line(x-wd, y-offset, x, y-wd); //line C
  line(x-wd, y-offset, x, y+wd); //line D
  line(x, y+wd, x+wd, y-offset); //line E
  line(x, y-wd, x+wd, y-offset); //line F
}
else if(mode<7){
  line(x-2*wd+0.5*offset, y-wd+0.5*offset, x+0.5*offset, y+wd-0.5*offset); 
  line(x-2*wd+0.5*offset, y+wd-0.5*offset, x+0.5*offset, y-wd+0.5*offset); 

  line(x+2*wd-0.5*offset, y+wd+0.5*offset, x-0.5*offset, y-wd-0.5*offset); 
  line(x+2*wd-0.5*offset, y-wd-0.5*offset, x-0.5*offset, y+wd+0.5*offset);
}
else if(mode<9){
    //the lines for the two arrows either side
  line(x-2*wd+offset, y-wd, x-wd+offset, y); //line A
  line(x-wd+offset, y, x-2*wd+offset, y+wd); //line B
  line(x+wd-offset, y, x+2*wd-offset, y-wd); //line G
  line(x+2*wd-offset, y+wd, x+wd-offset, y); //line H
//  //the lines for the central diamond
  line(x-wd, y, x, y-wd); //line C
  line(x-wd, y, x, y+wd); //line D
  line(x, y+wd, x+wd, y); //line E
 line(x, y-wd, x+wd, y); //line F
}
else if(mode<11){
    //the lines for the two arrows either side
  line(x-2*wd+offset, y-wd, x-wd+offset, y-offset); //line A
  line(x-wd+offset, y-offset, x-2*wd+offset, y+wd); //line B
  line(x+wd-offset, y-offset, x+2*wd-offset, y-wd); //line G
  line(x+2*wd-offset, y+wd, x+wd-offset, y-offset); //line H
  //the lines for the central diamond
  line(x-wd+offset, y-offset, x+offset, y-wd); //line C
  line(x-wd+offset, y-offset, x, y+wd); //line D
  line(x, y+wd, x+wd-offset, y-offset); //line E
  line(x-offset, y-wd, x+wd-offset, y-offset); //line F
}
else{
  mode=1;  
  offset=0;
}
//if the mode is an even number it is moving back towards the start position
if(mode%2==0){ 
   offset--;
 }
 else{
  offset++;
 }
//it changes modes every 120 steps   
  if(offset% 120 ==0){
    mode++;
  }
  }
