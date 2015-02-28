
void setup(){
size(400,400);
background(0);
}

void draw(){
if ((mouseX < 200) && (mouseY <200)){
noStroke();
fill (255-mouseX,250-mouseY,100);
rect (width/8,height/8,width/6,height/6);
rect (width/1.4,height/1.4,width/6,height/6);

}
else if((mouseX>0) && (mouseY<400)){
noStroke();
fill (mouseX-200,250-mouseY,200);
ellipse(width/2,height/2,width/2,height/2);
}

if((mouseX>0) && (mouseY<400)){
stroke(260-mouseX,260-mouseY,50);
strokeWeight(4);
line(380,10,10,380);
}
}



