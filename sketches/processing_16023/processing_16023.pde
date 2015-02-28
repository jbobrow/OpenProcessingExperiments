
void setup(){
size(600,600);
noStroke();
}
void draw(){
background(255);
smooth();
//star(400,200,310,390,0);
//star(100,300,0,20,200);
star(100,100,1,40,230);
star(300,100,1,40,230);
star(500,100,1,40,230);
star(100,300,1,40,230);
star(300,300,1,40,230);
star(500,300,1,40,230);
}
void star(int x, int y,float s,float r,int c) {  
pushMatrix();  
 translate(x,y);  
 scale(s);  
rotate(radians(r));  
fill(c,50,0);  
smooth();  
strokeWeight(2);
fill(255,245,59);
beginShape();
vertex(64,32);
vertex(80,66);
vertex(117,71);
vertex(90,97);
vertex(97,134);
vertex(63,117);
vertex(30,134);
vertex(37,97);
vertex(10,71);
vertex(47,66);
vertex(64,32);
endShape();
popMatrix();
}


