
//declare variable


float r,g,b,rd;

void setup(){//executed only once
size(640,480);
frameRate(30);

}

void draw(){//repeated forever
line(width/2,0,width/2,height);
fill(r,g,b);

ellipse(mouseX,mouseY,rd,rd);
if(mouseX>width/2){
rd=20;
  
}else{
  rd=5;
  
}

}

void mousePressed(){//event function
r=random(255);
g=random(255);
b=random(255);
rd=5;
println(keyCode);
}


