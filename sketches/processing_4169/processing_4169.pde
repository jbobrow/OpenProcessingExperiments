
void draw(){background(0);smooth();float p=PI/30;for(float i=17;i>.5;i*=.9){beginShape();for(int j=0;j++<61;)vertex(mouseX+i*20*cos(p*j)-30*cos(3*p*j),mouseY+i*20*sin(p*j)-30*sin(3*p*j));endShape();}}
    

