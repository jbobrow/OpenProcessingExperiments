
import processing.opengl.*;

import hypermedia.video.*;
import java.awt.Rectangle;

//todo
// make value relative
// smooth with third value
// add more 3d structures
// add textures



boolean cheat = false;

OpenCV opencv;

float thresh= 1;
float theta=0.0;
float t=0.0;
float camX, camY, camZ, lastX, lastY, lastZ, xdif, ydif, zdif;
float speed= 1.5;
PImage a;

/*float[] xs = new float[3];
float[] ys = new float[3];
float[] zs = new float[3];*/

void setup() {

    size( 520, 400, OPENGL );

    opencv = new OpenCV( this );
    opencv.capture( width, height, 30);                   // open video stream
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
//    opencv.cascade( OpenCV.CASCADE_PROFILEFACE );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"


  background(0);
  camX=width/2;
  camY=height/2;
  camZ=1800;
  a = loadImage("grid.jpg");

}


public void stop() {
    opencv.stop();
    super.stop();
}



void draw() {
	background(0);
  
    // grab a new frame
    // and convert to gray
    opencv.read();
    opencv.flip( OpenCV.FLIP_HORIZONTAL );
    /*opencv.convert( GRAY );*/
 

    // proceed detection
    Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );


    

    noFill();
    stroke(255,0,0);
    /*for( int i=0; i<faces.length; i++ ) {*/
	int i=0;
	
	if (faces.length>0)
	{
		
		
		lastX=camX;
		lastY=camY;
		lastZ=camZ;
		
		xdif= (faces[i].x+(faces[i].width/2))-lastX;
		ydif= faces[i].y*speed + (faces[i].height/3) -lastY;

                if (abs(xdif)>thresh)
		  camX= camX + xdif*speed;
                
                if (abs(ydif)>thresh)
		  camY= camY + ydif*speed;

                camZ= faces[i].width*-1.8 +1000;
                
                zdif = camZ-lastZ;
                
                if (abs(zdif)<thresh*5)
                 camZ=lastZ;
                
 		/*camX= faces[i].x*speed +faces[i].width/2;
		camY= faces[i].y*speed + (faces[i].height/3);
        camZ= faces[i].width*-1.5 +1100;  */

		if (cheat)
		{
		image(opencv.image(), 0,0);
		rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
		}

		 if(keyPressed) {
		    if (key == 'c') 
		    { 
		      if (cheat==true) { cheat=false;}
	          if (cheat==false) { cheat=true;}
		  }}
		println(cheat);

	
	}
	


	camera((camX+lastX)/2, (camY+lastY/2), (camZ+ lastZ/2), width/2.0, height/2.0, 0.0, 0.0, 1.0, 0.0);

	println("x:"+xdif);
	println("y:"+ydif);
	println("z:"+zdif);



	pushMatrix();
	stroke(1);
		pushMatrix();
			translate(width/2, 400, 0);
			fill(230, noise(t)*255, 61, 150);
//			rotateX(theta);
//			rotateY(theta);
			t+=.01;
			theta+=.02;
			
			box(150, 150, 150);
			
		popMatrix();
		
		
		/*display grid*/
//		pushMatrix();
			translate(0, 600, 0);
			rotateX(PI/1.8);
			image(a, 0, 0, 600, 600);
//		popMatrix();

	 popMatrix();



}




