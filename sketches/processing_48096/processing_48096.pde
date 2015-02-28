
 float i,j;
float c;
void setup()
{
  size (900,900);
  background(0);
}


void draw()
{
 noStroke();
 //strokeWeight(2);
 
 
 smooth();
if(i<=2000){
  c=map(i,0,500,0,255);
 fill(0,2);
 
// rect(0,0,width, height);
  translate(width/2, (height/2));
 rotate(-(2*(PI)+radians(i)));
  fill(0,c,255-c);
//  stroke(255-c,0,255,100);
  //rect(i/100,i/50,5,5);
  ellipse(i/2,i/2,i/2,i/4);
  fill(0,c,255-c,5);
   ellipse(i/2,i/2,i,i/2);
 // rect(i/2,i/2,i/2,i/4);
  rotate((2*(PI)+radians(i)));
//background(255,255,255);
  
  //}
 //if(j<=540){
// fill(0,1);
 // rect(0,0,width, height);
 // translate(width/2, height/2);
 rotate(2*(PI) +radians(i));
  fill(0,255-c,c);
  //rect(i/100,i/100,i/10,1);
 // fill(255-c,c,255-c);
//  rect(0,i/2,4,50-i);
//background(255,255,255);
  i=i+1;
  //j=j+2;
  }
println(i);
println(j);
}
         
                                
