
//list of stuff to do
/*
 1. other chords---are possible
 2. rotate fix to boolean --- eh its ok
 3. volume control --
 4. multiple particle systems with each waves  -- two for now
 5. sequencing/timing--
 6. grow/decay horizontal/vertical--added parameterized version
 7. add particles based on timing
 8. make particles MOVE along a curve..liek a sinewave for example..
 9. make use of slow down of particles
 10. have a volume finish ...fadeout
 11. remove pictures that are difficult.
 
 
 */
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;



import java.awt.geom.Point2D;
import java.util.LinkedList;
import java.util.List;

import java.io.*;

//import org.apache.batik.parser.DefaultPointsHandler;
//import org.apache.batik.parser.ParseException;
//import org.apache.batik.parser.PointsHandler;
//import org.apache.batik.parser.PointsParser;
//






//String directory = "C:\\Documents and Settings\\Aaron Albin\\My Documents\\Processing\\particleSys\\";
String directory ;






Minim minim[];
AudioOutput out[];
ParticleSystem[] ps;
int freqOffset=200;
long time=23;
long time2=23;


//ArrayList waves;
int numParticles;
float maxGainPerParticle=1.0/100;
int pID=0;
int[] noteFrequencies;
int[][] chordArray;
int chordIterator;

int sequenceIterator=0;
int[][] sequences= { { 0, 3, 6, 9},
		{ 0, 3, 6, 10},
		{ 0, 3, 7},
		{ 0, 4, 7},
		{ 0, 4, 7, 9},
		{ 2, 4, 6, 11},
		{ 1, 3, 7},
		{ 0, 3, 6},
		{ 0, 4, 7},
};



float[] rotateArray(float[]arr, int leftOrRight)
{
  if(leftOrRight>0){
    //move right most to leftmost
    float tmp=arr[arr.length-1];
    // Shift all elements right by 1
    System.arraycopy(arr, 0, arr, 1, arr.length-1);
    arr[0]=tmp;
  }
  else
   {
      // move leftmost to right most
      float tmp=arr[0];
      // Shift all elements left by 1
      System.arraycopy(arr, 1, arr, 0, arr.length-1);
      arr[arr.length-1]=tmp;
       }
     
     return arr;

  
  
}
void mousePressed(){

	//System.out.println("the mouse pressed method was entered"); 
	//ps[pID].followMouse(mouseX,mouseY);
}

void mouseReleased(){

	//System.out.println("the mouse released method was entered"); 
	//ps[pID].releaseAccel();
}

void keyPressed() {


	if(key=='1')
	{
		pID=0;
		System.out.println(pID);
	}
	if(key=='2')
	{
		pID=1;     
		System.out.println(pID);
	}  


	/*if (key == 'r') 
	{
		System.out.println("r pressed");

		ps[pID].rotateParticles();

	}*/

	if(key == 's')
	{
		ps[pID].stopParticles();
		ps[pID].moveTrig=false;
		ps[pID].moveToPos=false;
                ps[pID].moveToPositions=false;
		for(int i=0;i<ps[pID].animation.length;i++)
		{
			ps[pID].animation[i]=false;
		}
	}
	if(key=='f')//formerly rotate about mouse
	{
		//ps[pID].rotateAboutMouse(mouseX,mouseY); 
                ps[pID].grow(1,0);
                
	}
	if(key==',') //was set scale...
	{
		//ps[pID].setScale(); 
              time=System.currentTimeMillis();
              ps[pID].runAnimation(13);
              ps[pID].animationList= null;
	}
	if(key=='b')
	{
		ps[pID].setBoundary();    
	}
	if(key=='v')
	{
		ps[pID].decay();
	}
	if(key=='c')
	{
		ps[pID].grow();
	}
	if(key=='g')
	{

		ps[pID].addParticle(mouseX, mouseY);

	}

	if(key=='h')
	{
		ps[pID].removeParticle();
	}

	if(key=='.')
	{
		ps[pID].setVertical(mouseX,mouseY); 
	}
	if(key=='/')
	{
		ps[pID].setHorizontal(mouseX,mouseY); 
	}
	if(key=='m')
	{
		ps[pID].setMajorChord(mouseX,mouseY); 
	}
	if(key=='n')
	{
		ps[pID].setMinorChord(mouseX,mouseY); 
	}

	if(key=='o')
	{
		ps[pID].setDiminishedChord(mouseX,mouseY); 
	}

	if(key=='p')
	{
		ps[pID].setHalfDiminishedChord(mouseX,mouseY); 
	}
	if(key=='i')
	{
		ps[pID].setAugmentedChord(mouseX,mouseY); 
	}

	if(key=='[') //formerly widen increase size
	{
		//ps[pID].widenParticles(); 
                if(ps[pID].targetPositions==null)
                {
                 System.out.println("targetPositonswasnull");
                  ps[pID].targetPositions=ps[pID].imagePoints[0];
                }

                time=System.currentTimeMillis();
		ps[pID].runAnimation(11);
                ps[pID].animationList=null;
                
	}

	if(key==']')
	{
		ps[pID].shrinkParticles(); 
	}
	if(key=='z')
	{
		ps[pID].reverseDirection(); 
	}

	if(key=='u')//formerly specialrotate
	{
		//ps[pID].specialRotate(mouseX,mouseY); 
              if(ps[pID].imagePoints==null)
              {
                System.out.println("was null now loading");
               ps[pID].imagePoints=findImages();
              }
               ps[pID].runAnimation(6);
               ps[pID].targetPositions=ps[pID].imagePoints[ps[pID].imageIterator];
               
               
               
	}

	if(key=='t')
	{
		chordArray[pID] = new int[]{  0,3,4,5,9   };
		ps[pID].setMoveTrig();
	}
	if(key==';') //formerly print particles
	{
		//ps[pID].printParticles();
              time=System.currentTimeMillis();
              ps[pID].runAnimation(9);
              ps[pID].animationList= null;

                
	}

	if(key=='d')
	{
		System.out.println("d pressed");
		/*for(int i=0;i<5;i++)
    {
        ps[pID].addParticle(width/2,height/2); 
        System.out.println("adding particle");
    }*/
		ps[pID].runAnimation(0);
                ps[pID].animationList= null;

	}

	if(key=='a')
	{
		System.out.println("a pressed");
		/*for(int i=0;i<5;i++)
    {
        ps[pID].addParticle(width/2,height/2); 
        System.out.println("adding particle");
    }*/
		time=System.currentTimeMillis();
		ps[pID].runAnimation(1);
                ps[pID].animationList=null;

	}

        if(key=='q')
        {
          
           ps[pID].targetPositions=getPointsFromSVG("hello8.svg");
           ps[pID].runAnimation(6);
           ps[pID].animationList= null;  
          
        }
        
        if(key=='`')   
        {
          time=System.currentTimeMillis();
          time2=System.currentTimeMillis();
           ps[pID].runAnimation(8);
           ps[pID].animationList= null;  
        }
        


	if(key=='x')
	{
		System.out.println("x pressed");
		/*for(int i=0;i<5;i++)
    {
        ps[pID].addParticle(width/2,height/2); 
        System.out.println("adding particle");
    }*/
		time=System.currentTimeMillis();
		//ps[pID].setHorizontal(width/2, height/2);

		ps[pID].runAnimation(2);
                ps[pID].animationList=null;

	}

	if(key=='w')
	{
		chordArray[pID]= sequences[sequenceIterator];
		System.out.println("w pressed");
		/*for(int i=0;i<5;i++)
    {
        ps[pID].addParticle(width/2,height/2); 
        System.out.println("adding particle");
    }*/
		time=System.currentTimeMillis();
		ps[pID].runAnimation(3);

	}

	if(key=='=')
	{
		ps[pID].increaseAlpha();
	}
	if(key=='-')
	{
		ps[pID].decreaseAlpha();
	}

	if(key=='9')
	{
		ps[pID].decreaseSquareBound();
		System.out.println(ps[pID].squareBound);
	}
	if(key=='0')
	{
		ps[pID].increaseSquareBound();
		System.out.println(ps[pID].squareBound);

	}

	if(key=='3')
	{
		ps[pID].setMoveToPos(mouseX, mouseY, .01, .01);

	}

	if(key=='4')
	{
		ps[pID].appearAt(mouseX, mouseY, new PVector( random(2)-1, random(2)-1), new PVector(0, 0) );

	}
	if(key=='5')
	{
		ps[pID].explodeAt(mouseX, mouseY, 2 , 2, 0, 1 );
	}

	if(key=='6')
	{

                float[] xinterp;
                float[] yinterp;
                
                float[][] results=getPointsFromSVG("hello.svg");
                xinterp=results[0];
                yinterp=results[1];


		int plimit=40;
		// choose to use xarr or xinterp here
		if(xinterp.length<plimit)
		{
			for(int i=0;i<xinterp.length;i++)
			{
				ps[pID].addParticle(xinterp[i], yinterp[i]);
				ps[pID].stopParticles();
			}
			System.out.println("xinterp size "+ xinterp.length);
		} 
		else
		{
			int ans=xinterp.length/plimit;
			int res=xinterp.length/plimit;
			System.out.println("too many: doing div by" + plimit + ":" + ans + " ...res:" + res); 
			for(int i=0;i<xinterp.length/ans;i++)
			{
				ps[pID].addParticle(xinterp[ans*i], yinterp[ans*i]);
				ps[pID].stopParticles();
			}

		}


	}




        if(key=='7')
	{

             ps[pID].setMoveToPositions(getPointsFromSVG("hello3.svg"),.01,0);
	     //ps[pID].setMoveToPositionsConstantV(getPointsFromSVG("hello3.svg"),1,0);

              /*int pointsToPlot=20;
              float[][]newPoints = new float[2][pointsToPlot];
              for (int i=0;i<newPoints[0].length;i++)
              {
                
               newPoints[0][i]=i*width/pointsToPlot;
               float frequency=9;
               float yval= 100* (float)Math.sin(2*Math.PI*frequency*(float)i/pointsToPlot)  +   height/2;
               System.out.println(yval);
               newPoints[1][i]=yval;
               
              }
              ps[pID].setMoveToPositionsConstantV(newPoints,1,0);
              */
              
              
	}

        if(key=='k')
        {
          rotateArray(ps[pID].targetPositions[0],1); 
          rotateArray(ps[pID].targetPositions[1],1);
        }

        if(key=='y')
	{


             time=System.currentTimeMillis();
             ps[pID].animationList=null;
             ps[pID].runAnimation(7);
	


	}

        if(key=='j')
        {
          time=System.currentTimeMillis();
          ps[pID].animationList=null;
          ps[pID].runAnimation(5); 
          
        }

	if(key=='e')
	{
                ps[pID].targetPositions=getPointsFromSVG("hello8.svg");
		ps[pID].runAllAnimations();
	}

        if(key=='r')
	{
                ps[pID].targetPositions=getPointsFromSVG("hello7.svg");
		ps[pID].setAnimationList(new int[]{8,1,2,3,4,1,3,13,0,13,13,5,6,8,7,15,1,4,1,4,6,1,4,6,1,4,6,1,4,6,10,13,4,10,13,4,10,13,4,10,13,4,11,4,3,12,12,12,999} );
                ps[pID].startAnimationList();
	}

        if(key=='l')
        {
          time=System.currentTimeMillis();
          ps[pID].runAnimation(10); 
          if(ps[pID].targetPositions==null)
          {
             System.out.println("targetPositonswasnull");
            ps[pID].targetPositions=ps[pID].imagePoints[0];
          }
          
        }

	else 
	{

	}


}


