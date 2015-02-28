
float a;float t=TWO_PI;void draw(){noFill();strokeWeight(2);int s=2;for(float i=0;i<6;i+=t/73){stroke(cos(a+i)*128+128,sin(a+i)*128+128,128);ellipse(50,50,s,s);s+=2;}a+=t/73;if(a>t)a-=t;}

