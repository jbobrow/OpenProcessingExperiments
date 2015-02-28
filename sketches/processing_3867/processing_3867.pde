
int i,j;void draw(){colorMode(3,250);filter(11);smooth();for(j=0;j<25;j++){fill(n(5),250,250);ellipse(n(0),n(9),n(40)/6,n(40)/6);}i++;}float n(int k){return noise(j+mouseX,k+mouseY,i*0.007)*350-15;}