float[][][] findImages()
{
  //System.out.println("this is the directory " + directory);
  File dir = new File(directory); 
  String[] children ;//= dir.list(); 
  
  FilenameFilter filter = new FilenameFilter() 
  { 
    public boolean accept(File dir, String name) 
    { 
      return name.endsWith(".svg"); 
    } 
  }; 
  children = dir.list(filter); 
  
  float [][][] result= new float[children.length][][];
  for(int i=0; i<children.length;i++)
  {
    System.out.println(children[i]);
    result[i]=getPointsFromSVG(children[i]);
    
  }
  
  return result;
  
  
  
}

float[][] getPointsFromSVG(String fname)
{
 
                File testFile = new File(directory + fname );//hello3.svg");
		ArrayList arrList=  getLine(testFile);
                if(arrList!=null)
                {
                  
		float[] xarr = new float[arrList.size()/2];
		float[] yarr= new float[arrList.size()/2];
		for (int i=0; i<arrList.size()/2;i++ ) 
		{
			Float p1= (Float) arrList.get(2*i);
			Float p2= (Float) arrList.get(2*i+1);
			xarr[i]=width/100.0*p1;     
			yarr[i]=height/100.0*p2;
			//System.out.println("here is: " + p1 + "," + p2  + " converted to: " + xarr[i] + ","+ yarr[i]) ;

		}

		int factor=4;//points between =factor -1??
		float[] xinterp = new float[xarr.length*factor-factor];
		float[] yinterp = new float[yarr.length*factor-factor];

		//System.out.println("xarr.length: " + xarr.length);
		for(int i=0; i<xarr.length-1;i++)
		{
			for(int j=0; j<factor; j++)
			{
				int index=factor*i+j;
				if(index==yarr.length*factor)
					break;

				float xval=(xarr[i+1]-xarr[i])/factor;
				xinterp[index]= xarr[i]+j*xval;

				float yval=(yarr[i+1]-yarr[i])/factor;
				yinterp[index]= yarr[i]+j*yval;

				//System.out.println("j is: " + j + " i is: " + i + "  index is: " + (factor*i+j));

			}

		}

                float[][] result= new float[2][xinterp.length];
                result[0]= xinterp;
                result[1]= yinterp;
                
                return result;
                
                
                
                }
                else
                {
                  //System.out.println("arraylist was null");
                  float[][] result= new float[2][10];
                  for(int i=0;i<10;i++)
                  {
                    result[0][i]=(width/10)*i;
                    result[1][i]=(height/10)*i;
                  }
                  
                  return result;
                  
                  
                }
  
}





void setup() {


	size(750, 750);
	colorMode(RGB, 255, 255, 255, 100);

	float start=27.5;
	noteFrequencies=new int[62];
	for (int i=0; i < noteFrequencies.length; i++) {
		float power= pow(    2,  ((i+0)/12.0)  );
		noteFrequencies[i]=round(start*power);
	}
        System.out.println(" this is the sketchpath: "  + sketchPath);
        directory = sketchPath + "/images/" ;

	//Boundary B= new Boundary(0.0, 0.0, (float) width, (float)height, (float)10);


	numParticles=0;
	ps = new ParticleSystem[2];
	ps[0] = new ParticleSystem(numParticles, new PVector(width/2,height/2,0),0);
	ps[1] = new ParticleSystem(0, new PVector(width/2,height/2,0),1);

	chordArray= new int[2][];

	//MINIM 
	minim = new Minim[2];
	out = new AudioOutput[2];

	minim[0] = new Minim(this);
	// get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
	out[0] = minim[0].getLineOut(Minim.STEREO);

	minim[1] = new Minim(this);
	// get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
	out[1] = minim[1].getLineOut(Minim.STEREO);


	//wave = new SawWave(440, 0.5, out.sampleRate());
	//out.addSignal(wave);
	// create a sine wave Oscillator array, set to position Hz, at 0.2 amplitude, sample rate from line ou
	//waves=new SawWave[numParticles];
	//waves = new ArrayList(); 
	for (int i =0; i<numParticles;i++)
	{

		SawWave w=new SawWave(440.0, maxGainPerParticle, out[0].sampleRate());
		w.portamento(100);
		out[0].addSignal(w);
		ps[0].waves.add(w);
		//waves[i].portamento(100);

	}
	//ps[0].setHorizontal();


	//smooth();
}

