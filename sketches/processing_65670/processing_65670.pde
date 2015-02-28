
PFont f;

size(1100,680);
background(0);
smooth();
f=loadFont("SegoePrint-48.vlw");
textFont(f,48);

float theta=0.0;

for(int j=0;j<12;j++)
{
	int x0=340,y0=340;
	int N=14;
	int a=0,b=1,c=1;
	int xr=x0-N;
	int yr=y0;
	for(int i=0;i<=7;i++)
	{
		strokeWeight(2);
		noFill();
		stroke(255);
		float t;
		float sqr=sqrt((xr-x0)*(xr-x0)+(yr-y0)*(yr-y0));
		if(sqr==0)
			t=0;
		else
			t=asin((yr-y0)/sqr);
		if(xr>x0)
			t=PI-t;
		arc(x0-sqr*cos(radians(theta)+t),y0+sqr*sin(radians(theta)+t),2*b*N,2*b*N,i%4*PI/2-radians(theta),i%4*PI/2+PI/2-radians(theta));
		if(i%4==0)
			yr=yr-a*N;
		if(i%4==1)
			xr=xr+a*N;
		if(i%4==2)
			yr=yr+a*N;
		if(i%4==3)
			xr=xr-a*N;
		a=b;
		b=c;
		c=a+b;
		
	}
	theta=theta+30;
}

theta=0.0;

for(int j=0;j<12;j++)
{
	int x0=340,y0=340;
	int N=14;
	int a=0,b=1,c=1;
	int xr=x0+N;
	int yr=y0;
        
	for(int i=0;i<=7;i++)
	{
		strokeWeight(2);
		noFill();
		stroke(255);
		float t;
		float sqr=sqrt((xr-x0)*(xr-x0)+(yr-y0)*(yr-y0));
		if(sqr==0)
			t=0;
		else
			t=asin((yr-y0)/sqr);
		if(xr>x0)
			t=PI-t;
		arc(x0-sqr*cos(radians(theta)+t),y0+sqr*sin(radians(theta)+t),2*b*N,2*b*N,-i%4*PI/2+PI/2-radians(theta),-i%4*PI/2+PI-radians(theta));
		if(i%4==0)
			yr=yr-a*N;
		if(i%4==1)
			xr=xr-a*N;
		if(i%4==2)
			yr=yr+a*N;
		if(i%4==3)
			xr=xr+a*N;
		a=b;
		b=c;
		c=a+b;
		
	}
	theta=theta+30;
}

strokeWeight(2);
noFill();
stroke(255);
rect(815,250,50,50);
arc(815,250,100,100,0,PI/2);
rect(765,250,50,50);
arc(815,250,100,100,PI/2,PI);
rect(765,150,100,100);
arc(865,250,200,200,PI,PI*3/2);
rect(865,150,150,150);
arc(865,300,300,300,PI*3/2,2*PI);
rect(765,300,250,250);
arc(765,300,500,500,0,PI/2);

textSize(30);
fill(255);
text("Fibonacci Spiral",772.5,121);
textSize(22);
text("1",785,270);
text("1",835,270);
text("2",805,240);
text("2",845,200);
text("3",875,240);
text("3",935,295);
text("5",880,320);
text("5",770,440);
text("@http://www.openprocessing.org/",700,585);
text("by orange+v",820,610);

