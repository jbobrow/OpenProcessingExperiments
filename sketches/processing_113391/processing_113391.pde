
void setup() {
noStroke();
colorMode(HSB);
size(500,500);
background(255);
fill(random(0,255),random(100,255),220,150);
beginShape();
vertex(width/2,height/2);
vertex(150,random(100,300));
vertex(random(height/2,300),random(height/2,300));
vertex(random(height/2,300),random(height/2,300));
endShape();
fill(random(0,255),random(100,255),220,150);
beginShape();
vertex(width/2,height/2);
vertex(180,random(width/2,490));
vertex(random(250,450),random(0,300));
vertex(random(0,300),random(300,400));
endShape();
fill(random(0,255),random(100,255),220,150);

beginShape();
vertex(width/2,height/2);
vertex(random(0,250),random(0,490));
vertex(random(0,300),random(0,300));
vertex(random(0,300),random(0,300));
endShape();
}

