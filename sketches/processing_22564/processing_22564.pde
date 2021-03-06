
/**
*  "Kofian" oscillator motion by Krystof Pesek 2011
*  Modifing values can result completely different drawing "style" 
*/


int plottNum = 500;
// number of random patterns
int patNum = 20;
//number of oscillators
int rotNum = 33;

// minimum oscillation speed (the more low == slower), and the relative spread of speeds (lower == more organized structure)
int minRep = 800;
int spread = 300;
// size of display averages
int prumSize = 5;
// scale speed of movement per cycle
float scal = 0.4;
// alpha of drawer

float alph = 4;
// scale of graph
float sc = 10.0;

boolean showGRPHS = true;
boolean showCONNECT = false;
// animation fade
int fade = 100;

// animation caputure
boolean record = false;
int frameCnt = 0;
int frameSkip = 1;

// debuging showing some more informations on screen
boolean debug = false;
boolean showGraph = false;

// X (time) coordinate of graph
float graphX = 0;

// AL of random patterns
ArrayList patterns = new ArrayList();
// AL of oscillators
ArrayList <CPU> cpu = new ArrayList();
// array for average values of all the rotators
ArrayList <Plotter> plotters = new ArrayList();


// square root of size of rotators matrixes (not generic do not change)
int size = 5;
// positions of plotter
int YY,XX;

// default settings for movement increments
int xs[] = {-2,-1,0,1,2,-2,-1,0,1,2,-2,-1,0,1,2,-2,-1,0,1,2,-2,-1,0,1,2};
int ys[] = {-2,-2,-2,-2,-2,-1,-1,-1,-1,-1,0,0,0,0,0,1,1,1,1,1,2,2,2,2,2};

// offscreen plotter paper
PGraphics img;

// cycle finished ?
boolean reach = false;
///////////////////////////////



void setup(){
	size(480,500,P2D);

        // init function
	reset();

	rectMode(CENTER);
	noFill();
	noSmooth();
	stroke(0);

        // autogenerated font
	textFont(createFont("Verdana",10,false));
	
        // turn off in case of opengl render !!
        textMode(SCREEN);
	textAlign(CENTER);


}
//////////////////////////////
void eraseImg(){
	img.beginDraw();

	img.background(255);
	//smoothing off ?
        //img.smooth();
	img.endDraw();


}
//////////////////////////////
void reset(){

	//////// patterns /////////
	patterns = new ArrayList();

	for(int i = 0;i<patNum;i++)
		patterns.add(new Pattern());


	//////// cpu oscills /////////
	cpu = new ArrayList();

        // place oscillators
	XX = width-40;
	YY = height-40;
	for(int i = 0;i<rotNum;i++){
		cpu.add(new CPU(XX,YY,i));
		XX-=40;
		if(XX<=0){
			XX=width-40;
			YY-=40;
		}

	}

	//////// plotters /////////
	plotters = new ArrayList();

	for(int i = 0 ;i<plottNum;i++){
		plotters.add(new Plotter(i));
	}

	/////////////////

        // create drawable canvas
	img = createGraphics(width,height,P2D);
	
        // background
        eraseImg();

        // for extra debug graphs
	graphX = 0;



}
//////////////////////////////
void mousePressed(){
	if(mouseButton==LEFT){
		reset();
	}

}

