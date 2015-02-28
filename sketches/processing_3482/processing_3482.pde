
float a=0;float b=0;void draw(){smooth();translate(width/2,height/2);rotate(a/b);stroke(b,a,99);ellipse(a,b,a/b,a/b);ellipse(a,b,b,a);a+=1;b-=0.05;if (a>width/2){a=random(width);a=-a;b=a/b;}}

