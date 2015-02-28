
float a=0;float b=0;void setup(){size(600,600);background(0);}void draw(){a=mouseX;b=mouseY;smooth();stroke(255);fill(0,50);ellipse(300,300,b,b);ellipse(300,300,b,a);ellipse(300,300,random(a),b);}