void draw() {
	background(0);

	//logarithmic grid
	for (int i=6; i < noteFrequencies.length; i++) {
		line(0, noteFrequencies[i]-freqOffset, width, noteFrequencies[i]-freqOffset);
	} 


	ps[0].run();
	ps[1].run();
	if(mousePressed){
		ps[pID].followMouse(mouseX,mouseY);
	}
	else{
		ps[pID].releaseAccel(); 
	}
	//ps[0].followMouse(mouseX,mouseY);
	//ps[1].followMouse(mouseX,mouseY);
}
















// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

	ArrayList particles;    // An arraylist for all the particles
	PVector origin;        // An origin point for where particles are born
	float inc;
	//boolean boundary;
        boolean verticalBoundary;
        boolean horizontalBoundary; 
	int squareBound=10;
	boolean moveTrig;
	boolean moveToPos;
        boolean moveToPositions;
        boolean moveToPositionsConstantV;
	boolean[] animation = new boolean[24];
	boolean targetReached;
	boolean animationComplete=false;
	int nextAnimation=0;
        int animationIterator=0;
        int imageIterator=0;
        int[] animationList;
         
        int loopVal=0;
        
        int animation10Interval=400;
        
        boolean animation15Flag=false;
        

	int systemID;
	ArrayList waves;


	//for MoveToPos
	float targetx,  targety,  targetvel,  targetacc;

        //for moveToPositions
        float[][] targetPositions;
        float[][][] imagePoints;

	int particleSize;
	//int startColor=1;


	ParticleSystem(int num, PVector v,int sysID) {
		systemID=sysID;
		particles = new ArrayList();              // Initialize the arraylist
		waves= new ArrayList();
		origin = v.get();                        // Store the origin point
		for (int i = 0; i < num; i++) {
			//particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
			float spread=100;
			PVector b = new PVector(spread*random(-1,1),spread*random(-1,1));

			b.add(origin);
			//particles.add(new Particle(b,  int(random(1,244))  ,1 ));
			particles.add(new Particle(b,  int(random(1,244))  ,1,i ));


		}

                imagePoints=findImages();
	}

	void run() {
		// Cycle through the ArrayList backwards b/c we are deleting
		for (int i = particles.size()-1; i >= 0; i--) {
			Particle p = (Particle) particles.get(i);
			//p.run();
			p.run(i); 

			SawWave w = (SawWave) waves.get(i);
			w.setFreq(p.loc.y+freqOffset);
			float pan =2.0*p.loc.x/width -1.0;
			w.setPan(pan);
			//System.out.println("alphaVal " + p.alphaVal);
			w.setAmp(p.alphaVal);



			p.updateColorVal();
			//p.setColorVal(p.getColorVal()+colorValUpdate);
			int pcval=p.getColorVal();
			//System.out.println(pcval);
			if(p.getColorVal()==255)
			{
				//System.out.println("yes");
				p.setColorVal(254);
				p.setColorValUpdate(-1);
			}
			if(p.getColorVal()==0)
			{
				//System.out.println("yes2");
				p.setColorVal(1);
				p.setColorValUpdate(1);
			}

			if (p.dead()) {
				particles.remove(i);
			}

			//boundary=true;
			if(verticalBoundary)
			{   
				//this code makes it too slow right now
				/*rectMode(RADIUS);
                                 noFill();
                                 rect(width/2, height/2, (width/2-squareBound), (height/2-squareBound));
				 */

				if (p.loc.y > height-squareBound) { 
					p.vel.y *= -1; 
					p.loc.y = height-(squareBound+1); 
				} 
				if (p.loc.y < squareBound) { 
					p.vel.y *= -1; 
					p.loc.y = (squareBound+1); 
				} 

			}
                        
                        if(horizontalBoundary)
                        {
                            if (p.loc.x > width-squareBound) { 
					p.vel.x *= -1; 
					p.loc.x = width-(squareBound+1); 
			    } 
		            if (p.loc.x < squareBound) { 
				p.vel.x *= -1; 
					p.loc.x = (squareBound+1); 
			    } 
                        }

			//moveTrig=true;
			if(moveTrig)
			{

				//int[] chordArray= { 0, 4, 7};
				moveToFreqs(mouseX, getTargetFreqs(mouseY,chordArray[pID]) );

			}

			if(moveToPos)
			{

				//int[] chordArray= { 0, 4, 7};
				moveToPos();

			}

                        if(moveToPositions)
			{

				//int[] chordArray= { 0, 4, 7};
				moveToPositions();

			}

                        if(moveToPositionsConstantV)
                        {
                          
                            moveToPositionsConstantV(); 
                        }
                        
                        


			//runAnimation
			if(animation[0])
			{        
				animation0();        
			}
			if(animation[1])
			{        
				animation1();        
			}
			if(animation[2])
			{        
				animation2();        
			}
			if(animation[3])
			{        
				animation3();        
			}
                        if(animation[4])
			{        
				animation4();        
			}
                        if(animation[5])
			{        
				animation5();        
			}

                        if(animation[6])
			{        
				animation6();        
			}
                        if(animation[7])
			{        
				animation7();        
			}
                        if(animation[8])
			{        
				animation8();        
			}
                        if(animation[9])
			{        
				animation9();        
			}
                        if(animation[10])
			{        
				animation10();        
			}
                        if(animation[11])
			{        
				animation11();        
			}

                        if(animation[12])
			{        
				animation12();        
			}
                        if(animation[13])
			{        
				animation13();        
			}
                         
                        if(animation[14])
			{        
				animation14();        
			}

                        if(animation[15])
			{        
				animation15();        
			}
                    

		}
	}





	////////////////////////////////////////ANIMATION FUNCTIONS GO HERE
	void animation0()
	{
                verticalBoundary=false;
                horizontalBoundary=true;
		animationComplete = false;
		chordArray[pID]= sequences[sequenceIterator];

		//new int[]{  0,3,4,5,9   };
		//moveToFreqs(width/2, getTargetFreqs(110,chordArray[pID]) );
		moveToFreqs(getTargetFreqs(110,chordArray[pID]) );
		if(!targetReached)
		{
			//System.out.println("target Not Reached Yet in animation0 ");  
		}

		if(targetReached){
			System.out.println("target reached in animation0.  iterating to next chord in sequence");
			sequenceIterator++;
		}

		if(sequenceIterator==sequences.length)
		{
			animation[0]=false;
			sequenceIterator=0; 
			System.out.println("finished iterating through sequence.  setting sequence iterator to " +  sequenceIterator + "  animation is " +animation[0]);
			animationComplete=true;
                        targetReached=false;
                        verticalBoundary=false;
                        horizontalBoundary=false;
                        
                        
                        if(animationList!=null){
                          switchAnimation(animationList[animationIterator]);
                          System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
                          updateIterator();
                        }
		}

		//stopParticles();
		//setMinorChord(440,width/2);
	}


        //grow in speed animation
	void animation1()
	{
		animationComplete = false;
		//stopParticles();
		grow(.006);
		//System.out.println("animation1 entered grow called");



		if(System.currentTimeMillis()-time>2000)
		{
			animation[1]=false; 
			System.out.println("target time reached in grow animation 1. setting both boundaries");
			verticalBoundary=true;
                        horizontalBoundary=true;
			animationComplete=true;
    
    
                        if(animationList!=null)
                        {
                          switchAnimation(animationList[animationIterator]);
                          System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
                          updateIterator();
                        }
                        
		} 


	}

        //special rotate
	void animation2()
	{
		animationComplete = false;
		//stopParticles();
		specialRotate(width/2,height/2);

		//System.out.println("animation2 entered specialRotate() called");



		if(System.currentTimeMillis()-time>10000)
		{
			animation[2]=false; 
			System.out.println("target time reached in animation 2 special rotate .  rotation stopping");
			animationComplete=true;

                        if(animationList!=null){
                          switchAnimation(animationList[animationIterator]);
                          System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
                        
                          updateIterator();
                        }

		} 

	}
        
        //move to the center of the screen
	void animation3()
	{
  
                //System.out.println("animation3 entered setMveToPos called");

		animationComplete = false;

                setMoveToPos(width/2, height/2, .01, .01);
                
                if(!targetReached)
		{
			//System.out.println("target Not Reached Yet in animation 3");  
		}

		if(targetReached){
			System.out.println("target reached in animation 3 move to center of screen");
			animation[3]=false;
                        animationComplete=true;                      
                        targetReached=false;
                        
                        if(animationList!=null)
                        {
                          switchAnimation(animationList[animationIterator]);
                          System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
                          updateIterator();
                        }
                        
		}



		/*if(System.currentTimeMillis()-time>10000)
		{
			animation[3]=false; 
			System.out.println("target time reached in animation 3 ");
                        animationComplete=true;                      

                        switchAnimation(animationList[animationIterator]);
                        updateIterator();

		}*/


	}

        //slow down the particles
	void animation4()
	{
		animationComplete = false;
		//stopParticles();
		decay(.006);
		//System.out.println("animation4 entered decay called");     
		if(System.currentTimeMillis()-time>2000)
		{
			animation[4]=false; 
			System.out.println("target time reached in animation 4 decay. ");
			//boundary=true;
                        verticalBoundary=false;
                        horizontalBoundary=false;
			animationComplete=true;
                        
                        if(animationList!=null)
                        {
                             
                            switchAnimation(animationList[animationIterator]);
                            System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
                        
                            updateIterator();
                        
                        }
		} 


	}

        void animation5()
        {
          animationComplete=false;
          explodeAt(int(random(width)), int(random(height)), 2 , 2, 0, 1 );
          if(System.currentTimeMillis()-time>10000)
          {
            animation[5]=false;
            System.out.println("target time reached in animation 5. ");
            System.out.println("targetReached shoudl not be affected but as of now is: "+ targetReached);
			
           animationComplete=true; 
           
           if(animationList!=null){
             switchAnimation(animationList[animationIterator]);
             System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
             updateIterator();
           }
          }
          
          
          
          
        }
        
        //THIS ONE IS THE SHAPE ANIMATION
        void animation6()
        {          
          
           animationComplete=false;    
          //setMoveToPositions(targetPositions, .01, 0);
          targetvel=.01;
          targetacc=0;
          moveToPositions();
          
          if(!targetReached)
          {
	      //System.out.println("target Not Reached Yet in animation 6");  
          }
          
          if(targetReached){
            
            System.out.println("target reached in animation 6");
            animation[6]=false;
            //moveToPositions=false;
            animationComplete=true;                      
            targetReached=false;
                        
            updateImageIterator();
            
                        
            if(animationList!=null)
            {
             switchAnimation(animationList[animationIterator]);
             System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
             updateIterator();
            }
            
          }
        }
        
        //THIS ONE IS A REGULAR ROTATE ANIMATION
        void animation7()
        {
          
            animationComplete=false;    
          rotateAboutMouse(width/2,height/2);
          if(System.currentTimeMillis()-time>10000)
		{
			animation[7]=false; 
			System.out.println("target time reached in animation 7 .  rotation stopping");
			animationComplete=true;

                        if(animationList!=null){
                          switchAnimation(animationList[animationIterator]);
                          System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
                        
                          updateIterator();
                        }

		}          
        }
        
        
        
        
        //THIS ONE IS AN ADD ONE ???
        void animation8()
        {
          
           animationComplete=false;    
          int interval=500;
          int plimit=50;
          if(System.currentTimeMillis()-time2>interval)
          {
            if(particles.size()<plimit){
              System.out.println("addingparticle");
              addParticle(width/2,height/2);
              time2=System.currentTimeMillis();
            }
            else
            {
             System.out.println("over the particle limit.");              
              time2=System.currentTimeMillis();
            }
          }
          
          if(System.currentTimeMillis()-time>10000){
            
            animation[8]=false;
            System.out.println("target time reached in animation 8 . stopping adding of particles");
            animationComplete=true;
            
            
            
            if(animationList!=null)
            {
             switchAnimation(animationList[animationIterator]);
             System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
             updateIterator();
            }
          }
          
          
        }
        
        
        //volume
        void animation9()
        {
          
          float value=maxGainPerParticle*(float)Math.cos((float)loopVal/(9*Math.PI));
          //System.out.println(value);
          setAlpha( value );
          loopVal++;
          
          
          if(System.currentTimeMillis()-time>10000){
            
            animation[9]=false;
            System.out.println("target time reached in animation 9 . stopping volume changes");
            animationComplete=true;
            setAlpha( maxGainPerParticle );
            if(animationList!=null)
            {
             switchAnimation(animationList[animationIterator]);
             System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
             updateIterator();
            }
          }
        }
        
        //movetoPositions with rotate array thing
        void animation10()
        {
          animationComplete=false;    
          //int interval=500;
          //int plimit=50;
          targetvel=.01;
          targetacc=0;
          moveToPositions();
          
          
          if(System.currentTimeMillis()-time2>animation10Interval)
          {
            
              
              //addParticle(width/2,height/2);
              rotateArray(ps[pID].targetPositions[0],1); 
              rotateArray(ps[pID].targetPositions[1],1);
              time2=System.currentTimeMillis();
  
              if(animation10Interval>70)
              {
                animation10Interval= animation10Interval-7; 
                //System.out.println("rotating.....animation10interval is " + animation10Interval);     
              }
            
          }
          
          if(System.currentTimeMillis()-time>20000){
            
            
            animation[10]=false;
            System.out.println("target time reached in animation 10 . rotate array thing");
            animationComplete=true;
            animation10Interval=400;
            
            //choose a diff image next time
            updateImageIterator();
            
            if(animationList!=null)
            {
             switchAnimation(animationList[animationIterator]);
             System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
             updateIterator();
            }
          }
        }
        
        
        //this is a hodge podge
        void animation11()
        {
          animationComplete=false;    
          //int interval=500;
          //int plimit=50;
          targetvel=.01;
          targetacc=0;
          int choice=int(random(4+1));
          
          int index=int(random(24));
          int freqStart=(int)(   110*Math.pow(2, index /12.0 )  );
          //System.out.println(index);
          
          
          
          
          if(System.currentTimeMillis()-time2>animation10Interval)
          {
            
            
            switch (choice) {
            case 0:  setHorizontal(int(random(width)),freqStart); time2=System.currentTimeMillis(); break;
            case 1:  setVertical(int(random(width)),freqStart); time2=System.currentTimeMillis();  break;
            case 2:  setAugmentedChord(int(random(width)),freqStart);time2=System.currentTimeMillis(); break;
            case 3:  setDiminishedChord(int(random(width)),freqStart);time2=System.currentTimeMillis();  break;
            case 4:  setHalfDiminishedChord(int(random(width)),freqStart); time2=System.currentTimeMillis(); break;
            case 5:  setMajorChord(int(random(width)),freqStart); time2=System.currentTimeMillis(); break;
            case 6:  setMinorChord(int(random(width)),freqStart); time2=System.currentTimeMillis(); break;
            
            default: //stopParticles(); 
                    for(int b=0; b<animation.length;b++){
                     animation[b]=false; 
                    }                    
                    System.out.println("anything else stops all animations.");break;
            }
              
              
              
              time2=System.currentTimeMillis();
  
              if(animation10Interval>50)
              {
                animation10Interval= animation10Interval-7; 
                //System.out.println("animation10interval is " + animation10Interval);     
              }
            
          }
          
          if(System.currentTimeMillis()-time>20000){
            
            //just for a dramatic ending
            setMajorChord(width/2,height/2);
            
            
            animation[11]=false;
            System.out.println("target time reached in animation 11 . rotate array thing");
            animationComplete=true;
            animation10Interval=400;
            
            //choose a diff image next time
            updateImageIterator();
            
            if(animationList!=null)
            {
             switchAnimation(animationList[animationIterator]);
             System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
             updateIterator();
            }
          }
          
          
          
        }
        
        
        //remove particle animation
        void animation12()
        {
          animationComplete=false;    
          int interval=500;
          int plimit=50;
          if(System.currentTimeMillis()-time2>interval)
          {
            if(particles.size()>0){
              System.out.println("removing particle");
              removeParticle();
              time2=System.currentTimeMillis();
            }
            else
            {
             System.out.println("no more particles to remove");              
              time2=System.currentTimeMillis();
            }
          }
          
          if(System.currentTimeMillis()-time>10000){
            
            animation[12]=false;
            System.out.println("target time reached in animation 12 . stopping removal of particles");
            animationComplete=true;
            
            
            
            if(animationList!=null)
            {
             switchAnimation(animationList[animationIterator]);
             System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
             updateIterator();
            }
          }
          
        }
        
        
        //grow x animation
        void animation13()
        {
                animationComplete = false;
		//stopParticles();
		grow(.001,0);
		//System.out.println("animation13 entered growx called");



		if(System.currentTimeMillis()-time>2000)
		{
			animation[13]=false; 
			System.out.println("target time reached in animation13. setting boudnaries to true");
			verticalBoundary=true;
                        horizontalBoundary=true;
			animationComplete=true;
    
    
                        if(animationList!=null)
                        {
                          switchAnimation(animationList[animationIterator]);
                          System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
                          updateIterator();
                        }
                        
		}                    
        }
        
        //slow down x
        void animation14()
        {
                animationComplete = false;
		//stopParticles();
		decay(.003,0);
		System.out.println("animation14 entered decay called");



		if(System.currentTimeMillis()-time>2000)
		{
			animation[14]=false; 
			System.out.println("target time reached in animation13. removing both boundaries");
			verticalBoundary=false;
                        horizontalBoundary=false;
			animationComplete=true;
    
    
                        if(animationList!=null)
                        {
                          switchAnimation(animationList[animationIterator]);
                          System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
                          updateIterator();
                        }
                        
		}                    
        }
        
        //special rotate from horizontal
        void animation15()
        {
                
          if(!animation15Flag)
          {
            setHorizontal(width/2,height/2);
            animation15Flag=true; 
          }
          
          
                animationComplete = false;
		//stopParticles();z
		specialRotate(width/2,height/2);

		//System.out.println("animation2 entered specialRotate() called");



		if(System.currentTimeMillis()-time>10000)
		{
			animation[15]=false; 
			System.out.println("target time reached in animation 15 .  rotation stopping");
			animationComplete=true;

                        if(animationList!=null){
                          switchAnimation(animationList[animationIterator]);
                          System.out.println("switchAnatimatin(  animationList[animationIterator]: " + animationList[animationIterator] + "where animation Iterator is:" + animationIterator);
                        
                          updateIterator();
                        }
                        
                        animation15Flag=false;

		} 
           
          
          
        }
        
        
        

	void runAllAnimations()
	{
            //animationList= new int{ 0,1,2,3,4 };
            animationList = new int[9];
            for(int i=0;i<animationList.length;i++){
             animationList[i]=i;
            }
            animation[animationList[0]]=true;
            
	}

	void runAnimation(int i)
	{
		if(i>animation.length)
		{
			for(int b=0; b<animation.length; b++)
			{
				animation[b]=false; 
			}
		}
		else{
			System.out.println("animation "+ i + "was previously" + animation[i]);
			if(animation[i]==false)
				animation[i]=true;
			else
				animation[i]=false;
		}
	}

	void setAnimationList(int[] newList)
	{
              animationList= newList;
              
	}

        void startAnimationList()
	{

              if(animationList!=null)
              {
                animation[animationList[0]]=true;
              }
              else
              {
                System.out.println("animationList was null ") ;
              }
            
              
	}
        
        void updateIterator()
        {
          animationIterator++;
          if(animationIterator>animationList.length-1){
           animationIterator=0;
          }
           
           System.out.println("thi sis the annmation iterator:   " + animationIterator);
           
        }
        
        void updateImageIterator()
        {
          if(imagePoints==null)
          {
            imagePoints=findImages(); 
          }
          targetPositions=imagePoints[imageIterator];
          imageIterator++;
          if(imageIterator>imagePoints.length-1){
           imageIterator=0;
          }
           
           System.out.println("this is the image iterator:   " + imageIterator);
           
        }
        
        
        
        

        void switchAnimation(int i)
	{
  
          switch (i) {
            case 0:  animation[0]=true; time=System.currentTimeMillis(); grow(5,0);System.out.println("animation" + i); break;
            case 1:  animation[1]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 2:  stopParticles();animation[2]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 3:  animation[3]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 4:  animation[4]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 5:  animation[5]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 6:  animation[6]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 7:  animation[7]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 8:  animation[8]=true; time=System.currentTimeMillis(); time2=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 9:  animation[9]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 10: animation[10]=true; time=System.currentTimeMillis(); time2=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 11: animation[11]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 12: animation[12]=true; time=System.currentTimeMillis(); time2=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 13: animation[13]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 14: animation[14]=true; time=System.currentTimeMillis(); System.out.println("animation" + i); break;
            case 15: animation[15]=true; time=System.currentTimeMillis(); time2=System.currentTimeMillis(); System.out.println("animation" + i); break;
            
            
            
            default: //stopParticles(); 
                    for(int b=0; b<animation.length;b++){
                     animation[b]=false; 
                    }                    
                    System.out.println("anything else stops all animations.");break;
        }

  
          

	}







	///////////////////////////////END ANIMATIONS





























	void addParticle() {
		particles.add(new Particle(origin));
	}

	void addParticle(float x, float y) {

		particles.add(new Particle(new PVector(x,y),1,1,numParticles));

		SawWave w=new SawWave(y, maxGainPerParticle, out[pID].sampleRate());
		w.setFreq(y+freqOffset);
		float pan =2.0*x/width -1.0;
		w.setPan(pan);
		out[pID].addSignal(w);    
		waves.add(w);

		numParticles++;


	}

	void addParticle(Particle p) {
		particles.add(p);
	}

	// A method to test if the particle system still has particles
	boolean dead() {
		if (particles.isEmpty()) {
			return true;
		} 
		else {
			return false;
		}
	}


	void followMouse(float x, float y) {
		//if(mousePressed)
		{      
			for (int i = particles.size()-1; i >= 0; i--) {  
				Particle p = (Particle) particles.get(i);
				float xdif=x-p.loc.x;
				float ydif=y-p.loc.y;

				PVector update= new PVector(.01*xdif*random(1),.01*ydif*random(1));

				p.loc.add(update);

				float accel=.001;

				p.acc.set(new PVector(accel*xdif,accel*ydif));

			}

		}
		/*else
     {
     for (int i = particles.size()-1; i >= 0; i--) { 
     Particle p = (Particle) particles.get(i);
     p.acc.set(new PVector(0,0));
     }
     }*/

	}

	void releaseAccel(){    
		for (int i = particles.size()-1; i >= 0; i--) { 
			Particle p = (Particle) particles.get(i);
			p.acc.set(new PVector(0,0));
		}
	}


	void rotateParticles()
	{
		inc = inc+.1;

		float factor = 5;
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);

			p.vel.set(new PVector(  0, 0  ));
			p.acc.add(new PVector(  factor* cos(inc), factor*sin(inc)  ));
		}

	}

	void stopParticles()
	{

		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			p.vel.set(new PVector(   0,0  ));
		}

	}

	void rotateAboutMouse(float px, float py)
	{   
		float ang=.01;
		inc=inc+.1;

		PVector mousePoint= new PVector(px,py);
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			//PVector b= new PVector(p.locx);
			//p.loc.set(new PVector(  p.loc.x+mouseX, p.loc.y+mouseY  ));
			//ang=inc;

			float myX=cos(ang)*(p.loc.x-px) - sin(ang)*(p.loc.y-py) + px;
			float myY=sin(ang)*(p.loc.x-px) + cos(ang)*(p.loc.y-py) + py;
			PVector b= new PVector(myX,myY);
			p.loc.set(b);       
			//PVector b= new PVector(myX,myY);
			//b.div(.1*b.mag());

			//p.loc.set(b);         
			//p.vel.set(b);       
		}

	}


	void specialRotate(float px, float py)
	{


		float ang=.0001;
		inc=inc+.1;

		float[] angArray= new float[particles.size()];
		for (int i=0; i<angArray.length; i++)
		{
			angArray[i]= .0001*i+ang; 

		}

		PVector mousePoint= new PVector(px,py);
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			//PVector b= new PVector(p.locx);
			//p.loc.set(new PVector(  p.loc.x+mouseX, p.loc.y+mouseY  ));
			//ang=inc;

			float myX=cos(angArray[i])*(p.loc.x-px) - sin(angArray[i])*(p.loc.y-py) + px;
			float myY=sin(angArray[i])*(p.loc.x-px) + cos(angArray[i])*(p.loc.y-py) + py;
			PVector b= new PVector(myX,myY);
			p.loc.set(b);

			//PVector b= new PVector(myX,myY);
			//b.div(.1*b.mag());

			//p.loc.set(b);

			//p.vel.set(b);

		}

	}



	void setScale(){

		float startfreq=220+freqOffset;
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			float power= pow(    2,  ((i+0)/12.0)  );
			int f=round(startfreq*power);
			PVector b= new PVector(f-freqOffset,f-freqOffset);
			p.loc.set(b);
			//System.out.println(power);
			//System.out.println(f);
		} 

	}

	void setVertical(float px, float py){

		float startfreq=py+freqOffset;
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			float power= pow(    2,  ((i+0)/12.0)  );
			int f=round(startfreq*power);
			PVector b= new PVector(px,f-freqOffset);
			p.loc.set(b);
			//System.out.println(power);
			//System.out.println(f);
		} 

	}

	void setHorizontal(int px, int py){

		float freq=py;
		float interval= .5*width/(particles.size());
		int f=px;
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);

			PVector b= new PVector(f,freq);       
			f=f+round(interval);
			p.loc.set(b);
			//System.out.println(power);
			//System.out.println(f);
		} 

	}

	void setMajorChord(float px, float py){

		float startfreq=py+freqOffset;
		int[] off= {  0, 4, 7  };
		int epoch=0;
		for (int i = 0; i<particles.size(); i++) 
		{ 
			Particle p = (Particle) particles.get(i);
			int number=(off[(i+0)%off.length] + 12*epoch);
			float power= pow(    2,   number  /12.0  );
			int f=round(startfreq*power);
			PVector b= new PVector(px,f-freqOffset);
			p.loc.set(b);
			//System.out.println(number);
			//System.out.println(f);
			if(i%off.length==2){
				epoch++;
			}
		} 

	}
	void setMinorChord(float px, float py){

		float startfreq=py+freqOffset;
		int[] off= { 
				0, 3, 7                        };
		int epoch=0;
		for (int i = 0; i<particles.size(); i++) 
		{ 
			Particle p = (Particle) particles.get(i);
			int number=(off[(i+0)%off.length] + 12*epoch);
			float power= pow(    2,   number  /12.0  );
			int f=round(startfreq*power);
			PVector b= new PVector(px,f-freqOffset);
			p.loc.set(b);
			//System.out.println(number);
			//System.out.println(f);
			if(i%off.length==2){
				epoch++;
			}
		} 

	}

	void setDiminishedChord(float px, float py){

		float startfreq=py+freqOffset;
		int[] off= { 
				0, 3, 6, 9                        };
		int epoch=0;
		for (int i = 0; i<particles.size(); i++) 
		{ 
			Particle p = (Particle) particles.get(i);
			int number=(off[(i+0)%off.length] + 12*epoch);
			float power= pow(    2,   number  /12.0  );
			int f=round(startfreq*power);
			PVector b= new PVector(px,f-freqOffset);
			p.loc.set(b);
			//System.out.println(number);
			//System.out.println(f);
			if(i%off.length==off.length-1){
				epoch++;
			}
		} 

	}

	void setHalfDiminishedChord(float px, float py){

		float startfreq=py+freqOffset;
		int[] off= { 
				0, 3, 6, 10                        };
		int epoch=0;
		for (int i = 0; i<particles.size(); i++) 
		{ 
			Particle p = (Particle) particles.get(i);
			int number=(off[(i+0)%off.length] + 12*epoch);
			float power= pow(    2,   number  /12.0  );
			int f=round(startfreq*power);
			PVector b= new PVector(px,f-freqOffset);
			p.loc.set(b);
			//System.out.println(number);
			//System.out.println(f);
			if(i%off.length==off.length-1){
				epoch++;
			}
		} 

	}

	void setChord(int[] off){    
		float startfreq=mouseY+freqOffset;   
		int epoch=0;
		for (int i = 0; i<particles.size(); i++) 
		{ 
			Particle p = (Particle) particles.get(i);
			int number=(off[(i+0)%off.length] + 12*epoch);
			float power= pow(    2,   number  /12.0  );
			int f=round(startfreq*power);
			PVector b= new PVector(mouseX,f-freqOffset);
			p.loc.set(b);
			//System.out.println(number);
			//System.out.println(f);
			if(i%off.length==off.length-1){
				epoch++;
			}
		}    
	}

	//gets frequencies for a chord when you give it an array
	int[] getTargetFreqs(float py, int[] off)
	{


		int[] freqs=new int[particles.size()];
		float startfreq=py+freqOffset;
		int epoch=0;
		for (int i = 0; i<particles.size(); i++) 
		{ 
			Particle p = (Particle) particles.get(i);
			int number=(off[(i+0)%off.length] + 12*epoch);
			float power= pow(    2,   number  /12.0  );
			freqs[i]=round(startfreq*power);
			//PVector b= new PVector(mouseX,f-freqOffset);
			//p.loc.set(b);
			//System.out.println(number);
			//System.out.println(f);
			if(i%off.length==off.length-1)
			{
				epoch++;
			}
		}  
		return freqs;
	}

	void moveToFreqs(float px, int[] targetFreqs)
	{
		targetReached=false;
		//System.out.println("in moveToFreqs");
		double sum=10000000;

		//was moveTrig
		if(!targetReached){
			sum=0;
			for (int i = 0;i<particles.size(); i++) 
			{  
				Particle p = (Particle) particles.get(i);
				float xdif=px-p.loc.x;
				float ydif=(targetFreqs[i]-freqOffset)-p.loc.y;

				sum=sum+   Math.abs(xdif)  +  Math.abs(ydif);        
				//PVector update= new PVector(.001*xdif*random(1),.001*ydif*random(1)+freqOffset);        
				//p.loc.add(update);        
				//float accel=.01;
				float veloc=.05;

				//p.acc.set(new PVector(accel*xdif,accel*ydif));
				p.vel.set(new PVector(veloc*xdif,veloc*ydif));

				//System.out.print("i: "+ i + " acc:" + p.acc + " vel: " +p.vel+ "...");

			}
		}


		//System.out.println(" in moveToFreqs with sum:" + sum);
		if (sum<1*particles.size())
		{

			targetReached=true;
			System.out.println("stopping now target reached is " + targetReached);

			moveTrig=false;
		}

	}

	//this is just the y version of moveToTrig
	void moveToFreqs(int[] targetFreqs)
	{
		targetReached=false;
		//System.out.println("in moveToFreqs");
		double sum=10000000;

		//was moveTrig
		if(!targetReached){
			sum=0;
			for (int i = 0;i<particles.size(); i++) 
			{  
				Particle p = (Particle) particles.get(i);
				float ydif=(targetFreqs[i]-freqOffset)-p.loc.y;

				sum=sum  +  Math.abs(ydif);        
				//PVector update= new PVector(.001*xdif*random(1),.001*ydif*random(1)+freqOffset);        
				//p.loc.add(update);        
				//float accel=.01;
				float veloc=.05;

				//p.acc.set(new PVector(p.acc.x,accel*ydif));
				p.vel.set(new PVector(p.vel.x,veloc*ydif));
				//System.out.print("i: "+ i + " acc:" + p.acc + " vel: " +p.vel+ "...");

			}
		}


		//System.out.println(" in moveToFreqs(targetFreqs) with sum:" + sum);
		if (sum<1*particles.size())
		{
			targetReached=true;
			System.out.println("stopping now target reached is " + targetReached);
			moveTrig=false;
		}

	}


	void setMoveToPos(float tx, float ty, float tv, float ta)
	{
		if(!moveToPos)
		{
			targetx=tx;
			targety=ty;
			targetvel=tv;
			targetacc=ta;
			moveToPos=true;
		}else
		{
			moveToPos=false;
		}

	}


	void moveToPos()
	{
		targetReached=false;
		double sum=10000000;
		if(!targetReached)
		{
			sum=0;
			for(int i=0; i<particles.size(); i++)
			{
				Particle p = (Particle) particles.get(i);
				float xdif=targetx-p.loc.x;
				float ydif=targety-p.loc.y;

				sum=sum+Math.abs(xdif)+ Math.abs(ydif);
				//p.acc= new PVector(targetacc*xdif,targetacc*ydif);
				p.vel= new PVector(targetvel*xdif,targetvel*ydif);

			}    
		}

		if ( sum<1*particles.size() )
		{
			targetReached=true;
			System.out.println("stopping now target reached is " + targetReached);
			moveToPos=false;
		}



	}



        void setMoveToPositions(float[][] newPositions, float tv, float ta)
	{
                System.out.println("setMoveToPositions was calleed and movetopositions is: " + moveToPositions);
		if(!moveToPositions)
		{
			targetPositions=newPositions;
			targetvel=tv;
			targetacc=ta;
			moveToPositions=true;
		}else
		{
			moveToPositions=false;
		}

	}
        
        void moveToPositions()
        {

              targetReached=false;
		double sum=10000000;
		if(!targetReached)
		{
			sum=0;
			for(int i=0; i<particles.size(); i++)
			{
  
                                int m=i;
                                if(m>targetPositions[0].length-1){
                                   m=i%(targetPositions[0].length-1); 
                                }
                                //System.out.println("length is: "+ targetPositions[0].length + " and m is :" +m);
				Particle p = (Particle) particles.get(i);
				float xdif=targetPositions[0][m]-p.loc.x;
				float ydif=targetPositions[1][m]-p.loc.y;

				sum=sum+Math.abs(xdif)+ Math.abs(ydif);
				//p.acc= new PVector(targetacc*xdif,targetacc*ydif);
				p.vel= new PVector(targetvel*xdif,targetvel*ydif);

			}    
		}

		if ( sum<1*particles.size() )
		{
			targetReached=true;
			System.out.println("stopping now target reached is " + targetReached);
			moveToPositions=false;
		}
          
        }
        
        
        void setMoveToPositionsConstantV(float[][] newPositions, float tv, float ta)
	{
                System.out.println("setMoveToPositionsConstantV was calleed and movetopositions was : " + moveToPositionsConstantV);
		if(!moveToPositionsConstantV)
		{
			targetPositions=newPositions;
			targetvel=tv;
			targetacc=ta;
			moveToPositionsConstantV=true;
		}else
		{
			moveToPositionsConstantV=false;
		}

	}
        void moveToPositionsConstantV()
        {

              targetReached=false;
		double sum=10000000;
		if(!targetReached)
		{
			sum=0;
			for(int i=0; i<particles.size(); i++)
			{
  
                                int m=i;
                                if(m>targetPositions[0].length-1){
                                   m=i%(targetPositions[0].length-1); 
                                }
                                //System.out.println("length is: "+ targetPositions[0].length + " and m is :" +m);
				Particle p = (Particle) particles.get(i);
				float xdif=targetPositions[0][m]-p.loc.x;
				float ydif=targetPositions[1][m]-p.loc.y;

                                if((Math.abs(xdif)+Math.abs(ydif)) <.4)
                                {
                                  p.vel.x=0;
                                  p.vel.y=0;
                                }
                                else
                                {

				  sum=sum+Math.abs(xdif)+ Math.abs(ydif);
				  //p.acc= new PVector(targetacc*xdif,targetacc*ydif);
				  p.vel= new PVector(targetvel*Math.signum(xdif),targetvel*Math.signum(ydif));
                                  //System.out.println(targetvel);
                                }

			}    
		}

		if ( sum<1*particles.size() )
		{
  
                        for(int i=0;i<particles.size();i++)
                        {
                          Particle p = (Particle) particles.get(i);
                          p.vel.x=0;
                          p.vel.y=0;
                        }
			targetReached=true;
			System.out.println("moveToPosConstantV stopping now target reached is " + targetReached);
			moveToPositionsConstantV=false;
		}
          
        }
        
        
        





	void setAugmentedChord(float px, float py){

		float startfreq=py+freqOffset;
		int[] off= {
				0, 4, 8                        };
		int epoch=0;
		for (int i = 0; i<particles.size(); i++) 
		{ 
			Particle p = (Particle) particles.get(i);
			int number=(off[(i+0)%off.length] + 12*epoch);
			float power= pow(    2,   number  /12.0  );
			int f=round(startfreq*power);
			PVector b= new PVector(px,f-freqOffset);
			p.loc.set(b);
			//System.out.println(number);
			//System.out.println(f);
			if(i%off.length==off.length-1){
				epoch++;
			}
		} 

	}

	void setBoundary()
	{
		if(verticalBoundary==false)
			verticalBoundary=true;
		else
			verticalBoundary=false;   

                if(horizontalBoundary==false)
			horizontalBoundary=true;
		else
			horizontalBoundary=false; 
	}

	void setMoveTrig()
	{
		if(moveTrig==false)
		{
			System.out.println("setting moveTrig to True");
			moveTrig=true;
			/*int[] arr= { 0, 3, 6, 9 };
       int[] freqs=getFreqs(arr);
       ps[pID].moveToFreqs(freqs); */
		}
		else{
			System.out.println("setting moveTrig to False");
			moveTrig=false;  
		}

	}

	void decay()
	{
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			p.vel.x=.95*p.vel.x;
			p.vel.y=.95*p.vel.y;
		} 
	}

	void grow()
	{
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			p.vel.x=1.05*p.vel.x;
			p.vel.y=1.05*p.vel.y;
		} 
	}

	//paramter versions of grow
	void decay(float ps)
	{
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			p.vel.x= (1-ps)*p.vel.x;
			p.vel.y= (1-ps)*p.vel.y;
		} 
	}

	void grow(float ps)
	{
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			p.vel.x=(1+ps)*p.vel.x;
			p.vel.y=(1+ps)*p.vel.y;
		} 
	}

        void decay(float ps1, float ps2)
	{
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			p.vel.x= (1-ps1)*p.vel.x;
			p.vel.y= (1-ps2)*p.vel.y;
		} 
	}

	void grow(float ps1, float ps2)
	{
                //System.out.println("overload grow float ps1 foat ps2 called");
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
                        
			Particle p = (Particle) particles.get(i);
			p.vel.x=(1+ps1)*p.vel.x;
			p.vel.y=(1+ps2)*p.vel.y;
                        //System.out.println(p.vel.x);
		} 
	}





	void removeParticle()
	{
		if(waves.size() != 0 )
		{
			//ps[pID].removeParticle();

			Particle p = (Particle) particles.get(  particles.size()-1  );
			particles.remove(particles.size()-1);

			//SawWave w = (SawWave) waves.get(waves.size()-1);
			int ID=p.particleID;
			out[pID].removeSignal(waves.size()-1);
			//out.removeSignal(ID);        
			waves.remove(waves.size()-1);
			//waves.remove(ID);
			numParticles--;
		}


	}

	void widenParticles()
	{
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			p.setR(p.getR()+1);
		} 

	}

	void shrinkParticles()
	{
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			p.setR(p.getR()-1);
		} 
	}

	void reverseDirection()
	{
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			p.vel.x=-p.vel.x;///abs(p.vel.x);
			p.vel.y=-p.vel.y;///abs(p.vel.y);
		} 
	}

	void printParticles()
	{
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);
			System.out.println("particleID: " + p.particleID);
			//p.vel.x=-p.vel.x;///abs(p.vel.x);
			//p.vel.y=-p.vel.y;///abs(p.vel.y);
		} 
	}


        
        void setAlpha(float newAlph)
        {
         
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);

			float val=newAlph;
			if(val>1){
				p.alphaVal=1; 
			}
			else
                        if(val<0){
				p.alphaVal=0; 
			}
			{
				p.alphaVal=val;  
			}

		}
          
        }

	void increaseAlpha()
	{

		float inc =.001;
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);

			float val=p.alphaVal+inc;
			if(val>1){
				p.alphaVal=1; 
			}
			else
			{
				p.alphaVal=val;  
			}

		}

	}
	void decreaseAlpha()
	{    
		float inc =.001;
		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);

			float val=p.alphaVal-inc;
			if(val<0){
				p.alphaVal=0; 
			}
			else
			{
				p.alphaVal=val;  
			}
		}   
	}

	void decreaseSquareBound()
	{
		if(squareBound<width/2-1)
			squareBound++;
	}

	void increaseSquareBound()
	{
		if(squareBound>10)
			squareBound--;
	}


	void appearAt( float xx, float yy, PVector vlc, PVector acl)
	{

		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);

			p.loc.x=xx;
			p.loc.y=yy;
			p.vel=vlc;
			p.acc=acl;

		}

	}

	void explodeAt(float xx, float yy, float vxx, float vyy, float axx, float ayy)
	{

		for (int i = particles.size()-1; i >= 0; i--) 
		{ 
			Particle p = (Particle) particles.get(i);

			p.loc.x=xx;
			p.loc.y=yy;
			p.vel.x= (random(2)-1)*vxx;
			p.vel.y= (random(2)-1)*vyy;
			p.acc.set(new PVector( random(1)*axx,random(1)*ayy ));
			//p.acc.x= random(1)*axx;
			//p.acc.y= random(1)*ayy;

		}

	}





}


