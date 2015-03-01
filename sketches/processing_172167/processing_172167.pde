
color c;
void setup() { //setup function called initially, only once
size(300,300); 
noStroke();
c=color(255,0,0);
}

void draw() {  //draw function loops 
background(255,248,21);
ellipse(150,100,100,100);
rect(100,100,100,150);
fill(c);
triangle(100,250,150,250,125,300);
triangle(150,250,200,250,175,300);
ellipse(115+mouseX/10,80+mouseY/10,30,30);
ellipse(155+mouseX/10,80+mouseY/10,30,30);
fill(245);
}
void mousePressed(){
c=color(random(255),random(255),random(255));
}
