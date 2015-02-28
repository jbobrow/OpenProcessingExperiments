
int num = 5;
int margin = 5;

int x = num;
int y = num;
int[] axeX = new int[x+1];
int[] axeY = new int[y+1];
float gr = (1 + sqrt(5))/2; // Golden Ratio
boolean[][] grid = new boolean[x][y];
float[] PaxeX = new float[x+1];
float[] PaxeY = new float[y+1];

void setup(){
	size(500, 500);
	smooth();
	strokeWeight(5);
	noLoop();
}

void draw(){
	fill(254,250,231); //mondorian Cream
	noStroke();
	rect(0, 0, width, height);
	stroke(0);
	pushMatrix();

	translate(margin, margin); //margin
	for (int i = 0; i<x+1; i++){
		PaxeX[i] = pow(gr, int(random(0,3)));
	}
	for (int i = 0; i<y+1; i++){
		PaxeY[i] = pow(gr, int(random(0,3)));
	}
	float sumX = 0;
	float sumY = 0;
	for (int i = 0; i<x; i++){
		sumX += PaxeX[i];
		sumY += PaxeY[i];
	}
	for (int i = 0; i<x; i++){
		PaxeX[i] = 	PaxeX[i]*(width-margin)/sumX;
		PaxeY[i] =  PaxeY[i]*(height-margin)/sumY;
	}
	axeX[0] = 0;
	axeY[0] = 0;
	for (int i = 0; i<x; i++){
		axeX[i+1] = int(axeX[i]+PaxeX[i]);
		axeY[i+1] = int(axeY[i]+PaxeY[i]);
	}
	rect(axeX[0], axeY[0], axeX[1]-axeX[0], axeY[1]-axeY[0]);
	for (int i = 0; i<x; i++){
		for (int j = 0; j<y; j++){
			rect(axeX[i], axeY[j], axeX[i+1]-axeX[i], axeY[j+1]-axeY[j]);
		}
	}
	for (int i = 0; i<10; i++){
		int colorSeed = int(random(4));

		if (colorSeed == 0){
			fill(39,137,188);//Mondrian Blue
		}
		else if(colorSeed == 1){
			fill(255,210,0);//Mondrian Yellow
		}
		else if(colorSeed == 2){
			fill(226,50,39);//Mondrian Red
		}
		else if(colorSeed == 3){
			fill(254,250,231);//Mondrian Cream
		}
		int n = int(random(x));
		int m = int(random(y));
		int w = int(random(1,x-n));
		int h = int(random(1,y-m));
		strokeWeight(5);
		rect(axeX[n], axeY[m], axeX[n+w]-axeX[n], axeY[m+h]-axeY[m]);
	}
	noFill();
	strokeWeight(11);
	stroke(254,250,231);
	rect(axeX[0], axeY[0], axeX[x], axeY[y]);	
	strokeWeight(5);
	popMatrix();
}
void mousePressed(){
	redraw();
}


