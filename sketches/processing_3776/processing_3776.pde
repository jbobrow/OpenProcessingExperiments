
float i,x,y;void setup(){background(0);rect(99,99,300,300);fill(0);}void draw(){if(mousePressed){x=mouseX;y=mouseY;ellipse(x,y,200,200);for(i=0;i<7;i+=.21){ellipse(x+sin(i)*99,y+cos(i)*99,40,40);}}}