///////// END OF PARTICLE SYSTEM




















































/////////////////////////////////////////////////////////////

// A simple Particle class

class Particle {
	PVector loc;
	PVector vel;
	PVector acc;
	float r;
	float timer;
	int particleID;
	int sysID;

	float alphaVal=maxGainPerParticle;


	int colorVal;
	int colorValUpdate;

	public float getR()
	{
		return r; 
	}
	public void setR(float rr)
	{
		r=rr;
	}




	public int getColorVal() {
		return this.colorVal;
	}
	public void setColorVal(int cval) {
		this.colorVal =cval;
	}
	public int getColorValUpdate() {
		return this.colorValUpdate;
	}
	public void setColorValUpdate(int cvalup) {
		this.colorValUpdate =cvalup;
	}

	public void updateColorVal(){
		this.colorVal=this.colorVal+this.colorValUpdate;
	}

	// Another constructor (the one we are using here)
	Particle(PVector l) {
		acc = new PVector(0,0,0);
		//vel = new PVector(random(-1,1),random(-2,0),0);
		vel = new PVector(random(-1,1),random(-1,1),0);

		colorVal=220;
		//colorVal=int(random(2,254));
		colorValUpdate=1;

		loc = l.get();
		r = 10.0;
		timer = 100000.0;
	}

