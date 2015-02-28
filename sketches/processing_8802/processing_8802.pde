
/**
*  CatastropheTwo by Krystof Pesek, licensed under Creative Commons Attribution-Share Alike 3.0 license.
*  Work: http://openprocessing.org/visuals/?visualID=8802
*  License: http://creativecommons.org/licenses/by-sa/3.0/
*
* visit more @ http://vimeo.com/kof
* if you leave this header, bend, share, spread the code, it is a freedom!
*
*   ,dPYb,                  ,dPYb,
*   IP'`Yb                  IP'`Yb
*   I8  8I                  I8  8I
*   I8  8bgg,               I8  8'
*   I8 dP" "8    ,ggggg,    I8 dP
*   I8d8bggP"   dP"  "Y8ggg I8dP
*   I8P' "Yb,  i8'    ,8I   I8P
*  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
*  88P      Y8P"Y8888P"    PI8"8888
*                           I8 `8,
*                           I8  `8,
*                           I8   8I
*                           I8   8I
*                           I8, ,8'
*                            "Y8P'
*
*/

float tras = 2.0;
PGraphics frame;
float valx = 0.0,valy = 45.23;

void setup(){
	size(320,240,P3D);
	fill(0);
	frameRate(20);
	noStroke();
	loadPixels();

	frame = createGraphics(width+20,height+20,P2D);
	frame.beginDraw();

	frame.stroke(0,120);
	frame.noFill();
	frame.strokeWeight(20);

	frame.stroke(0,40);
	frame.rect(0,0,width,height);
	frame.filter(BLUR,10);

	frame.stroke(0,120);
	frame.rect(0,0,width,height);
	frame.filter(BLUR,2);

	frame.endDraw();

	noSmooth();
}

void draw(){
	background(255);
	pre();
	prod();
	post();
}

void prod(){
	stroke(0,50);
	fill(0,10);

	pushMatrix();
	translate(width/2,height/2,100);
	for(int i  =0 ;i<30;i++){
		pushMatrix();
		rotateY(noise(frameCount/(cos(frameCount/100.0)+10)/100.0+i)*10.0);
		rotateX(noise(frameCount/(sin(frameCount/130.78)+10)/50.3+i)*10.0);
		rotateZ(noise(frameCount/(sin(frameCount/330.0)+10)/103.3+i)*10.0);
		//pushMatrix();
		//translate(noise(frameCount*i/200.0)*50,0);
		box(2*i);

		//popMatrix();
		popMatrix();
	}
	popMatrix();

}

void pre(){

	beginShape(QUADS);
	fill(80+noise(frameCount/4.0)*50);
	vertex(0,0);
	vertex(width,0);
	fill(255);
	vertex(width,height);
	vertex(0,height);
	endShape(CLOSE);

	float modx = noise(valx++)*tras-tras/2.0;
	float mody = noise(valy++)*tras-tras/2.0;
	pushMatrix();
	translate(modx,mody);
	translate(-random(2),-random(2));

}

void post(){

	translate(random(2),random(2));
	for(int i =0;i<3;i++){
		stroke(0,25);
		line(width/2+noise(frameCount/200.0+i)*160+noise(frameCount/10.0+i)*6,0,width/2+noise(frameCount/200.0+i)*160+noise(frameCount/10.0+i)*6,height);
	}
	
	popMatrix();

	//resetMatrix();
	image(frame,-random(2),-random(2));
	for(int i =0;i<pixels.length;i++)
		pixels[i] = color(brightness(pixels[i])+random(-25,3));
	filter(BLUR,0.76);
}

