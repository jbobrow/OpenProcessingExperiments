
int perro=0;
void setup(){
size(600,600);
background(random(255),random(255),random(255));
}
void draw() {
  perro=perro+1;
  background(random(255),random(255),random(255));
stroke(55,100,100);
line(0,0,width/2,height/2);
stroke(255,180,90);
line(width,0,width/2,height/2);
stroke(150,255,90);
line(width/2,height/2,width/2,height);
stroke(random(255),random(255),random(255));
line(width/3,0,width/3,height);
stroke(random(255),random(255),random(255));
line(width*2/3,0,width*2/3,height);
stroke(random(255),random(255),random(255));
line(0,height/3,width,height/3);
stroke(random(255),random(255),random(255));
line(0,height*2/3,width,height*2/3);
noStroke();
fill(random(250),random(250),random(250));
ellipse(mouseY,mouseX,80,80);
ellipse(mouseX,mouseY,80,80);
ellipse(width-mouseX,mouseY,80,80);
ellipse(mouseX,height-mouseY,80,80);
println(mouseX);
}

