
//Define images
PImage bg1;
PImage bg2;

//Create array for sparkles
Pixels[] px = new Pixels[39];

//Define variables
int runthreads = 1;
int keeploop = 0;

void setup(){
  //Set applet size
  size(800, 175); 
  //Set applet frame rate
  frameRate(30);
  //Load images and attach to variables
  bg1 = loadImage("bg1.jpg");
  bg2 = loadImage("bg2.png");
}



public class Pixels extends Thread {
  // Constructor, create the thread
  // It is not running by default
  float pSize; float pX; float pY; float pOpacity; float pSpeed; int pBehave;
  boolean running=false;

  public Pixels (float _pSize, float _pX, float _pY, float _pOpacity, float _pSpeed, int _pBehave){
    pSize=_pSize;
    pX=_pX;
    pY=_pY;
    pOpacity=_pOpacity;
    pSpeed=_pSpeed;
    pBehave=_pBehave;
  }

  public void start ()
  {
    // Do whatever start does in Thread
    running=true;
    super.start();
  }

  public void run ()
  {
    //Set thread sleep length
    int sleepFor = 33;

//Ensure thread loops
while(keeploop < 1){
        //If the sparkle behaviour is set to grow
	if(pBehave == 1){
		while(pSize < 5){
                        //Increase sparkle size + alpha
			pSize = pSize + pSpeed;
			pOpacity = pOpacity + (pSpeed * pSize);
                        //Make sparkle move down from starting position
                        pY += pSpeed;
                        
                        //When sparkle size is greater than 4 set 
                        //behaviour to shrink
			if(pSize > 4){
				pBehave = 2;
			}else{
                                //If sparkles opacity reaches max
                                //set behaviour to shrink
				if(pOpacity >= 255){
					pBehave = 2;
				}
			}//Make thread wait
			try{
			Pixels.sleep(sleepFor);
			}catch(InterruptedException e) {}
			}
		}else{
                //Do while sparkle is bigger than 0 pixels
		while(pSize > 0){
                        //Decrease size + alpha by sparkles speed
			pSize = pSize - pSpeed;
			pOpacity = pOpacity - (pSpeed * pSize);
                        //Move sparkle down
                        pY += pSpeed;
                        //Make thread wait
			try{
			Pixels.sleep(sleepFor);
			}catch(InterruptedException e) {}
			}
		}
                //Create new values if size is < 0
		if(pSize <= 0){
			//Create new sparkle
			pSize = random(0,3);
			pX = random(20,780);
			pY = random(50,125);
			pOpacity = random(0,175);
			pSpeed = random(0.5, 0.99);
			pBehave = 1;
                        //Draw new sparkle
                        rect(pX,pY,pSize,pSize);
		}else{
                        //Or if alpha = 0 create new
			if(pOpacity <= 0){
				//Create new sparkle
				pSize = random(0,3);
				pX = random(20,780);
				pY = random(50,125);
				pOpacity = random(0,175);
				pSpeed = random(0.5, 0.99);
				pBehave = 1;
                                rect(pX,pY,pSize,pSize);
			}
		}
	}
}
}


//Draw occurs once per frame (30 times per second)
void draw(){
  //Set background to black
  background(0);
  //Draw background image
  image(bg1,0,0);
  //Turn stroke off (rect border)
  noStroke();
  //If threads have not been started
  if(runthreads == 1){
    //Create each sparkle and start thread
    for(int i = 0; i < 39; i = i + 1){
      px[i] = new Pixels(random(0,3),random(20,780),random(50,125),random(0,175),random(0.5,0.99),1);
      px[i].start();
    }  
    //Set to running
    runthreads = 2;
  }else{  
    //Set fill to sparkles alpha level and draw
    for(int i = 0; i < 39; i = i + 1){
      fill(#FFFFFF,px[i].pOpacity);
      rect(px[i].pX,px[i].pY,px[i].pSize,px[i].pSize);
    }
  }
  //Draw overlayed background image
  image(bg2,0,0);
}


