
import ddf.minim.*;

Minim minim;
AudioInput in;

void setup(){
  size(800, 600, P2D);
  background(#000000);
  frameRate = 30;
  smooth();
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 256);
}

//First line
float yPos = 0;
float xPos = 0;

//Second line
float xPos2 = 0;
float yPos2 = 0;

//Revind 
boolean rev = true;

//Write array
boolean take = true;

color c = color(255,255,255); 

//Array
float[] wave = new float[256];
float[]	currentWave = new float[256];
float[] changeWave = new float[256];	

int counter = 0;
int counterLimit = 10;

float dim = 1280/256;

float[] waveSorted;

void draw(){
	yPos += 0.5;
  	counter +=1;
	
  	//Качение вправо
	if ( rev == false){
    	xPos += 0.5;
    	
    	if (xPos > 0){
      		rev = true;
    	}
  	}
  
	//Качение влево
	if (rev == true){
    	xPos -= 0.5;
    	if (xPos < -100){
      		rev = false;
    	}
  	}
	
  	//Забираем данные по каунтеру
	if (counter >= counterLimit){
		getWaveData();
    	counter = 0;
	}
	
	drawLine();
	
	//Возвращаем назад при привышении высоты и перерисовываем сцену
 	if (yPos > height){
  		background(#000000);
    	yPos = 0;
  	}
  
}

void getWaveData(){
	for(int i = 0; i < in.bufferSize() - 1; i++){
      wave[i] = in.left.get(i);
      waveSorted = sort(wave);
      float x = round(waveSorted[255] * 1000);
      println(x);
      colorMode(RGB, 255);
      c = color(255,255,255, x);
    }
    
    for (int i = 0; i < wave.length; i++){
    	changeWave[i] = (wave[i] - currentWave[i]) / counterLimit;
    }
}

void drawLine(){
	stroke(c);
	strokeWeight(0.5);
	
	translate(xPos, -yPos);
  
  	for (int i = 0; i < 256 - 1; i++){
  		currentWave[i] += changeWave[i];
    	line(i * dim, height - currentWave[i] * 150, (i+1) * dim, height - currentWave[i+1] * 150);
	}
}

void stop() {
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  
  super.stop();
}

