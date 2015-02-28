
float x = 0;
float y = 0;
float z = 0;

void setup(){
size(400,400);
background(0);
noFill;
noStroke;
noLoop();
}

void draw(){
background(0);
ellipse(200,200,x+=1,y+=1);
fill(color(x,y,z+100));
}

void mousePressed(){
loop();
}

void mouseReleased(){
noLoop();
}
