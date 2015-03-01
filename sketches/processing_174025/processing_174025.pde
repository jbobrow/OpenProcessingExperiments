
color c;
void setup(){
size(300,300);
noStroke();
c=color(255,0,0);
}
void draw(){
background(0,0,0);
ellipse(150,100,100,100);//tete
rect(100,100,100,150);//corps
triangle(133,250,100,250,116,290);//pied
triangle(133,250,166,250,150,290);//pied
triangle(166,250,200,250,182,290);
fill(c);
ellipse(130+mouseX /100,80+mouseY/100,25,25);//eye
ellipse(170+mouseX/100,80+mouseY/100,25,25);
fill(150);
}
void mousePressed(){
c=color(random(100,200),random(0),random(0));
}
