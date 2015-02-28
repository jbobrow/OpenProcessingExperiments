
float x=50,y=50,t=3,s=2,m;void draw(){background(0);m=mouseY;ellipse(x,y,9,9);t=x>95||x<10&&y<m+25&&y>m-25?-t:t;x=x<5?50:x;s=y>95||y<5?-s:s;x+=t;y+=s;rect(5,m-25,5,50);}

