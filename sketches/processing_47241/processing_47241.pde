
/*
 *  Calm Flow by Kof 2011
 *
 */

int num = 200;
float spread = 0.0033333;

ArrayList planes;

int trailLen = 300;




color bckColor = color(#1E1F22);

void setup(){
	size(900,450,P2D);

	noiseSeed(19);

	planes = new ArrayList();

	for(int i =0 ; i < num;i++)
		planes.add(new Plane(i+1));

}


void draw(){

	background(bckColor);

	for(int i =0 ; i < num;i++){
		Plane pl = (Plane)planes.get(i);//draw();
		pl.draw();

		pl.automate();
	}

}

void keyPressed(){



	for(int i =0 ; i < num;i++){
		Plane p = (Plane)planes.get(i);

		if(keyCode == UP){
			p.keys[0] = true;

		}else if(keyCode == DOWN){
			p.keys[1] = true;

		}else if(keyCode == LEFT){
			p.keys[2] = true;

		}else if(keyCode == RIGHT){
			p.keys[3] = true;
		}
	}
}


void keyReleased(){



	for(int i =0 ; i < num;i++){
		Plane p = (Plane)planes.get(i);


		if(keyCode == UP){
			p.keys[0] = false;

		}else if(keyCode == DOWN){
			p.keys[1] = false;

		}else if(keyCode == LEFT){
			p.keys[2] = false;

		}else if(keyCode == RIGHT){
			p.keys[3] = false;
		}
	}
}

class Plane{
	PVector pos;
	PVector acc;
	PVector vel;
	float alt;
	float fuel;

	boolean[] keys = new boolean[4];
	int id;

	float r;
	float maxforce;    // Maximum steering force
	float maxspeed = 5.0;    // Maximum speed


	ArrayList trail;



	Plane(int _id){
		id = _id;
		pos = new PVector(width/2,height/2);
		acc = new PVector(0,0,0);
		vel = new PVector(cos(id/(num+1.0))/100.0,sin(id/(num+1.0))/100.0,0);
		float alt = 0;

		trail = new ArrayList();

		for (int i = 0; i< keys.length; i++) {
			keys[i] = false;
		}



	}

	void accelerate(){

		PVector tmp =  new PVector(0,-0.01);
		rotate2D(tmp,atan2(vel.y,vel.x)+HALF_PI);
		acc.add(tmp);

	}

	void slowdown(){
		//		PVector tmp =  new PVector(0,0.1);
		//		rotate2D(tmp,atan2(vel.y,vel.x)+HALF_PI);
		//		acc.add(tmp);
		vel.mult(0.98);
	}

	void turnL(){

		//rotate2D(acc,-.1);
		rotate2D(vel,-radians(10.0/(acc.mag()*10.0+1.0)/(vel.mag()+0.1)));
		vel.mult(0.999);



		rotate2D(acc,radians((2.1/(vel.mag()*10.0))));
	}

	void turnR(){

		rotate2D(vel,radians(10.0/(acc.mag()*10.0+1.0)/(vel.mag()+0.1)));
		vel.mult(0.999);

		rotate2D(acc,-radians((2.1/(vel.mag()*10.0))));

	}


	void bordr(){
		if(pos.x>width)pos.x = 0;
		if(pos.x<0)pos.x = width;

		if(pos.y>height)pos.y = 0;
		if(pos.y<0)pos.y = height;

	}

	void checkUser(){
		if(keys[0] == true) {  //Move the left player up.

			accelerate();

		}
		if(keys[1] == true) {  //Move the left player down.
			slowdown();
		}
		if(keys[2] == true) {  //Move the right player up.
			turnL();
		}
		if(keys[3] == true) {  //Move the right player down.
			turnR();
		}

	}



	void automate(){


		keys[0] = noise((frameCount)/30.001)> 0.2 ?true:false;
		keys[1] = noise((frameCount+200)/30.0021)> 0.2 ?true:false;
		keys[2] = noise((frameCount+400)/30.0123)> 0.5 ?true:false;
		keys[3] = noise((frameCount+8000)/30.398)> 0.5 ?true:false;


	}

	void computeStep(){


		acc.mult(.9);
		vel.add(acc);
		vel.mult(.99);


		acc.limit(3);
		vel.limit(maxspeed);

		pos.add(vel);




	}

	void plotTrail(){

		if(trail.size()<=trailLen){

			trail.add(new PVector(pos.x,pos.y,vel.mag()));

		}else{
			trail.add(new PVector(pos.x,pos.y,vel.mag()));	
			trail.remove(0);

		}

		for(int i = 1 ; i < trail.size();i++){
			PVector pre = (PVector)trail.get(i-1);
			PVector cur = (PVector)trail.get(i);

			//pushMatrix();
			//translate(cur.x,cur.y);
			//rotate(atan2(cur.y-pre.y,cur.x-pre.x)+HALF_PI);
			stroke(#ffffff,map(i,0,trail.size(),3,55));


			float shx = (noise((frameCount+sin(frameCount/31.1)*50+i*id)/300.0)-0.5)*50; 
			float shy = (noise((frameCount+cos(i/30.1)*40+i*id)/313.0)-0.5)*50; 

			if(dist(cur.x,cur.y,pre.x,pre.y)<10)
				line(cur.x+shx,cur.y+shy,pre.x+shx,pre.y+shy);
			//line(2.5,0,2.5,cur.z*10);
			//line(-2.5,0,-2.5,cur.z*10);
			//popMatrix();
		}



	}

	void draw(){
		checkUser();

		computeStep();

		plotTrail();

		bordr();


		/*
		   pushMatrix();
		   translate(pos.x,pos.y);
		   rotate(atan2(acc.y-vel.y,acc.x-vel.x));

		   noStroke();//stroke(#ffffff);
		   rectMode(CENTER);
		   rect(0,0,10,5);
		   popMatrix();
		 */
	}

	void rotate2D(PVector v, float theta) {
		float xTemp = v.x;
		v.x = v.x*cos(theta) - v.y*sin(theta);
		v.y = xTemp*sin(theta) + v.y*cos(theta);
	}
}

