

Particle[] pixel;
int num = 7000;// Nombre de particules
int t= 60;// Frame
int cColor = 360;
int pas = 30;
int mode = 1;

import JMyron.*;

JMyron m;//a camera object

//variables to maintain the floating green circle
float objx = 160;
float objy = 120;
float objdestx = 160;
float objdesty = 120;

//=============================================================
// Init.
//=============================================================
void setup() {
	colorMode(HSB);
	size(640, 480, P2D);
	color tempC;

	pixel = new Particle[num];
	for (int i = 0; i < num; i++) {
		tempC = color(cColor+pas, 360, random(150,360),20);
		pixel[i] = new Particle(random(10, width-10), random(10, height-10), 0, 0, tempC);
	}
	background(0);
  
 
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at 320x240
  m.trackColor(255,255,255,256*3-100);//track white
  m.update();
  m.adaptivity(10);
  m.adapt();// immediately take a snapshot of the background for differencing
  println("Myron " + m.version());
  rectMode(CENTER);
  noStroke();
}
//=============================================================
// Key management
//=============================================================
void keyPressed() {
	if (key == 'a' ) {
		mode = 1;
	}
	if (key == 'z' ) {
		mode = 2;
	}
	if (key == 'e' ) {
		mode = 3;
	}
}
//=============================================================
// Draw
//=============================================================
void draw() {
  
    m.update();//update the camera view
  drawCamera();
  
  int[][] centers = m.globCenters();//get the center points
  //draw all the dots while calculating the average.
  float avX=0;
  float avY=0;
  for(int i=0;i<centers.length;i++){
    fill(80);
    rect(centers[i][0],centers[i][1],5,5);
    avX += centers[i][0];
    avY += centers[i][1];
  }
  if(centers.length-1>0){
    avX/=centers.length-1;
    avY/=centers.length-1;
  }

  //draw the average of all the points in red.
  fill(255,0,0);
  rect(avX,avY,5,5);

  //update the location of the thing on the screen.
  if(!(avX==0&&avY==0)&&centers.length>0){
    objdestx = avX;
    objdesty = avY;
  }
  objx += (objdestx-objx)/10.0f;
  objy += (objdesty-objy)/10.0f;
	t++;
	if(mode == 3){
	//	fill(cColor,360,160,10);
	//	rect(0,0, width, height);
	}
	if(mode == 1){
	//	fill(0,0,255,255);
	//	rect(0,0, width, height);
	}
	for (int i = 0; i < num; i++) {
		PVector  v1 = new PVector(pixel[i].x, pixel[i].y, 0);
		PVector  v2 = new PVector(objx,objy, 0);
		float distance = v1.dist(v2);

		if(distance < 180 ){
			float dx = v1.x-v2.x;
			float dy = v1.y-v2.y;
			float force = 2000/distance;
			force = min(force, 1.2);
			float ax = force*dx/distance;
			float ay = force*dy/distance;
			pixel[i].vx -= ax;
			pixel[i].vy -= ay;
		}
		pixel[i].vx += random(-.2,.2);
		pixel[i].vy += random(-.2,.2);

		pixel[i].vx *= .97;
		pixel[i].vy *= .97;


		pixel[i].move(0);
		pixel[i].draw();


		if(t > 10){
			pixel[i].changeColor(cColor);
		}
	}

	if(t > 10){
		t =0;
		cColor -=1;
		if(cColor < 0){
			cColor =255;
		}
	}

}
//=============================================================
// Class Particle
//=============================================================
class Particle {
	float x, y, oldx, oldy;
	float vx, vy;
	color c;


	Particle(float _x, float _y, float _vx, float _vy, color _color){
		x = _x; y = _y;
		vx = _vx; vy = _vy;
		c = _color;
	}

	void move(int border){
		oldx = x;
		oldy = y;
		x += vx;
		y += vy;

		if(x>width-border){
			x = width-border;
			vx = -vx;
		}
		if(x<border){
			x = border;
			vx = -vx;
		}
		if(y>height-border){
			y = height-border;
			vy = -vy;
		}
		if(y<border){
			y = border;
			vy = -vy;
		}
	}

	void move(){
		x += vx;
		y += vy;
	}
	// Couleur
	void changeColor(int _c){
		int tmp;
		if (_c > (255-pas)){
			tmp = _c-(255-pas);
		}else{
			tmp= _c+pas;
		}
		c = color(tmp, 360, random(150,360),20);
	}

	void draw() {
		stroke(c);
		line(oldx, oldy, x, y);
	}
}
void drawCamera(){
  int[] img = m.differenceImage(); //get the normal image of the camera
  loadPixels();
  for(int i=0;i<width*height;i++){ //loop through all the pixels
    pixels[i] = img[i]; //draw each pixel to the screen
  }
  updatePixels();
}
public void stop(){
  m.stop();//stop the object
  super.stop();
}

