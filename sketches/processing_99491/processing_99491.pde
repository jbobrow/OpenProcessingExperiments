
size(240, 240);
background(0);
int centerx=width/2;//this is to put the circle at the center
int centery= height/2;//this is to put the circle at the center
noStroke();
int myScale=255;
fill(255-myScale);//fills begining circle to zero
ellipse(centerx, centery, myScale, myScale);//initial circle
for (int i=myScale; i>0; i=i-1)//for loop
{
fill(255-i);//the fill changes until it gets to 254--starts from black and lightens 
ellipse(centerx, centery, i, i);// draw a smaller circle
}
