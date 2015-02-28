
float n(float d){return noise(p+d);}float p,i,y=99;void draw(){p+=.01;background(#f0f0a8);ellipse(20,20,20,20);for(i=1;i<100;i++){line(i,99,i,80*n(i/100));}y=min(80*n(.5),y+.35);ellipse(50,y-5,8,8);}

