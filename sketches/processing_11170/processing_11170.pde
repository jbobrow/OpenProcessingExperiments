
/**
* Free Form construction by Kof 2010
*
*/


import peasy.*;



//////////////////////////////// >

PeasyCam cam;

Rez o[] = new Rez[200];

//////////////////////////////// >
void setup(){

	size(800,480,P3D);
	noStroke();
	fill(0,30);

	noSmooth();

	for(int i = 0;i<o.length;i++)
		o[i] = new Rez(i);

	cam = new PeasyCam(this, 800);
	cam.setMinimumDistance(600);
	cam.setMaximumDistance(3000);

	textFont(loadFont("Norasi-Italic-16.vlw"));
	textMode(SCREEN);

}



//////////////////////////////// >
void draw(){


	background(255);
	stroke(0,10);
	for(int i = -o.length/2;i<o.length/2;i+=2){

		//   line(i*5,600,0,i*5,0,0);
		//    line(0,i*5,600,0,i*5,0);

		line(-300,-300,i*5,-300,300,i*5);
		line(-300,300,i*5,300,300,i*5);
		line(-300,300,i*5,300,300,i*5);
	}

	stroke(#6A4B2F,40);

	pushMatrix();
	resetMatrix();
	scale(0.001);
	translate(-738,-369);
	
	
	
	for(int n = 0;n<o.length;n++){
		beginShape();
		for(int i = 0;i<o[0].q;i++){
			//stroke(0,(sin(i/o.length)+1)*30);
			vertex(o[n].xs[i],o[n].ys[i],0);
		}
		endShape(CLOSE);
	}
	
	
	line(-width,0,width*3,0);
	line(0,-width,0,width*3);
	
	translate(507,0);
	for(int i = 0;i<o[0].q;i++){
		beginShape();
		for(int n = 0;n<o.length;n++){
			//stroke(0,(sin(i/o.length)+1)*30);
			vertex(o[n].zs[i],o[n].ys[i]);
		}
		endShape();
	}

	translate(-507,507);
	for(int i = 0;i<o[0].q;i++){
		beginShape();
		for(int n = 0;n<o.length;n++){
			//stroke(0,(sin(i/o.length)+1)*30);
			vertex(o[n].xs[i],o[n].zs[i]);
		}
		endShape();
	}

	popMatrix();

	for(int i = 0;i<o[0].q;i++){
		beginShape();
		for(int n = 0;n<o.length;n++){
			//stroke(0,(sin(i/o.length)+1)*30);
			vertex(o[n].xs[i],300,o[n].zs[i]);
		}
		endShape();
	}



	for(int i = 0;i<o[0].q;i++){
		beginShape();
		for(int n = 0;n<o.length;n++){
			//stroke(0,(sin(i/o.length)+1)*30);
			vertex(-300,o[n].ys[i],o[n].zs[i]);
		}
		endShape();
	}


	fill(0,120);
	text("Freeform construcion by Kof",width-220,height-10);

	noFill();
	for(int i = 0;i<o.length;i++){
		o[i].draw();
	}

	pushStyle();
	noFill();
	for(int i = 0;i<o[0].q;i++){
		beginShape();
		for(int n = 0;n<o.length;n++){
			stroke(0,(sin(i/o.length)+1)*30);
			vertex(o[n].xs[i],o[n].ys[i],o[n].zs[i]);
		}
		endShape();
	}
	popStyle();


	line(-width/4,0,0,width/4,0,0);
	line(0,-width/4,0,0,width/4,0);
	line(0,0,-600,0,0,600);
}

//////////////////////////////// >
class Rez{
	float x,y,r;
	float step = 0.3;
	int id;
	float xs[],ys[],zs[];
	int q = 0;

	Rez(int _id){
		id = _id;
		x = width/2;
		y = height/2;
		r = 40;


		for(float f = -PI;f < PI;f+=step)
			q++;

		xs = new float[q];
		ys = new float[q];
		zs = new float[q];
	}

	void draw(){

		r  = noise((frameCount+id)/100.33)*120+noise((frameCount+id)/1000.43)*21+4;
		beginShape();
		int i = 0;
		for(float f = -PI;f < PI;f+=step){
			xs[i] = cos(f)*r*2*noise(cos(f/2.0)+id/10.0+frameCount/20.0)+(noise((id+frameCount)/101.0)-0.5)*500;
			ys[i] = sin(f)*r*2*noise(sin(f/2.0)+id/10.0+frameCount/20.1)+(noise((id+frameCount)/111.0)-0.5)*500;
			zs[i] = id*5-((o.length/2)*5);

			stroke(0,(sin(f)+1)*70);
			vertex(xs[i],ys[i],zs[i]);
			i++;
		}
		endShape(CLOSE);
	}
}

