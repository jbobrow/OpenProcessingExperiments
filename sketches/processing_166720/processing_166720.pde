
void setup(){
  size(500,500);
}
void draw(){
  stroke(#FA0A0A);
  strokeWeight(1);
line(0,0,500,500);
line(100,0,500,400);
line(200,0,500,300);
line(300,0,500,200);
line(400,0,500,100);
  

  
  
for(int i=0;i<500;i=i+50){
  stroke(#FFEB03);
  strokeWeight(4);
  line(i,i,i,500);
  
  fill(#03FF0C);
  stroke(#FA0A0A);
  rect(200,200,200,200);
  
  noStroke();
  fill(255,0,0);
  ellipse(350,350,100,100);

}
}
