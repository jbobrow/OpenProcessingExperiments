


void setup(){
size( 800,600);
background (122,0,188);
noStroke();

}

void draw(){
  
  

fill(153,0,250);
triangle(400,800,400,0,0,0);
fill(153,0,250);
triangle(400,800,400,0,800,0);
fill(153,0,250);
triangle(400,800,0,400,0,800);
fill(153,0,250);
triangle(400,800,800,400,800,800);

  for(int a=10; a<=900; a = a+10){
  smooth();
    noFill();
  stroke(a-500);
  ellipseMode(CENTER);
  ellipse(400,300,a,a);


}

}
