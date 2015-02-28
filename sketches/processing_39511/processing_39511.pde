
// organism form params
int chapadlaNum = 10;
int chapadlaLen = 130;
float chapadloPartLen = 1;


int trailLen = 500;

float smoothing1 = 2.1;
float smoothing2 = 20.1;

//show entrie neural structure
boolean showNet = false;

//resolution of a neural structure
float res = 3.0;


int teachRate = 1;

boolean control = false;

float blobX,blobY;

//// neural params

// rate of change
float rate = 0.001;
// jitter on synapses
float jitter = 10;
// average interconnection between neurons
int avgConnections = 40;
// change connection in net every N frame
int changeIndexRate = 100000;

float avg = 1.0;


int num;
ArrayList n;
ArrayList hand;

boolean debug = false;

int X = 0;
int Y = 0;


void setup(){
	size(700,350,P2D);
	noStroke();

	randomSeed(19);

	noSmooth();

	restart();
}

void draw(){


	smoothing2 = noise(frameCount/30.0)*150.0;
	smoothing1 = noise(frameCount/100.23)*200.0-10.0;
	background(0);
	noStroke();

	for(int i = 0;i< hand.size();i++){
		Hand tmp = (Hand)hand.get(i);

		tmp.drawTrail();
	}



	// learn creature new thinks
	if(control)
		cont();


	//// neural part
	// compute relations
	for(int i = 0;i< n.size();i++){
		Neuron tmp = (Neuron)n.get(i);
		tmp.compute();
	}

	// update whole state at once
	for(int i = 0;i< n.size();i++){
		Neuron tmp = (Neuron)n.get(i);
		tmp.update();
	}
	// draw entity hand by hand reacting on the structure
	for(int i = 0;i< hand.size();i++){
		Hand tmp = (Hand)hand.get(i);
		tmp.draw();

		//set its global position
		tmp.setXY(blobX,blobY);
	}   
	Hand h = (Hand)hand.get(hand.size()-1);
	Bone b = (Bone)h.bones.get(0);

	//pushMatrix();
	//translate(h.x,h.y);
	//rotate(radians(b.angle));
	//    translate(-(width/res),-(height/res));
	//scale(2/res);
	// if showNet draw network representation
	if(showNet)
		for(int i = 0;i< n.size();i++){
			Neuron tmp = (Neuron)n.get(i);
			tmp.draw();
		}   

	//popMatrix();
}



