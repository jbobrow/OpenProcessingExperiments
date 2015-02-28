
import peasy.*;


int num = 2000;
float RADIUS = 36;
float SCALE = 200.0;

int globKonexID = 0;
PeasyCam cam;
Neuron n[];

void setup(){
	size(460,460,P3D);
	n = new Neuron[num];

	cam = new PeasyCam(this, 800);
	cam.setMinimumDistance(300);
	cam.setMaximumDistance(3000);

	for(int i = 0;i<n.length;i++){
		n[i] = new Neuron(i);
	}


	for(int i = 0;i<n.length;i++){
		n[i].makeConnections();
	}

	noSmooth();
	stroke(0,5);

	for(int i = 0;i<n[0].k.length;i++)
		n[0].makeSignal(i);

}

void mousePressed(){
	if(mouseButton==RIGHT){
		for(int i = 0;i<n.length;i++){
			n[i].x = random(-width/2,width/2);
			n[i].y = random(-width/2,width/2);
			n[i].z = random(-width/2,width/2);
		}

		for(int i = 0;i<n.length;i++)
			n[i].makeConnections();

		for(int i = 0;i<n[0].sig.length;i++)
			n[0].makeSignal(i);
	}
}

void draw(){
	background(0);

	for(int i = 0;i<n.length;i++){
		n[i].draw();
	}
}


////////////////////////// >>

class Neuron{
	float x,y,z,radius,xx,yy,zz,val;
	int id;
	boolean imobile = false;
	Konexe k[] = new Konexe[0];
	Signal sig[] = new Signal[0];


	Neuron(int _id){
		xx = x = random(-width/2,width/2);
		yy = y = random(-width/2,width/2);
		zz = z = random(-width/2,width/2);
		id= _id;
		radius = RADIUS;
		val = 0;
		if(id==1)imobile = true;
	}


	void makeConnections(){
		k = new Konexe[0];
		sig = new Signal[0];
		
		for(int i = 0 ;i<n.length;i++){
			if(i!=id && dist(x,y,z,n[i].x,n[i].y,n[i].z) < radius){
				k = (Konexe[])expand(k,k.length+1);
				k[k.length-1] = new Konexe(id,i);

				sig = (Signal[])expand(sig,sig.length+1);
				sig[sig.length-1] = new Signal(k[sig.length-1]);
			}
		}
	}

	void makeSignal(int which){
		int i = which;
		sig[i].x = xx;
		sig[i].y = yy;
		sig[i].z = zz;
		sig[i].running = true;
	}

	void drawConnections(){
		for(int i = 0 ;i<k.length;i++){
			line(xx,yy,zz,n[k[i].B].xx,n[k[i].B].yy,n[k[i].B].zz);
		}


	}

	void draw(){
		
		xx += (x-xx) / 10.0;
		yy += (y-yy) / 10.0;
		zz += (z-zz) / 10.0;

		if(sig.length>0){
			for(int i = 0;i<sig.length;i+=1){

				if(sig[i].running){
					if(sig[i].moving){
						pushMatrix();
						pushStyle();
						//strokeWeight(3);
						stroke(255,15);
						noFill();
						//line(sig[i].x,sig[i].y,sig[i].z,sig[i].lx,sig[i].ly,sig[i].lz);
						translate(sig[i].x,sig[i].y,sig[i].z);
						box(2);
						popStyle();
						popMatrix();
					}
					sig[i].step();

				}

			}
		}

		stroke(lerpColor(#ffcc11,#ffffff,norm(val,0,255)),20);
		drawConnections();

	}





}

////////////////////////// >>

class Konexe{
	int A,B,id;
	float weight = 1.5;
	Konexe(int _A,int _B){
		A = _A;
		B = _B;
		id = globKonexID++;
		weight = random(101,200)/SCALE;
	}
}


class Signal{

	Konexe base;
	int cyc = 0;
	float x,y,z,lx,ly,lz;
	float speed = 10.1;

	boolean running = false;
	boolean visible = true;
	boolean moving = false;

	int deadnum = 200;
	int deadcount = 0;

	Signal(Konexe _base){
		deadnum = (int)random(2,40);
		base = _base;
		lx = x = n[base.A].x;
		ly = y = n[base.A].y;
		lz = z = n[base.A].z;
		speed *= base.weight;
	}

	void step(){
		running = true;

		if(abs(lx-x)>.1||abs(ly-y)>.1||abs(lz-z)>.1)
			moving = true;
		else
			moving = false;

		lx = x;
		ly = y;
		lz = z;


		if(!n[base.A].imobile){
			x += (n[base.B].xx-x) / speed;//(speed+(dist(n[base.A].x,n[base.A].y,n[base.B].x,n[base.B].y)+1)/100.0);
			y += (n[base.B].yy-y) / speed;//(speed+(dist(n[base.A].x,n[base.A].y,n[base.B].x,n[base.B].y)+1)/100.0);
			z += (n[base.B].zz-z) / speed;
		}

		n[base.A].val+=(0-n[base.A].val)/5000.0;

		if(dist(x,y,z,n[base.B].xx,n[base.B].yy,n[base.B].zz)<1.0){

			if(deadcount<0){
				deadcount = deadnum;


				//deadnum += (int)random(-1,1);
				//println("run "+base.A+" : "+base.B);

				running = false;
				for(int i = 0; i < n[base.B].k.length;i++){
					if(!n[base.B].sig[i].running && base.A!=n[base.B].sig[i].base.B){
						n[base.B].makeSignal(i);
						n[base.B].sig[i].base.weight += (base.weight-n[base.B].sig[i].base.weight)/((dist(x,y,z,n[base.A].xx,n[base.A].yy,n[base.A].zz)+1.0)/200.0);
					}

				}


				//base.weight = random(1001,3000) / 1000.0;
				if(n[base.A].id!=1){
					n[base.A].xx+=((n[base.B].x-n[base.A].x)/1.1)*noise((frameCount+n[base.A].id)/18.0);;
					n[base.A].yy+=((n[base.B].y-n[base.A].y)/1.1)*noise((frameCount+n[base.A].id)/17.0);
					n[base.A].zz+=((n[base.B].z-n[base.A].z)/1.1)*noise((frameCount+n[base.A].id)/16.0);



					n[base.A].xx-=((n[base.B].x-n[base.A].x)/1.1)*noise((frameCount+n[base.B].id)/18.2);;
					n[base.A].yy-=((n[base.B].y-n[base.A].y)/1.1)*noise((frameCount+n[base.B].id)/17.2);
					n[base.A].zz-=((n[base.B].z-n[base.A].z)/1.1)*noise((frameCount+n[base.B].id)/16.2);
				}

				lx = n[base.A].x;
				ly = n[base.A].y;
				lz = n[base.A].z;

				n[base.A].val+=(255-n[base.A].val)/10.0;
			}else{

				deadcount--;
			}
		}
	}
}