	//constructor with way to update color
	Particle(PVector l,int cval,int cupdate) {
		acc = new PVector(0,0,0);
		//vel = new PVector(random(-1,1),random(-2,0),0);
		vel = new PVector(random(-1,1),random(-1,1),0);

		colorVal=cval;
		//colorVal=int(random(2,254));
		colorValUpdate=cupdate;

		loc = l.get();
		r = 10.0;
		timer = 100000.0;
	}



	//constructor with ID aas well
	Particle(PVector l,int cval,int cupdate, int Ident) {
		acc = new PVector(0,0,0);
		//vel = new PVector(random(-1,1),random(-2,0),0);
		vel = new PVector(random(-1,1),random(-1,1),0);

		particleID=Ident;

		colorVal=cval;
		//colorVal=int(random(2,254));
		colorValUpdate=cupdate;

		loc = l.get();
		r = 10.0;
		timer = 100000.0;
	}





	void run() {
		update();
		render();
	}

	//run with ID, passes to update
	void run(int ID) {
		update(ID);
		render();
	}

	// Method to update location
	void update() {
		vel.add(acc);
		loc.add(vel);
		timer -= 1.0;

		/*OscMessage oscMsg = new OscMessage("/trigger");
     oscMsg.add(soundID);
     oscMsg.add(midi);

     // send the message 
     oscP5.send(oscMsg, remoteLocation);*/

	}

