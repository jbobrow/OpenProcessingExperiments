
float d = 0;
float c = 0;
float x1 = 0;
float y1 = 0;

void setup() {
 size(400,400);
background(255); 
smooth();
x1 = random(0,width);
y1 = random(0,height);
}

void draw() {
 d = dist(width/2,height/2,x1,y1);
 c = map(d,0,width/2,0,255); 
 stroke(c);
 fill(255,128);
 line(width/2,height/2,x1,y1);
 ellipse(x1,y1,10,10);
 x1 += random(-3,3);
 y1 += random(-3,3);
 if (d > 200) {setup();}
}

void mouseClicked() {
 setup(); 
}
