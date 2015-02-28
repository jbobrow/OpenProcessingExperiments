
/**
* 	noiseSeed(19);
*	DATA FETISH sketch by kof 2011	
*/


World world;
ArrayList ball = new ArrayList<Ball>(0);

// number of interactiong objects, accuracy and of course rendering
int num = 6;

// accuracy of measuring, approx. ! < num, processor hungry when a lot of objects
int accuracy = 6;

// length of trail to leave, this can ease renderings on old graphics cards a lot
int trailSize = 150;

// trail resolution, when the trail is long better to set higher value.. number is % modulo to render
int res = 1;


PImage bck;
PImage fadeIn;
PImage debian;

float distance = -5000;


void setup(){

	size(600,300,P3D);

	// !!! seed 19.. always the same results, something for determinists
	noiseSeed(19);
	
	world = new World();


	bck = loadImage("bck.png");
	fadeIn = loadImage("fadeIn.png");
	debian = loadImage("debian.png");

	for(int i = 0 ; i < num ; i++){
		ball.add(new Ball(i));

	}

	sphereDetail(3);	
	stroke(0,25);
	noFill();

	noSmooth();

}


void draw(){
	// gradient background
	background(bck);


	// jerky cam
	world.setSteadyRotation(
		noise((frameCount+10.10)/400.0)*5.0,
		noise((frameCount+100.13)/400.0)*20.0,
		noise((frameCount+1000.17)/1000.0)/2.0
	);

	
	// pre-transformation world matrixes
	world.pre();


	// compute movement of particles
	for(int i = 0 ; i < ball.size() ; i++ ){
		Ball temp = (Ball)ball.get(i);
		temp.move();
	}


	// draw them and their trails
	for(int i = 0 ; i < ball.size() ; i++ ){
		Ball temp = (Ball)ball.get(i);


		temp.drawTrail();
		temp.draw();
	}

	// close opened transformations
	world.post();


	if(frameCount<900){
		fill(0,map(frameCount,0,900,255,0));
		rect(0,0,width,height);

		// slowly closing
		distance = map(frameCount,0,900,-5000,-1000);
	
		//tint(255,200+noise(frameCount/5.0)*10);
		//println(world.rotationS.z);
		//noTint();
	
	}


		
		tint(255,200+noise(frameCount/5.0)*10);	
		image(fadeIn,atan2(world.rotationS.x-world.rotationS.z,world.rotationS.y)*200-100,0);
		noTint();
}


// rotatory object definition
class Ball{

	// three classic flock values 
	PVector pos;
	PVector speed;
	PVector acc;
	
	// another for rotation and rotation acceleration
	PVector rot;
	PVector rotAcc;

	// some weight mod
	float r;

	// and obligatory ID number
	int id;

	// trail as a ArrayList of PVectors, quite handy
	ArrayList trail = new ArrayList<PVector>(0);


	// constructor, only difference between object makes one number ))
	Ball(int _id){

		// get unique id
		id = _id;

		// intial speed
		speed = new PVector(0,1,0);
		
		// initial acceleration, note noise and unique id
		acc = new PVector(
			noise(id*PI),
			noise(id*TWO_PI),
			noise(id*QUARTER_PI)
		);
		
		// intial position
		pos = new PVector(
			noise(id*HALF_PI)*400-200,
			noise(id*PI+10.0)*400-200,
			noise(id*HALF_PI+10.0)*400-200
		);		

		// initial rotations
		rot = new PVector(noise(id),noise(id+44.3),noise(id+443.443));
		rotAcc = new PVector(0,0,noise(id*33.1258)*2.0-1.0);
		rotAcc.mult(noise(id*87.78)/10.0);

		r = noise(id*400.1998)*150+150;
	}

	// this draw objects
	void draw(){
		pushMatrix();
		translate(pos.x,pos.y,pos.z);

		pushMatrix();
		rotateX(rot.x);
		rotateY(rot.y);
		rotateZ(rot.z);

		strokeWeight(map(speed.mag(),0,30,3,1));
		sphere(r/10.0);

		popMatrix();

		popMatrix();

	}


	// draws a trails of obejcts
	void drawTrail(){

		if(trail.size()>0){

			if(trail.size() > trailSize){
				trail.remove(0);
			}


			// if it is first entity draw for the rest
			if(id == 0){
				drawFill(1);
			}	
		}

		trail.add(new PVector(pos.x,pos.y,pos.z));

		for(int i = 1 ; i < trail.size(); i++){
			PVector two = (PVector)trail.get(i);
			PVector one = (PVector)trail.get(i-1);
			
			//strokeWeight(map(modelZ(0,0,0),-400,400,1,10));

			strokeWeight(map(dist(one.x,one.y,one.z,two.x,two.y,two.z),10,0,5,1.8));
			stroke(0,map(i,trail.size(),0,100,0));
			line(one.x,one.y,one.z,two.x,two.y,two.z);
		}

	}

