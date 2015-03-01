
//declare variable


float r,g,b;

void setup(){//executed only once
size(320,240);
frameRate(30);

}

void draw(){//repeated forever

fill(r,g,b);

ellipse(mouseX,mouseY,20,20);
if(mousePressed){
background(128,10);
  
}

}

void mousePressed(){//event function
r=random(255);
g=random(255);
b=random(255);
println(keyCode);
}