//////////////////////////////
void draw(){
	background(img);

	// reach never happen if animation is off
        if(reach){
		if(record)
			img.save("/desk/parralerAnimator/img"+nf(frameCnt,4)+".png");
		frameCnt++;
	//patterns.add(new Pattern());

		reach = false;

		for(int i = 0;i<plotters.size();i++){
			Plotter p = (Plotter)plotters.get(i);
			p.plotX = width/2;
			p.plotY = height/2;
		}
		//plotX = width/2;
		//plotY = height/2;
		img.beginDraw();
		img.noStroke();
		img.fill(255,fade);
		img.rect(0,0,width,height);
		img.endDraw();
	}



	
		stroke(0);
                // update oscillator vals
		for(int i = 0;i<cpu.size();i++){
			CPU tmp = (CPU)cpu.get(i);
			tmp.compute();

		}


                // reset plotters matrix values
		for(int i = 0;i<plotters.size();i++){
			Plotter p = (Plotter)plotters.get(i);
			for(int ii = 0 ;ii<p.graph.length;ii++)
				p.graph[ii] = 0;
		}

                // add averages of matrixes
		for(int i = 0;i<plotters.size();i++){

			Plotter p = (Plotter)plotters.get(i);

			for(int ii = 0 ;ii<cpu.size();ii++){
				if(p.vliv[ii]){
					CPU tmp = (CPU)cpu.get(ii);
					p.addVals(tmp);

				}
			}
		}

                // graphing debug
		graphX += 1/sc;
		graphX = graphX%width;

                // draw plotters on canvas
		img.beginDraw();
		for(int i = 0 ;i<plottNum;i++){
			Plotter p = (Plotter)plotters.get(i);
			p.draw();
		}
		img.endDraw();


                // ? :)
		int X = 0;
		int Y = 0;



	
}
//////////////////////////////

//////////////////////////////
class CPU{
        // own pattern reference
	Pattern pat;
        // x,y just for positioning on screen
	int x,y;

        // own timer
	float time;

        // speed of oscillation
	float tstep = 0.01;

        // radius (drawing only)
	float r = 20;

        // current pattern referal
	int current = 0;

        // last time
	float ltime;

        // id of oscillator
	int id;

	//////////////////////////////
	CPU(int _x,int _y,int _id){
		x=_x;
		y=_y;
		id = _id;
		time = -HALF_PI;
		
                // random speed according global settings
                tstep = random(minRep,minRep+spread)/10000.0;
                // update curretn pattern
		pat = (Pattern)patterns.get(current);
	}
	//////////// get current patern value (i) in integer //////////////////
	int getStateVal(int i){
		int answ = pat.state[i]?1:0;
		return answ;
	}
	//////////////////////////////
	void compute(){
                // advance time
		time+=tstep;

                // compute oscillation viz coords
		float cx = cos(time)*r;
		float cy = sin(time)*r;

                // special fancy viz vals
		noFill();
		stroke(0,map(abs(time+HALF_PI-TWO_PI),0,TWO_PI,0,127));
		ellipse(x,y,r*2,r*2);

                // draw matrix
		pushStyle();
		rectMode(CORNER);
		int sqr = (int)sqrt(pat.state.length);
		for(int ii = 0;ii<sqr;ii++){
			for(int i = 0;i<sqr;i++){
				if(pat.state[ii*sqr+i]){
					fill(0);
				}else{
					fill(255);
				}

				stroke(0);
				rect(ii*sqr+x-pat.state.length/2,i*sqr+y-pat.state.length/2,sqr,sqr);
			}
		}
		popStyle();
		stroke(0);

                // draw oscill rect
		rect(x+cx,y+cy,3,3);
		fill(0);

                //draw speed number
		text(floor(tstep*1000),x,y-11);

                // special debug info
		if(debug){
			fill(0);
			text(time,(int)x+cx,(int)y+cy);
		}

                // save position and reset time + position (sync)
		if((time+HALF_PI)>TWO_PI&&(ltime+HALF_PI)<(TWO_PI)){
			float savePos = time-TWO_PI;
			time = savePos;
			getNewPattern();
		}

                // last time = now;
		ltime = time;


	}
	///////////// get new pattern from globally stored ones /////////////////
	void getNewPattern(){
		current+=1;

		if(current>=patterns.size()){
			current = 0;
			if(id==0 && record)
				reach=true;
		}

		pat = (Pattern)patterns.get(current);

	}

}
///////////// simple class for holding matrix values /////////////////

class Pattern{
	boolean [] state;


	Pattern(){
		state  = new boolean[(int)sq(size)];
		regen();
	}

	////////////// random generator ////////////////
	void regen(){
		for(int i = 0;i<state.length;i++){
			if(random(100)>50)
				state[i] = true;
			else
				state[i] = false;
		}

	}

}



