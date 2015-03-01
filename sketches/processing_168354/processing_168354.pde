
 //1/3/10 draw snowflakes
float a ;
float b ;
float theta;
float c;
float degreeOfShift;
float randomExtend;
float rad;
float randomBranch;
float h;
void setup(){
  colorMode(HSB, 360, 100, 100);
  a = 0;
  b = 0;
  degreeOfShift = radians(60.0);
  size(900,900);
  background(0,0,0);
  stroke(255);
  println(a);
  println(b);
  println(c*cos(theta));
  smooth();
}
void draw(){
  rad = random(0,30);
  translate(width/2, height/2);
  theta = atan(b/a);
  c = sqrt(a*a+b*b);
  h = random(0,360);
  noStroke();
  if(c>width*.45){}
  else{
    for(int i=1;i<=6;i++){
      fill(h, 100, 75); //fill(h, 5000/c, 100);
      ellipse(c*cos(theta+degreeOfShift*i), c*sin(theta+degreeOfShift*i), rad, rad);
      ellipse(-c*cos(theta+degreeOfShift*i), c*sin(theta+degreeOfShift*i), rad, rad);
    }
  }
  randomExtend = random(0,100);
    randomBranch = random(0,100);
  if(randomExtend>70){
    a +=0;
    b -=15;
  }
  else if(randomBranch > 80){
    a -=0;
    b += 15;
  }
  else 
  {
    a = a+random(-22,22);
    b = b+random(-22,22);
  }
}
void mouseReleased(){
  saveFrame("Art-####.png"); 
}
void keyPressed(){
  print("ho");
  setup();
}








