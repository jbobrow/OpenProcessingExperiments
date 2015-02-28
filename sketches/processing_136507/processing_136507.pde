
import java.io.File;
import java.util.ArrayList;
import java.util.List;


import com.echonest.api.v4.Segment;
import toxi.geom.*;
import toxi.processing.ToxiclibsSupport;
import echoNestBridge.EchoNestBridge;
import utils.exportSVG.ExportToSVG;

import controlP5.Button;
import controlP5.ControlP5;
import controlP5.Textlabel;

import ddf.minim.*;
import ddf.minim.analysis.FFT;

import visualization2D.*;//our framework

/**
 * 
 * @author Meiying Cheung
 * Demo to show 2d Visualization using our framework
 */

  //variables for Minim player 
  Minim minim;
  AudioPlayer song;
  FFT fftObj;
  //using echonest bridge
  private EchoNestBridge echolib;
  List<Segment> segments;

  //SVG support
  ExportToSVG svgObj;
  
  //Vis2D variable
  VisualizationRing2D vis2d;
  
  //variables for application
  ControlP5 cp5;
  String path = "";//variable to handle path file
  ToxiclibsSupport gfx;
  private boolean isPlaying = false;
  private boolean record = false;
  private boolean visFreq = false;
  float xTime=0;
  float xPosition = 0;
  float[]  myspectrum;
  
  
   void setup()
  {
    size(1250, 800);
    
    vis2d = new VisualizationRing2D(this);
    gfx=new ToxiclibsSupport(this);
    smooth();

    // always start Minim first!
    minim = new Minim(this);

    // specify 512 for the length of the sample buffers
    // the default buffer size is 1024
    song = minim.loadFile("chopin.mp3",128);
    //echonest lib
    echolib = new EchoNestBridge(dataPath("chopin.mp3"),"PZYYXMN1TMSDCIEXA ");
    echolib.loadEchoNestAnalysis();
    segments = echolib.getSegments();

    // an fftObj needs to know how 
    // long the audio buffers it will be analyzing are
    // and also needs to know 
    // the sample rate of the audio it is analyzing
    fftObj = new FFT(song.bufferSize(), song.sampleRate());
    fftObj.logAverages( 22, 3 );
    myspectrum = null;
    
    //buttons and controllers
    cp5 = new ControlP5(this);

    addButtons();
    
    colorMode(HSB);
    
  }

  
   void draw()
  {

    background(230,164,70);
    //disable upload button
    if(!isPlaying)
    {
      cp5.getController("uploadMusic").setLock(false);
    }
    
    // first perform a forward fftObj on one of song's buffers
    fftObj.forward(song.mix);
    float curTime = song.position() / 1000f;

    if(isPlaying)
    {
      if(visFreq )
      {
        //FREQUENCY VIEW
        if(frameCount % 5 == 0)
        {
          for(int i = 0; i < fftObj.avgSize(); i++)
          {
            myspectrum[i] = (float)fftObj.getBand(i);
          }
        }

      }else{
        //TONE VIEW
        for (Segment _seg : segments) {
          if( curTime < echolib.getSegmentStartTime(_seg) )
          {
            myspectrum = convertArrayDoubleToFloat(_seg.getPitches());
            break;
          }
        }
      }



    }

    pushMatrix();

    translate(width/2, height/2);
    noFill();
    
    if(myspectrum != null)
    {
      //RENDER THE RING 2D
      vis2d.visualizationRing(myspectrum);
      // RENDER THE EDGES OF THE RING
      vis2d.drawEdges();
      
      //DEPENDING OF WHICH VIEW WE ARE, RENDER THE TEXT
      if(visFreq)
      {
        vis2d.drawLetter(false,null);
      }
      else
      {
        vis2d.drawLetter(true,null);
      }
    }
    
    popMatrix();

    //Key commands
    if(keyPressed)
    {
      if(key=='s'){ //stop song
        song.pause();
        isPlaying = false;
        
      }if(key=='p'){  // play song
        song.play();
        isPlaying = true;
      }else if(key=='r')  //rewind the song
      {
        song.rewind();
        song.play();
        isPlaying = true;
      }
    }

    if (record) {
      //EXPORT TO SVG THE RING VISUALIZATION 2D
      svgObj = new ExportToSVG(this);
      svgObj.creatorSVG();
      svgObj.setPathFile(path);
      //add polygon
      svgObj.addPolygon(vis2d.getEdgePol(), true);
      svgObj.addPolygon(vis2d.getCenterPol(), true);
      svgObj.addPolygonArray(vis2d.getPolyArray(), false);
      svgObj.addTextCircle(vis2d.getWords(), false  ); 

      //add hole
      svgObj.closeSVG(svgObj.getPathFile());

      record = false;
    }

  }

  /**
   * Method to convert an Array of double's to an array of float's
   * @param _double array of values
   * @return array of float falues
   *
   */
   float[] convertArrayDoubleToFloat(double[] _double)
  {
    float[] floatArray = new float[_double.length];
    int i=0;
    for (double d : _double) {
      floatArray[i] = (float)d;
      i++;
    }
    return floatArray;
  }


  /**
   * Load a new song and update variables of minim and echonest 
   * @param selection
   *
   */
   void fileSelected(File selection) {

    if (selection == null) {
      println("Window was closed or the user hit cancel.");
    } else {
      println("User selected " + selection.getAbsolutePath());


      path = selection.getAbsolutePath();

      echolib = new EchoNestBridge(path,"PZYYXMN1TMSDCIEXA ");
      echolib.loadEchoNestAnalysis();
      segments = echolib.getSegments();

      song = minim.loadFile(path, 128);
      song.play();

      fftObj = new FFT(song.bufferSize(), song.sampleRate());
      fftObj.logAverages( 22, 3 );
      myspectrum = new float[ fftObj.avgSize() ];

      isPlaying = true;


    }
  }

  /**
   * Method that output a file
   * @param selection File path
   *
   */
   void outputfileSelected(File selection) {

    if (selection == null) {
      println("Window was closed or the user hit cancel.");
    } else {
      println("User selected " + selection.getAbsolutePath());
      path = selection.getAbsolutePath();
      record = true;
    }
  }

  /**
   * Method is called when uploadMusic button is pressed
   * @param value
   *
   */
   void uploadMusic(int value)
  {
    //file manager
    selectInput("Select a file to analyse:", "fileSelected");
    song.pause();
    isPlaying = false;

  }
  /**
   * Method is called when exportSVG button is pressed
   * @param value
   *
   */
   void exportSVG(int value)
  {
    //file manager
    selectOutput("Select a file to analyse:", "outputfileSelected");
    song.pause();
    isPlaying = false;

  }

