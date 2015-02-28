
float myNum;//declare variable

void setup(){
  size(800,600);
  smooth();
  strokeWeight(.5);
  colorMode(HSB,360,100,100,100);
  myNum =0;
}

void draw(){
//taken from processing.org
  if (mouseX < 100) {
    cursor(HAND);
  } else {
    cursor(TEXT);
  }

  background(186,149,255);
  line(myNum,myNum,500,100);
  line(myNum,myNum,600,100);
  line(myNum,myNum,700,100);
  line(myNum,myNum,800,100);
   line(myNum,myNum,900,100);
    line(mouseX,mouseY,500,60);
    line(mouseX,mouseY,600,70);
    line(mouseX,mouseY,700,80);
    line(mouseX,mouseY,800,90);
    ellipse(mouseX,mouseY,600,70);
    fill(181,97,95);
  
    ellipse(mouseX,mouseY,700,80);
      fill(54,97,95);
    ellipse(mouseX,mouseY,700,80);
    
  stroke(0,100,605,255);
  myNum++;
 ellipse(width/2,height/4,100,500);
  ellipse(width/8,height/8,200,myNum);
  fill(260,45,875);
   stroke(20,100,65,255);
   ellipse(width/2,height/2,90,myNum);
   fill(25,184,437);
   ellipse(mouseX,mouseY,300,60);
if(myNum>400){
  myNum=0;
}
  if(mouseX>400){
    fill(34,450,56);
}
else{}
 fill(0,88,76);
}



