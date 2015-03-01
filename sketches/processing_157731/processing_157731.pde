

  boolean drawval=true; 
  int rval=0;
  int bval=0;
  int gval=0; 

void setup() {
  background(255);
  size(1000,700); 

}

void draw(){
  stroke(rval,gval,bval); 
  strokeWeight(abs(mouseX-pmouseX)+abs(mouseY-pmouseY));
  if(drawval==true){
    line(mouseX,mouseY, pmouseX, pmouseY); 
  }
  
}

void mousePressed() {
  if(drawval==true){
    drawval=false;
  }
  else{
    drawval=true; 
  }
  
}

void keyPressed() {
  if (key=='0'){
    background(0);
  } else if (key=='1'){
    rval= (rval+30)%255;
  }else if (key=='2'){
    rval= (rval-30)%255;
  }else if (key=='3'){
   gval=(gval+30)%255;
  }else if (key=='4'){
    gval=(gval-30)%255;
  }else if (key=='5'){
    bval=(bval+30)%255;
  }else if (key=='6'){
    bval=(bval-30)%255;
  }else if (key=='8'){
    rval=gval=bval=0;
  }else if (key=='9'){
    rval=gval=bval=255;
  }
  else{
    println("I only respond to numbers");
  }
}


