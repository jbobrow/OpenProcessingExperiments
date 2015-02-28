
float t,i,z;void draw(){background(0);noStroke();t++;for(i=0;++i<199;){z=n(0)-t;z*=z/99;fill(n(7),n(8),n(9),min(60,sq(400/z)));ellipse(n(2),n(3),z,z);}}float n(float a){return noise(t/2000+a+i)*512;}

