
int i,j;void draw(){filter(11);smooth();fill(99+n(5),99+n(1),99+n(8));beginShape();for(j=0;j<28;j++)curveVertex(n(0),n(99));endShape();i++;}float n(int k){return noise(j%25+mouseX,k,i*0.007)*350-15;}

