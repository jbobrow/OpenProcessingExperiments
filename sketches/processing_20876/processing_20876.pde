
//import processing.opengl.*;
import saito.objloader.*;
import toxi.geom.Vec3D;

Ship ship;


float zdvih = 0.1;
float klop = 0;
float tah = 1;


float cx = 1000;
float cy = 1000;
float cz = -1000;

float sx = 0;
float sy = 0;
float sz = 0;

float flatX = 0;
float flatY = 0;


float speed = 30.0;

float sc = 15;
int trailLen = 600;

boolean debug = false;

float deadZone = 10;


Vec3D upV = new Vec3D(1,0,0);

PGraphics fram;



void setup(){

	size(320,240,P3D);
	hint(DISABLE_OPENGL_2X_SMOOTH);
	noSmooth();
	ship = new Ship(this,0,"ship.obj");
	cursor(CROSS);

	textFont(createFont("Verdana",9,false));
	textMode(SCREEN);
	mouseX = width/2;
	mouseY = height/2;


	prepareFrame();
}

void prepareFrame(){
	fram = createGraphics(width+10,height+10,P2D);
	fram.beginDraw();
	fram.strokeWeight(70);
	fram.stroke(0);
	fram.noFill();
	
	fram.rect(0,0,fram.width,fram.height);
fram.filter(BLUR,10);
	fram.endDraw();


}


void draw(){
	background(#0a090c);
	drawBck();
	control();
	drawWorld();
	drawGui();
}

void drawBck(){
	//hint(DISABLE_DEPTH_TEST);
	camera();


	float theta = atan2(ship.pos.y-cy,ship.pos.x-cx);
	strokeWeight(2);
	for(int i = 0;i<height;i+=2){
		stroke(lerpColor(#717584,#000000,map(abs(theta*30-i),-height,100,0.3,0.7)),140);
		line(0,i,width,i);

	}

	

	//hint(ENABLE_DEPTH_SORT) ;
}


void drawGui(){
//hint(ENABLE_DEPTH_SORT) ;
	hint(DISABLE_DEPTH_TEST);
	camera();

	stroke(#ffcc00,20);
	strokeWeight(1.5);




noFill();
	
	fill(#ffcc00,60);
	text("nomad 47",flatX+50,flatY-50);
	noFill();

	line(flatX,
	     flatY,
	    flatX+50,
	     flatY-50
	     );
	 
	 
	image(fram,(noise(frameCount/1.0)-0.6)*10,(noise(frameCount/1.127)-0.6)*10);


}

void control(){


	klop = (mouseX-pmouseX)/speed;
	klop = constrain(klop,-0.03,0.03);

	zdvih +=  (map(mouseY,0,height,0.3,-0.3)-zdvih)/speed;

	zdvih*=0.9;
	klop*=0.9;
}


void drawWorld(){


	// lazy cam
	cx+=(ship.pos.x-cx)/80.0;
	cy+=(ship.pos.y-cy)/80.0;
	cz+=(ship.pos.z-cz)/80.0;

	// follow ship avr. move
	sx+=(ship.pos.x-sx)/12.0;
	sy+=(ship.pos.y-sy)/12.0;
	sz+=(ship.pos.z-sz)/12.0;


	// add some noise
	sx += (noise(frameCount/3.1)-0.5)*zdvih*90;
	sy += (noise(frameCount/3.132)-0.5)*zdvih*90;
	sz += (noise(frameCount/3.1147)-0.5)*zdvih*90;

	pushMatrix();

	// cam
	camera(cx,cy,cz,sx,sy,sz,0,1,0);

	// isometric projection
	//ortho(-width/2,width/2,-height/2,height/2,-2000,2000);

	// init lights
	directionalLight(255, 230, 150, 0, 1, 0);
	ambientLight(100, 100, 250) ;
	lights();

	// render ship class
	ship.render();


	popMatrix();


}


class Ship{
	OBJModel model;

	Vec3D vel;
	Vec3D pos;
	Vec3D acc;

	ArrayList trail1 = new ArrayList(0);

	String name;


	int id;
	PApplet parent;

	Ship(PApplet _parent, int _id, String _name){
		id = _id;
		parent = _parent;
		name = _name;

		reloadModel();

		pos = new Vec3D(0,0,0);
		vel = new Vec3D(0,0,0);
		acc =new Vec3D(0,-1,0);
	}

	void reloadModel(){
		model = new OBJModel(parent,name);
		model.scale(sc);
	}

	void move(){


		//rotate acceleration vector .. thx toxi
		acc.rotateZ(zdvih);
		acc.rotateY(klop);

		vel = vel.add(acc);
		vel.limit(7.8);
		pos = pos.add(vel);



	}



	// leave a trail
	void trail(ArrayList ar){

		//if(frameCount%3==0){
		trail1.add(new Vec3D(pos.x,pos.y,pos.z));
		//}

		if(ar.size()>trailLen){
			ar.remove(0);
		}

		for(int i = 0;i<ar.size()-2;i++){
			Vec3D tmp = (Vec3D)ar.get(i);
			Vec3D tmp2 = (Vec3D)ar.get(i+1);
			strokeWeight(map(i,0,trailLen,10,1));
			stroke(255,map(i,0,trailLen,0,120));
			line(tmp.x,tmp.y,tmp.z,tmp2.x,tmp2.y,tmp2.z);
		}

	}

	void render()
	{
		move();

		upV = new Vec3D(0,1,0);

		pushMatrix();

		translate(pos.x,pos.y,pos.z);

		if(debug){
			strokeWeight(2);

			stroke(#ff0000,120);
			line(0,0,0,vel.x*100,vel.y*100,vel.z*100);

			stroke(#00ff00,120);
			line(0,0,0,acc.x*100,acc.y*100,acc.z*100);

			stroke(#0000ff,120);
			line(0,0,0,upV.x*100,upV.y*100,upV.z*100);
		}

		//rad dist
		float r = sqrt(vel.x*vel.x+vel.y*vel.y+vel.z*vel.z);
		// Z axis rot
		float theta = atan2(vel.y,vel.x);
		// Y axis rot
		float phi = acos(vel.z/r);

		// apply rotates
		rotateZ(theta);
		rotateY(phi);



		flatX = screenX(0,0,0);
		flatY = screenY(0,0,0);

		// correction of anchor
		translate(0,-sc/2,0);

		// draw model
		noStroke();
		model.draw();


		popMatrix();

		//leave trail
		trail(trail1);




	}





}




void keyPressed(){
	// reset
	if(key == ' '){
		ship = new Ship(this,0,"ship.obj");

	}
}