	//update with ID
	// Method to update location
	void update(int ID) {

		//System.out.println("update with ID called");
		vel.add(acc);
		loc.add(vel);
		timer -= 1.0;


	} 




	void updateVel(PVector vel) {
		vel.add(vel);
		timer -= 1.0;
	}


	// Method to display
	void render() {




		//if 
		strokeWeight(1);
		ellipseMode(CENTER);
		stroke(255,255,255,timer);
		if (alphaVal==0){
			fill(255-colorVal,colorVal,255,  0 );
		}
		else{
			fill(255-colorVal,colorVal,255,  maxGainPerParticle*alphaVal*2.0*255 + (1-maxGainPerParticle)*alphaVal*2.0*255  +50 );
		}
		if(pID==0)
		{
			ellipse(loc.x,loc.y,r,r);
		}
		else
		{
			rectMode(CENTER);
			rect(loc.x,loc.y,r,r);
		}
		displayVector(vel,loc.x,loc.y,10,255);
		displayVector(acc,loc.x,loc.y,300,120);
	}

	// Is the particle still useful?
	boolean dead() {
		if (timer <= 0.0) {
			return true;
		} 
		else {
			return false;
		}
	}

	void displayVector(PVector v, float x, float y, float scayl, int col) {
		pushMatrix();
		float arrowsize = 4;
		// Translate to location to render vector
		translate(x,y);
		stroke(col,50);
		// Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
		rotate(v.heading2D());
		// Calculate length of vector & scale it to be bigger or smaller if necessary
		float len = v.mag()*scayl;
		// Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
		line(0,0,len,0);
		line(len,0,len-arrowsize,+arrowsize/2);
		line(len,0,len-arrowsize,-arrowsize/2);
		popMatrix();
	} 

}











































