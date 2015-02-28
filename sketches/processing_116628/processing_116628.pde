
void setup(){
	size(600, 600,P3D);
	frameRate(60);
}

float rX = 0;
float rY = 0;

void draw(){

	colorMode(RGB,255);
	background(255, 255, 255, 255);

	colorMode(HSB,255);
	float size = 5;
	int num = 20;
	pushMatrix();
	translate(width/2, height/2, 300);
	noStroke();

	rotateY(rY);
	rotateX(rX);

	for (int i = 0; i<num; i++){
		for (int j = 0; j<num; j++){
			for (int k = 0; k<num; k++){

				pushMatrix();
				translate(i*size - num*size/2, j*size - num*size/2, k*size - num*size/2);
				fill((float)i/num * 255, (float)j/num * 255, (float)k/num * 255,255);
				box(size, size, size);

				popMatrix();
			}
		}
	}
	popMatrix();

}

void mouseDragged(){
	rY += (mouseX - pmouseX) * 0.01;
	rX += -(mouseY - pmouseY) * 0.01;

}


