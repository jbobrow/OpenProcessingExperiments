
float g=0,j,i;void draw(){background(99);smooth();fill(230);beginShape();for(i=0;i<2*PI;i+=PI/64){j=(i>6.2)?0:i;vertex(250+(99+80*noise(j,g))*cos(j),250+(99+80*noise(j,g))*sin(j));}endShape();g+=.01;}

