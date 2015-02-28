
float i,j;
float c;
void setup()
{
  size (1000,1000);
  background(0);
}


void draw()
{
 // noStroke();
 strokeWeight(2);
 
 smooth();
if(i<=540){
  c=map(i,0,540,0,255);
 fill(0,3);
 
// rect(0,0,width, height);
  translate(width/2, (height/2)+100);
 rotate(-(2*(PI)+radians(i)));
  fill(255-c,c,255-c);
  stroke(255-c,0,255,100);
  rect(0,i,4,200-i);
  rotate((2*(PI)+radians(i)));
//background(255,255,255);
  
  //}
 //if(j<=540){
 fill(0,1);
 // rect(0,0,width, height);
 // translate(width/2, height/2);
 rotate(2*(PI) +radians(i));
  fill(255-c,c,255-c);
  rect(0,i,4,200-i);
//background(255,255,255);
  i=i+2;
  //j=j+2;
  }
println(i);
println(j);
}
                
