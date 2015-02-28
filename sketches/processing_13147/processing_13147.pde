
//program that draws random squares of color when mouse is moved. squares change size with how fast mouse moves.

void setup(){
size(400,400);
background(255);
}
void draw(){
  for(int g=0;g<400;g++)
  Squares(g*400, 400,2);
}//parameters 1 and 2 and 3 
void Squares(float rx, float ry, float rz) 
{
  frameRate(60);
  if(mousePressed){  
  float w=random(rx);
  float x=random(ry);
  float z=random(rz);
    float s1 = dist(mouseX,mouseY, pmouseX,pmouseY) + 1;
      float s2 = dist(mouseX,mouseY, pmouseX,pmouseY) + 1;
  float t=random(255);
  float u=random(255);
  float v=random(255);
  noStroke();
  fill(t,u,v,t);
  strokeWeight(z);
  stroke(t,u,v);
  for(int a=0;a<30;a++){
  rect(w+a,x-a, s1, s2);}
  }}                
                                                                                
