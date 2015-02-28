
void setup() {
  size(400,400);
}
void draw() {
background(#cc99ff);
fill(#ffff99);
noStroke();
for(int a=10; a<450; a=a+30)
for(int b=10; b<450; b=b+30)
  {  
  ellipse(a,b,10,10);
  }
  
  for( float x=0; x<400; x=x+40 ){
  for( float y=0; y<400; y=y+40 ){
  pushMatrix();
  translate(x*2,y*2);
  rotate(radians(frameCount+x));
  scale(0.4);
  crying_draw();
  popMatrix();
  }
 }
}

void crying_draw() {
  int[] l={8,12,25,30,35,40,43,45,47,50};
int[] m={58,60,69,70,73,78,80,85,100,105};
int[] n={110,111,115,119,120,125,130,140,165,170};

//ears
fill(#ffefbf);
strokeWeight(4);
stroke(0);
ellipse(l[4],m[8],l[2],l[2]);
line(l[4],m[8],l[3],m[8]);
ellipse(n[8],m[8],l[2],l[2]);
line(n[8],m[8],n[9],m[8]);

//face
ellipse(m[8],m[8],n[6],n[6]);

//eyes
fill(0);
noStroke();

ellipse(m[6],m[8],l[0],l[0]);
ellipse(n[4],m[8],l[0],l[0]);

//eyebrow
stroke(#ff9900);
strokeWeight(3);
line(m[6],m[6],m[3],m[7]);
line(n[2],m[6],n[5],m[7]);

//nose
stroke(0);
strokeWeight(1);
line(m[8],m[8],m[8],n[2]);

//mouth
fill(#ff3300);

rect(m[6],n[5],l[5],l[1]);

//tooth
fill(255);
noStroke();
beginShape();
vertex(m[7],n[5]);
vertex(m[7],n[6]);
vertex(n[2],n[6]);
vertex(n[2],n[5]);
endShape(CLOSE);

//tear
fill(#33ccff);
ellipse(m[3],n[2],l[0],l[0]);
beginShape();
vertex(m[4],n[3]);
vertex(m[5],m[9]);
vertex(m[2],n[1]);
endShape(CLOSE);

//blingbling
fill(255);
beginShape();
vertex(n[0],l[9]);
vertex(n[6],m[1]);
vertex(n[7],m[0]);
vertex(n[5],48);
endShape(CLOSE);

beginShape();
vertex(m[8],l[7]);
vertex(n[0],l[8]);
vertex(n[5],l[7]);
vertex(n[2],l[6]);
endShape(CLOSE);

//a few hair
strokeWeight(1);
stroke(0);
for(int x=90; x<120; x=x+8)
for(int y=20; y<40; y=y+20)
{
  line(x,y,100,35);
}
}