/**
 * Method is called when toneButton is pressed
 * @param value
 * Return: void
 *
 */
   void toneBtn(int value)
  {
    visFreq = false;
    song.rewind();
    song.play();
    isPlaying = true;

    cp5.getController("textVis").setStringValue("Coloring: Tones");
  }

  /**
   * Method called when fftObjBtn is pressed
   * @param value
   * Return: void
   *
   */
   void fftObjBtn(int value)
  {
    visFreq = true;
    song.rewind();
    song.play();
    isPlaying = true;

    myspectrum = new float[ fftObj.avgSize() ];
    cp5.getController("textVis").setStringValue("Coloring: Frequency Bands");


  }
  
   void addButtons() {
    // TODO Auto-generated method stub
    cp5.addButton("uploadMusic")
    .setPosition(10,430)
    .setSize(100,19)
    .setCaptionLabel("upload")
    .setLock(true)
    ;

    cp5.addButton("toneBtn")
    .setPosition(10,100)
    .setSize(100,19)
    .setCaptionLabel("Visualize Tones")
    ;

    cp5.addButton("fftObjBtn")
    .setPosition(10,130)
    .setSize(100,19)
    .setCaptionLabel("Visualize Frequencies")
    ;

    cp5.addTextlabel("control")
    .setText("Contro Keys: 'p' Play,'s' Stop, 'r' Replay")
    .setPosition(10,200)
    .setColor(255);

    cp5.addTextlabel("textVis")
    .setText("Coloring: ")
    .setPosition(10,250)
    .setColor(255);

    cp5.addButton("exportSVG")
    .setPosition(10,400)
    .setSize(100,19)
    .setCaptionLabel("Export SVG")
    ;

  }




import toxi.geom.Vec3D;

public class GeneratePoints {

	private float radius;
	private float ang;
	

	public GeneratePoints( )
	{
	}

	public void restart()
	{
		radius = 0;
		ang = 0;
		t1 = -180;
		t2 = -100;
		theta = 0;
	}
	public Vec3D circleShape()
	{
		float x,y;
		radius += 2.5f;
		float rad = radians(ang );
		x = 0 + (radius * cos(rad));
		y = 0 + (radius * sin(rad));

		ang+=20;
		return new Vec3D(x,y,0);

	}

	//Creating heart shape.
	float t1 = -180;
	public Vec3D heartShape()
	{
		float x,y;


		if( t1 > 180) t1 = -180;
		t1 =  t1 + 5;

		x = 16* 10 * pow(sin(t1),3);
		y = 13* 10 * cos(t1) - 5 *cos(2*t1) - 2*cos(3*t1) - cos(4*t1);

		return new Vec3D(x,y,0);

	}

	//Create a circle.
	/*public Vec3D generatePoints()
	{
		float x,y;
		float a=100;
		t =t + 10;
		x = a * cos(t);
		y = a * sin(t);


		return new Vec3D(x,y,0);

	}*/

	//Create a star shape.

	float t2 = -100;
		public Vec3D starShape()
		{
			t2 = -100;
			float x,y;
			float a=5, b=15;

			if( t2 > 100) t2 = 100;
			t2 =  t2 + 5;

			x = 4 * ((a - b) * cos(t2) + b* cos(((a/b) -1)* t2));
			y = 4 * ((a - b) * sin(t2) + b* sin(((a/b) -1)* t2));



			return new Vec3D(x,y,0);

		} 

	//Lissajous Curves
	//http://mathforum.org/mathimages/index.php/Lissajous_Curve
	//Change a and b to get different parameters.
	/*float t = -100;
	public Vec3D generatePoints()
	{
		float x,y;
		float a=5, b=4;

		if( t > 100) t = 100;
		t =  t + 1;

		x = 200 * sin(a * t + 0);
		y = 200 * sin(b * t);		


		return new Vec3D(x,y,0);

	}*/

	//Rhodonea Curves , Petals.
	int theta = 0;

	public Vec3D petalsShape()
	{
		float x,y;
		float a=5, b=4;
		theta = theta +1;
		if(theta > 360) theta = 0;

		x = 100 * sin(5 * theta) * cos(theta);
		y = 100 * sin(5 * theta) * sin(theta);		


		return new Vec3D(x,y,0);

	}

	//positive sin curve
	/*		int theta = -180;
			public Vec3D generatePoints()
			{
				float x,y;
				theta = theta + 5;
				if(theta > 180) theta = -180;				
				y = 200 * abs(sin(theta) /theta);						
				return new Vec3D(theta,y,0);

			}*/


}


