

Interpreter brush;
//PImage divka;

void setup(){
	size(520,640,P2D);
	frameRate(25);
	brush = new Interpreter("wermer.jpg","splat.png",5000);
	//divka = loadImage("wermer.png");
	//divka.filter(GRAY);
	background(0);
	
}


void draw(){
	noTint();
	image(g,(noise(frameCount)-0.5)*20.0,(noise(frameCount*2)-0.5)*20.0);
	
	brush.draw();
	
	//image(divka,0,-40,divka.width/1.4,divka.height/1.4);


}

class Interpreter{
	PImage src;
	PImage vzor;
	color c[];
	

	Interpreter(String file, String file2, int num){
		vzor = loadImage(file2);
		src = loadImage(file);
		src.loadPixels();
		//src.filter(GRAY);
		c = new color[num];
		for(int i = 0;i<num;i++){
			c[i] = src.pixels[(int)random(src.pixels.length)];
		}
	}
	
	void draw(){
		for(int i = 0;i<2;i++){
			pushMatrix();
			
			translate(random(-width,width),random(-height,height));
			pushMatrix();
			float sc=  random(0.12,3);
			translate(sc*vzor.width/2,sc*vzor.height/2);
			pushMatrix();
			rotate(random(-PI,PI));
			tint(c[(int)random(c.length)],200);
			image(vzor,0,0,vzor.width*sc,vzor.height*sc);
			popMatrix();
			popMatrix();
			popMatrix();
		}
	
	}


}

