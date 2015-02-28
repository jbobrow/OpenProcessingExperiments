
float x=9,y=9,z=PI/5,t=z;
void draw(){background(0);
rect(x+=cos(t),y+=sin(t),9,9);
textFont(loadFont("a"));
if((x<0)|(y<0)){text("Fuck!",1,9);t-=z;}
if((y>90)|(x>90)){text("Shit!",1,9);t-=z;}
}

