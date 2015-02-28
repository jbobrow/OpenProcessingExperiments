
/*import processing.opengl.*;*/


float theta=0.0;
float t=0.0;

int x=250;
int y=250;
int z=0;

void setup() {
  /*size(500,500, OPENGL);*/
  size(500,500, P3D);
  background(0);

}




void draw() {
	
	background(0);
	
	
	 if(keyPressed) {
	    if (keyCode == UP) 
	    { 
			z+=2;
		}
		
		if (keyCode == DOWN ) 
	    { 
			z-=2;
		}
		
		if (keyCode == LEFT) 
	    { 
			x+=2;
		}
		
		if (keyCode == RIGHT) 
	    { 
			x-=2;
		}
		
		if (key == 'r') 
	    { 
			x=width/2;
			y=height/2;
			z=0;
		}
	}
	
	pushMatrix();
		translate(x,y,z);
		
		rotateX(theta);
		rotateY(theta);
	
		fill(230, noise(t)*255, 61, 150);
		box(50, 50, 50);
		t+=.01;
		theta+=.02;
    
	 popMatrix();

}