	// this draws a lines in between trails
	void drawFill(int _res){
		for(int i = 1 ; i < ball.size();i++){
			Ball first = (Ball)ball.get(i-1);
			Ball other = (Ball)ball.get(i);

			for( int ii = 0 ; ii < trail.size() ; ii += _res ) {
				PVector one = (PVector)first.trail.get(ii);
				PVector two = (PVector)other.trail.get(ii);
				float d = dist(one.x,one.y,one.z,two.x,two.y,two.z);
				strokeWeight(map(d,1200,0,5,1.8));
				stroke(0,map(ii,trail.size(),0,30,0));
				line(one.x,one.y,one.z,two.x,two.y,two.z);
			}

		}

	}

	// animation and object interaction computation
	void move(){
		pos.add(speed);
		speed.limit(noise((frameCount+id*10)/400.0)*50.0);

		speed.add(acc);

		attract();		
		detract();

		acc.add(-pos.x,-pos.y,-pos.z);
		acc.normalize();
		
		//pos.normalize();
		//pos.sub(-0.5,-0.5,-0.5);
		//pos.mult(acc.mag()*height);
		pos.limit(height*2);

		rot.add(rotAcc);

		r += (noise((frameCount+id)/(speed.mag()*10.0+1.0))-0.5)/100.0;
	}

	// pick some neighbors and get closer to them according to current weight
	void attract(){
		for(int i = 0 ; i < accuracy ;i++){
			
			int curr = (int)(noise(id*i*234+frameCount)*(ball.size()));
			if (curr != id){
				Ball temp = (Ball)ball.get(curr);
				acc.add(temp.pos.x-pos.x,temp.pos.y-pos.y,temp.pos.z-pos.z);
				acc.mult(map(temp.r,50,150,0,10));
				acc.mult(map(r,50,150,0,100));
			}
		}
		acc.normalize();
	}		

	// pick another ones and repulse
	void detract(){
		for(int i = 0 ; i < accuracy ;i++){	
			int curr = (int)(noise(id*i*2312.22+frameCount)*(ball.size()));
			if (curr != id){
				Ball temp = (Ball)ball.get(curr);
				acc.add(pos.x-temp.pos.x,pos.y-temp.pos.y,pos.z-temp.pos.z);
				acc.mult(map(temp.r,50,150,0,10));
				acc.mult(map(r,50,150,0,100));
			}
		}
		acc.normalize();
	}
}





// World space definition
class World{
	PVector pos,rotation,rotationS;
	PVector rotAcc;

	World(){
		pos = new PVector(width/2,height/2,0);
		rotation = new PVector(0,0,0);
		rotationS = new PVector(0,0,0);
		rotAcc = new PVector(0,0);
	}


	// pre-processing
	void pre(){
		// camera transformations
		pushMatrix();


		// jerky cam is happening here
		translate(noise(frameCount/10.0)*20+rotAcc.x*30.0,noise((frameCount+333.14)/10.0)*20+rotAcc.y*30.0,distance);

		
		
		//world zero 0,0,0
		pushMatrix();
		translate(pos.x,pos.y,pos.z);


//////////////////////////////////////
/* uncomment to display special thanks

		pushMatrix();
		rotateZ(rotationS.x-rotationS.y);
		tint(255,noise(frameCount/40.0)*noise(frameCount/12.0)*255);
		image(debian,-128,-128,256,256);
		noTint();
		popMatrix();

		pushMatrix();
		rotateZ(rotationS.y-rotationS.z);
		tint(255,noise(frameCount/41.0)*noise(frameCount/13.0)*255);
		image(debian,-256,-256,512,512);
		noTint();
		popMatrix();

		pushMatrix();
		rotateZ(rotationS.x-rotationS.z);
		tint(255,noise(frameCount/42.0)*noise(frameCount/14.0)*255);
		image(debian,-512,-512,1024,1024);
		noTint();
		popMatrix();
*/
//////////////////////////////////////

		//world orientation
		pushMatrix();
		rotateX(rotationS.x);
		rotateY(rotationS.y);
		rotateZ(rotationS.z);
		
		
	}

	// post-processing, just poping open matrixes
	void post(){
		popMatrix();
		popMatrix();
		popMatrix();


	}

	// strange space cam
	void setSteadyRotation(float _x,float _y,float _z){

		// special movement of camera computation, could be better
		//rotAcc.x = pow(rotation.y+1-rotationS.z,3);
		//rotAcc.y = pow(rotation.x+1-rotationS.z,2);

		rotAcc.y = -atan2(world.rotationS.x-world.rotationS.z,world.rotationS.y);
		rotAcc.x = -atan2(world.rotationS.y-world.rotationS.z,world.rotationS.x);	
		rotAcc.normalize();
		rotAcc.mult(3);

		rotation.x = _x;
		rotation.y = _y;
		rotation.z = _z;


		rotationS.x += (rotation.x-rotationS.x)/30.0;
		rotationS.y += (rotation.y-rotationS.y)/30.0;
		rotationS.z += (rotation.z-rotationS.z)/30.0;
	}

}