class Boundary{

	float strokeWidth;
	float bx;
	float by;
	float bwidth;
	float bheight;
	public boolean render;


	Boundary(float x, float y, float pwidth, float pheight, float pStrokeWidth)
	{
		bx=x;
		by=y;
		bwidth=pwidth;
		bheight=pheight;
		strokeWidth=pStrokeWidth;
		render=true;
		render();
	}


	void render()
	{


		stroke(250, 250, 250, 250);

		strokeWeight(strokeWidth);
		rect(bx, by, bwidth, bheight);

	}

	void trig()
	{
		render=!render; 
	}

}





static public ArrayList getLine(File aFile) {
	//...checks on aFile are elided
	//StringBuilder contents = new StringBuilder();

	ArrayList myArrayList= new ArrayList();

	try {
		//use buffering, reading one line at a time
		//FileReader always assumes default encoding is OK!
		BufferedReader input =  new BufferedReader(new FileReader(aFile));
		try {
			String sline = null; //not declared within while loop
			/*
			 * readLine is a bit quirky :
			 * it returns the content of a line MINUS the newline.
			 * it returns null only for the END of the stream.
			 * it returns an empty String if two newlines appear in a row.
			 */
			while (( sline = input.readLine()) != null){
				if (sline.startsWith("       d=") ){
					StringTokenizer st = new StringTokenizer(sline);
					/*Scanner scan = new Scanner(sline);
            while(scan.hasNextDouble())
            {
              System.out.println(scan.nextDouble());

            }
					 */
					while (st.hasMoreTokens()) 
					{

						String ss=st.nextToken();
						//System.out.println(ss);
						//System.out.println(ss.substring(0,1));
						try
						{
							float f=Float.parseFloat(ss.substring(0,1));
							//System.out.println(f);

							Scanner s = new Scanner(ss).useDelimiter(",");
							while (s.hasNext()) {
								if (s.hasNextFloat()) {
									float toAdd=s.nextFloat();
									myArrayList.add(toAdd);
									//System.out.println("the float: " + toAdd+ " was added");
								} 
								else 
								{
									break;
								}
							}


						}
						catch(NumberFormatException e){
							//System.out.println(ss+ "is not a float");
						}

					}

				}

				//contents.append(sline);
				//contents.append(System.getProperty("line.separator"));
			}
		}
		finally {
			input.close();
		}
	}
	catch (IOException ex){
		ex.printStackTrace();
                return null;
	}

	//System.out.println(myArrayList.size());
	return myArrayList;
}







