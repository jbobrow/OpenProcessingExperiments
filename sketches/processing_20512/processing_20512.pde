

//Lindsay Laven Project 3

void setup(){
size(600,600);
background(121,14,193);

} 



void draw(){
  
  //trippy ellipse
fill (101, 6, 198);
smooth ();
for (int d = 550; d > 0; d -= 35) {
  ellipse (150, 228, d, d);
  ellipse (153, 335, d, d);
  ellipse (173, 399, d, d);
  ellipse (171, 117, d, d);
  ellipse (514, 114, d, d);
  ellipse (514, 195, d, d);
  ellipse (522, 269, d, d);
  ellipse (501, 350, d, d);
}

//taken from processing.org blog-code by: blandoatmeal1--tweaked by me
  for(int g=0;g<400;g++)
  Triangles(g*400, 400,2);
}//parameters 1 and 2 and 3 
void Triangles(float rx, float ry, float rz) 
{
  frameRate(90);
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
  for(int a=3;a<30;a++){
  triangle(w+a,x-a,s1,s1,s2,s2);}
  
 


}}

