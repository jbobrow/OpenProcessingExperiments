
size(600,600);
background(200,200,200);

int x;//X location
x=300;
int y;//Y location
y=300;
int bodyHeight;//bodyheight
bodyHeight=300;

ellipseMode(CENTER);

fill(80,80,80);//body
ellipse(x,y,bodyHeight,bodyHeight);

fill(0);//head
ellipse(x+bodyHeight/3,y+bodyHeight/3,bodyHeight/2.5,bodyHeight/2.5);

fill(255);//eyes
ellipse((x+bodyHeight/3-bodyHeight/8),y+bodyHeight/4.6,bodyHeight/10,bodyHeight/10);
ellipse(x+bodyHeight/3+bodyHeight/8,y+bodyHeight/4.6,bodyHeight/10,bodyHeight/10);
fill(0);
ellipse(x+bodyHeight/3-bodyHeight/8,y+bodyHeight/4.6,bodyHeight/60,bodyHeight/60);
ellipse(x+bodyHeight/3+bodyHeight/8,y+bodyHeight/4.6,bodyHeight/60,bodyHeight/60);

fill(255);//mouth
stroke(255);
strokeWeight(bodyHeight/30);
line(x+bodyHeight/3-bodyHeight/8,y+bodyHeight/2.75,x+bodyHeight/3+bodyHeight/8,y+bodyHeight/2.75);

stroke(0);//legs
line(x,y+bodyHeight/2,x-bodyHeight/2,y+bodyHeight/1.25);
line(x,y+bodyHeight/2,x+bodyHeight/2,y+bodyHeight/1.25);





