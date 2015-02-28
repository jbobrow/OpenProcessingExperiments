
float a,b,r;int s,c;void draw(){randomSeed(s);smooth();for(c=0;c<random(50);++c){r=random(50);ellipse(random(width),random(height),r,r);}b=sin(a+=.1);if(b>.9)s=(int)random(999);filter(BLUR,25*b);}

