
void setup()
{
size(500, 500);
 background(255);
 smooth();
 scale(0.4);
 int i=125;
 translate(i, i);
 lieul();
 translate(i*2, 0);
 lieul();
 translate(i*2, 0);
 lieul();
 translate(i*2, 0);
 lieul();
 translate(i*2, 0);
 lieul();
 //2
 translate(0, i*2);
 lieul();
 translate(-i*2, 0);
 lieul();
 translate(-i*2, 0);
 lieul();
 translate(-i*2, 0);
 lieul();
 translate(-i*2, 0);
 lieul();
 //3
 translate(0, i*2);
 lieul();
 translate(i*2,0);
 lieul();
  translate(i*2,0);
 lieul();
  translate(i*2,0);
 lieul();
  translate(i*2,0);
 lieul();
 //4
  translate(0,i*2);
 lieul();
  translate(-i*2,0);
 lieul();
  translate(-i*2,0);
 lieul();
  translate(-i*2,0);
 lieul();
  translate(-i*2,0);
 lieul();
 //5
  translate(0,i*2);
 lieul();
  translate(i*2,0);
 lieul();
  translate(i*2,0);
 lieul();
  translate(i*2,0);
 lieul();
  translate(i*2,0);
 lieul();
}

void lieul(){
  noStroke();
 
  //translate(width/2, height/2);
  
  for (int i=0;i<360;i=i+30){
  rotate(radians(90));
  fill(255,135,100,60); 
  //ㄱ
  rect(-30,-85,100,35);
  rect(35,-85,35,75);
  noFill();
  //ㄴ
  fill(110,185,95,60);
  rect(-30,-5,100,35);
  rect(-30,-45,35,65);
  noFill();
  fill(115,155,210,60);
  rect(-30,-45,100,35);
  noFill();
 
 }
}


