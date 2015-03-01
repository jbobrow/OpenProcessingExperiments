
Circles c;
void setup() {
 size(600,600);
	background(#202020);
	frameRate (8);
	c = new Circles(width/2, height/2);
}

void draw() {
  	if (mousePressed ==  true){
  		background(#202020);
  	}
  	c.randomSegments();
  	c.display();		
}
class Circles { 

		int centX; 
		int centY; 
		float radius; 
		color col;
		int randSeg1;
		int [] randomSeg = new int [4];
		int r = 90;
		int randColor0; 
int
randColor1; 
	Circles ( int _centX, int _centY) {
		centX = _centX; 
		centY = _centY; 
	}

	int randomSegments(){
	
		randomSeg[0] = 90;
		randomSeg[1] = 80;
		randomSeg[2] = 70;
		randomSeg[3] = 60;

		int alph = 50;

 	color [][] colorArray = { 
 								{0x50F068AA,  0x50B663E5,  0x50D98069,  0x50E5CC62 },
 								{0x50CDF071,  0x5093F09F,  0x50E5786C,  0x509B70E5 },
 								{0x50C0E564,  0x506DF078,  0x50B9F08F,  0x5068E58E },
 								{0x50E56B49,  0x50F09D76,  0x50D98F57,  0x50F0A954 },

 							};

		if (mousePressed == true){
			 r = int(randomSeg[ (int)random(0,4)] );
			 randColor0 = (int)random(0,4);
			 background(#202020);
		} else {
			 r = r;
			 randColor0 = randColor0;

		}
		
		randColor1 = (int) random(0,4);
		col = colorArray[randColor0] [randColor1] ;
		int returnValue = r;
		return returnValue;
	}

	void display() {
		
		stroke(0, 30);
		stroke(#303030);
		float x, y;
		float lastX, lastY;
		float thisRadius;
		lastX = -999;
		lastY = -999;
		int r;

		for ( float ang = 0; ang <= 360*2; ang += randomSegments() ) {
			radius = 5;
			//radius += 5;
			thisRadius = radius + perlinNoise(0.003)* 200; //<- RANDOM FUNCTION TO PLAY WITH WITH!


			float rad = radians(ang);
			x = centX + ( thisRadius * cos(rad) * 2) ;
			y = centY + ( thisRadius * sin(rad) * 2) ;

			if (lastX > - 999){
				strokeWeight(2.5);
				stroke( col/2 );
				
				line(x,y, lastX, lastY);
			}
			lastX = x;
			lastY = y;

			stroke(col);
			noFill();
			strokeWeight(3);
			ellipse(lastX, lastY, 100, 100);
		}	
	}
}

float ynoise;
float ynoise2;
float rad = 0.0;

float sine(float _rad) {
	rad = rad; 
	rad+= _rad;
 	float retValue  = sin(rad);
 	return retValue;
}

float perlinNoise(float _ynoise) {

	ynoise = ynoise + _ynoise;
 	float retValue = noise( ynoise );

 	return retValue;

}
float perlinNoise2(float _ynoise2) {

	ynoise2 = ynoise2 + _ynoise2;
 	float retValue = ( ynoise2 ) * 400;

 	return retValue;
}



