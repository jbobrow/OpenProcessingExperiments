

int xpos, ypos, distance;
int guysize =10;

Baddy myBaddy;

Baddy[] baddies = new Baddy[8];


void setup()
{
  size(500,500);
  xpos= width/2;
  ypos= height-50;

	for (int i=0; i< baddies.length; i++)	
	{
		baddies[i]= new Baddy();
		println(baddies[i].xpos);
	}
	
	println("hi");
	

}

void draw()
{
  
  background(255);

  if(keyPressed)
	{
	if (keyCode == LEFT) {xpos-=2;}
    if (keyCode == RIGHT) {xpos+=2;}
   	if (keyCode == UP) {ypos-=2;}
    if (keyCode == DOWN) {ypos+=2;}
	}
  
	stroke(1);
	strokeWeight(2);
	fill(#B22929);
	//you
	rect(xpos, ypos, guysize, guysize);
	

	smooth();
	
	for (int i=0; i< baddies.length; i++)	
	{
		baddies[i].display();
		baddies[i].move();	
		//baddies[i].detectHit(xpos, ypos);
		
	}  

}



class Baddy
{
	color r, g, b;
	float xpos, ypos, xspeed, yspeed;
	int baddysize;
	
	Baddy()
	{
		r = color(50, int(random(255)));
		g = color(50, int(random(255)));
		b = color(50, int(random(255)));
		xpos = random(width);
		ypos = random(height);
		xspeed= random(-1, 1);
		yspeed= random(-1, 1);
		baddysize = int(random(10, 30)*3);
	}
	
	void display()
	{
		fill(r, g, b, 150);
  		noStroke();
		ellipse(xpos, ypos, baddysize, baddysize);
		
	}
	
	void move()
	{
		xpos-=xspeed;
		ypos-=yspeed;
		if ((xpos>width)||(xpos<0)) {xspeed=xspeed*-1;}
		if ((ypos>width)||(ypos<0)) {yspeed=yspeed*-1;}
	}
	
	//bool detectHit(int guyx, int guyy)
	{
	 	/*circleDistance.x = abs(xpos - guyx - guysize/2);
	    circleDistance.y = abs(ypos - guyy - guysize/2);

	    if (circleDistance.x > (guysize/2 + circle.r)) { return false; }
	    if (circleDistance.y > (guysize/2 + circle.r)) { return false; }

	    if (circleDistance.x <= (guysize/2)) { return true; } 
	    if (circleDistance.y <= (guysize/2)) { return true; }

	    cornerDistance_sq = (circleDistance.x - guysize/2)^2 +
	                         (circleDistance.y - guysize/2)^2;

	    return (cornerDistance_sq <= (circle.r^2));	*/
		
	}


}




