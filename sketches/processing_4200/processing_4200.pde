
//
int lineNum;
//
void setup(){
  size(500,500);
 
  
}
//
void draw(){
  
  fill(250,242,114,2);
  rect(0,0,width,height);
  translate(width/2,height/2);
  noFill();
 
  lineNum=12;
  for(int j=0;j<lineNum;j++){
    //
     beginShape();
  for(int i=0;i<200;i=i+20){
    float x=i;
    float y=mouseX/5*sin(i/(200/TWO_PI));

     //
    float rotX=x*cos(TWO_PI/lineNum*j)-y*sin(TWO_PI/lineNum*j);
    float rotY=x*sin(TWO_PI/lineNum*j)+y*cos(TWO_PI/lineNum*j);
     curveVertex(rotX,rotY);
  
     ellipse(rotX,rotY,10,10);
  }
     endShape();
  }
  //
 

  for(int j=0;j<lineNum;j++){
    //
    noFill();
    stroke(75,22,64);
     beginShape();
  for(int i=0;i<200;i=i+20){
 
    float x=i;
    float y=-mouseX/5*sin(i/(200/TWO_PI));

     //

    float rotX=x*cos(TWO_PI/lineNum*j)-y*sin(TWO_PI/lineNum*j);
    float rotY=x*sin(TWO_PI/lineNum*j)+y*cos(TWO_PI/lineNum*j);
     
     curveVertex(rotX,rotY);
    
    fill(75,22,64);
     ellipse(rotX,rotY,10,10);
  }
     endShape();
  }
 
  //
  for(int j=0;j<lineNum;j++){
    //
    noFill();
    stroke(253,212,88);
     beginShape();
  for(int i=0;i<200;i=i+20){
    float x=i;
    float y=-mouseX/5*sin(i/(200/TWO_PI));

     //

    float rotX=x*cos(TWO_PI/lineNum*j)-y*sin(TWO_PI/lineNum*j);
    float rotY=x*sin(TWO_PI/lineNum*j)+y*cos(TWO_PI/lineNum*j);
     
     curveVertex(rotX,rotY);
     ellipse(rotX,rotY,10,10);
  }
     endShape();
  }
 

}

