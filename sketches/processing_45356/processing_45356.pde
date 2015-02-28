
/**
*  Weird midnight sketch by kof 2011
*  asemicConstruction, copyleft
*/

float[] ang,L,speed;
int num = 10;


float speedUP;

void setup(){

	size(800,600,P2D);



	noiseSeed(19);

	ang = new float[num];
	L = new float[num];
	speed = new float[num];

	for(int i = 0 ; i < ang.length;i++){
		ang[i] = i;
		L[i] = (400.0)/(4.0+i/100.0);
		speed[i] = 0.1-i/(200.0);

	}

	noSmooth();


	background(0);
	stroke(255,10);
	
	speedUP = HALF_PI * 1000.3;

}


void draw(){

	
	pushStyle();
        strokeWeight(10);
        stroke(0);
	fill(0,45);
	rect(0,0,width,height);
        popStyle();

	pushMatrix();
	translate(noise(frameCount/1.5)*5,noise(frameCount/1.21)*5);


	if(frameRate < 30)
	speedUP --;

	for(int q = 0;q< speedUP ;q++){

	pushMatrix();
	translate(width/2,height/2);
	for(int i = 0 ; i < ang.length;i++){


	translate((noise(i*14530.0+frameCount/333.17)-0.5)*500.0/(i+400.0),(noise(i*3459.9231+frameCount/330.0)-0.5)*500.0/(i+1.0));

	float l = L[i]+((noise(((frameCount+i*5000.0)/30.0 )-0.51)*(15.0+i/40.0)));

	stroke(lerpColor(#222B38,#FFF5CD,norm(i,ang.length,0)), (sin((i*3993.3+frameCount/30.131)*3.02)+1.0)*12.0 );

	ang[i]+=speed[i];	
	rotate(ang[i]);
	line(0,0,l,0);
	translate(l,0);	



	}

	popMatrix();

}

	popMatrix();

	//saveFrame("/desk/god/god#####.png");

}