///////////// class for drawing approx matrixes onto canvas /////////////////

class Plotter{
        // coords
	float plotX, plotY, lplotX, lplotY;
	// id value
        int id;
        
        // selection of affecting oscillators !
	boolean vliv[];

        // number of affecting oscillators
	int kolik = 0;

        // own averages of values
	int graph[];

        // alpha ? value
	float al = 0;

	Plotter(int _id){
		id = _id;

                // square "size" graph length
		graph = new int[(int)sq(size)];

                // affecting ? array
		vliv = new boolean[rotNum];

                // probability of being affected is approx. 1/3 ?
                // lower number results more varying drawing
                // higher more organized 
		for(int i  = 0;i<vliv.length;i++){
			if(random(100)<33){
				vliv[i] = true;
				kolik++;
			}else{
				vliv[i] = false;
			}
		}

                // set x,y's on "center"
		lplotX = plotX = width/2;
		lplotY = plotY = height/2;

	}


	void draw(){
                // last = now
                
		lplotX = plotX;
		lplotY = plotY;
                
                // update positions according global scale
		for(int i = 0;i<graph.length;i++){
			plotX += xs[i]*map(graph[i],0,kolik,0,scal);
			plotY += ys[i]*map(graph[i],0,kolik,0,scal);
		}

		img.stroke(0,alph);
		// some weird line on beggining
                if(frameCount>3)
                  img.line(plotX,plotY,lplotX,lplotY);

		//img.line(plotX-(atan2(lplotY-plotY,lplotX-plotX))*2,plotY,plotX+(atan2(lplotY-plotY,lplotX-plotX))*2,plotY);
		//img.strokeWeight(dist(plotX,plotY,lplotX,lplotY));
		//img.strokeWeight(map(atan2(lplotY-plotY,lplotX-plotX),-PI,PI,1,5));

                //graph debugging
		if(showGraph){
			img.stroke(0,20);
			img.line(graphX,map(abs(width/2-plotX),0,width/2,height/2+100,height/2-100),graphX,map(abs(width/2-lplotX),0,width/2,height/2+100,height/2-100));
			img.line(graphX,map(abs(height/2-plotY),0,height/2,height/2+100,height/2-100),graphX,map(abs(height/2-lplotY),0,height/2,height/2+100,height/2-100));
		}



                // border values
		plotBorder(40);


                // paint cross
		stroke(0,30);
		line(plotX-5,plotY,plotX+5,plotY);
		line(plotX,plotY-5,plotX,plotY+5);

                // some more debugging (useless)
		if(showCONNECT){
			stroke(0,3);
			for(int i = 0;i<cpu.size();i++){
				if(vliv[i]){
					CPU tmp = (CPU)cpu.get(i);
					line(tmp.x,tmp.y,plotX,plotY);

				}
			}
		}


                // show avg matrixes
		if(showGRPHS){
			int X = 0,Y=0;

			for(int i = 0;i<graph.length;i++){
				stroke(map(graph[i],0,kolik,255,0));
				point((int)(plotX+X),(int)(plotY+Y));//,prumSize,prumSize);


				X+=1;//prumSize;

				if(X>=size){
					X = 0;
					Y+=1;//prumSize;
				}

			}
		}

	}

        // constrian drawing
	void plotBorder(int kolik){
		if(plotX<kolik-20)plotX=width-kolik+20;
		if(plotX>width-kolik+20)plotX=kolik-20;

		if(plotY>YY-kolik+20)plotY=kolik-20;
		if(plotY<kolik-20)plotY=YY-kolik+20;

                // draw border
		pushStyle();
		rectMode(CORNERS);
		noFill();

		stroke(0,40);
		rect(kolik-20,kolik-20,width-kolik+20,YY-kolik+20);
		popStyle();

	}

        // funtion to modify current matrix averages
	void addVals(CPU tmp){


		for(int ii = 0;ii<(int)sq(size);ii++){
			graph[ii]+=tmp.getStateVal(ii);
			//al+=(PI-tmp.time);
		}

	}

}

// et voila!

