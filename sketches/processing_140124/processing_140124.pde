
float angle= 0.1;
float x,y;
float r=50;
void setup(){
size(400,400);

}
void draw(){
  background(220);
  fill(0);
  translate(width/2,height/2);
  for(int i=1;i<=10;i++) // i <100 karne se path increase hota hai
  {
  angle +=.005;// angle ka increment barhaney se fast hota hai.//0.1
  //rotate(1.7); // comment this and try down values. 
  rotate(1.25);
  //rotate( 50.9);
  rotate( 12.7);// also check these values 0.7 0.9

  x=r*cos(angle);
  y=r*cos(angle);
  ellipse(x,y,r,r);
  }
  
}
