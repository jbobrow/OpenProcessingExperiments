
//Processing.org
int dir;
int x;
float myNum;

void setup(){
  smooth();
  dir=1;
  x=0;
  size(500,500);
  myNum=0;
}
void draw(){
  background(255);
  noStroke();
  fill(myNum, 135, 72);
  rect(30, 20, 125, myNum, myNum);
  myNum+= 1.5; 
  if (myNum>400) {
    myNum=0;
  }

text("clickme", 183,240);
fill(35);
if(mousePressed == true){
    fill(35);
  ellipse(150,445,82,82);

    fill(162,34,34);
    ellipse(250,445,82,82);
    
   fill(165,122,77);
    ellipse(350,445,82,82);

}
else{
   fill(135, 72);
  x+=dir;
  ellipse(400,x,100,100);
  if(x>width){
    dir=-1;
    
  }else if (x<0){
    dir=1;
  }
  x+=dir;

}
}
