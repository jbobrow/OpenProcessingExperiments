
void setup (){
size (500,350);
frameRate(30);
}
 float x = .25;
 float y = 1.5;
 float z = .08;
 float q = .0195;
 float a = .175;
 
void draw(){
  colorMode(HSB,100);
  background(60,100,100);
  rectMode(CORNER);
  noStroke();
  fill(100,100,100);
  rect(0,0,width,1+x);
  fill(20,100,100);
  ellipse(50,380-y,45,45);
strokeWeight(7-q);
smooth();
stroke(50+x,100,100);
line(200,200,300,300);
line(300,200,200,300);
line(250,175,250,325);
line(175,250,325,250);
strokeWeight(3);
fill(255);
ellipse(250,195,20-z,20-z);
ellipse(250,305,20-z,20-z);
ellipse(195,250,20-z,20-z);
ellipse(305,250,20-z,20-z);
noFill();
rectMode(CENTER);
strokeWeight(5);
rect(250,250,30-a,30-a);
strokeWeight(3);
rect(250,250,40-a,40-a);
strokeWeight(2);
rect(250,250,60-a,60-a);
strokeWeight(1);
rect(250,250,70-a,70-a);
y++;
x++;
z=z+.08;
q=q+.0195;
a=a+.175;
}

