
int s=600;void setup(){size(s,s);}void draw(){background(255);noFill();int i;for(i=99;i<s*3;i++){stroke(0,i);ellipse(mouseX,mouseY,i,i);}for(i=50;i<s;i++){stroke(255-i%255);ellipse(s/2-i,i,i,i);}}

