
int diam = 10;
float centX, centY ;

void setup(){
size(500, 300);
frameRate(30);
smooth();
background(150);
centX = width*0.5;
centY = height*0.5;
stroke(0);
strokeWeight(5);
fill(250);
}

void draw (){
if(diam < 1000){
background(180);
ellipse(centX,centY, diam, diam);
diam += 10;
}
}
