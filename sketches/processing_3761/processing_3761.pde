
void draw(){noFill();filter(BLUR);for(int i=0;i<width;i+=9){stroke(i);float n=noise(mouseY*0.9,0.02,mouseX/2);bezier(i,mouseX+n*40,random(i),mouseY-n*40,i,i,i,i);}}

