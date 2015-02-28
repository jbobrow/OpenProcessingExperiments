
//import processing.opengl.*;
import processing.serial.*;

Serial myPort;

PImage cloud, cloud2, cloud3;

int xOld, yOld;
int bNew = 11;
int serial = 2; // 0 = random, 1 = serial, 2 = keypad(1,2,3,4,0)!! sooo cool! THANKS CHRIS
float r=0; 
float g=0; 
float b=0; 

void setup() {
	size( 1000, 200 );
	frameRate( 5 );
	background( r,g,b ); 
	smooth();
	
	cloud = loadImage( "cloudForSketch.png" );
	cloud2 = loadImage( "cloud2.png" );
	cloud3 = loadImage( "cloud3.png" );
	
	if(serial == 1) { myPort = new Serial( this, Serial.list()[0], 9600 ); }
}

void draw() {
  fill(r,g,b,2); 
  rect(0, 0, width, height); 

	if( serial == 1 ) {
		// waiting for serial!
	} else if( serial == 0 ) {
		if( frameCount%20 == 0 ) {
	  		bNew = randomEvent();
		}
	} else if( serial == 2 ) {
    	// waiting for keypress!
   	}
      
	if( bNew != 0 ) {
		int x = bNew/10; // get fist digit
		int y = bNew%10; // get second digit
		
		xOld = x;
		xOld = y;
		
		/*pushMatrix();
			rotateZ( radians( random( -10, 10 ) ) );*/
			tint( random( 100, 110 ), random( 50, 100 ) );
  image( cloud, x*( random( 198, 202 ) ) - random( 198, 202 ), (y*(random( 0, 15 )))  , random(cloud.width-20, cloud.width+20), random(cloud.height-20, cloud.height+20) );  

		/*popMatrix();
		pushMatrix();
			rotateZ( radians( random( -10, 10 ) ) );*/
			tint(random(100, 100), random(50, 90) );  
  image( cloud2, x*( random( 198, 202 ) ) - random( 198, 202 ), (y*(random( 0, 15 )))  , random(cloud.width-20, cloud.width+20), random(cloud.height-20, cloud.height+20) );  

		/*popMatrix();
		pushMatrix();
			rotateZ( radians( random( -10, 10 ) ) );*/
			tint(random(100, 100),random(20,30) );
			  image( cloud3, x*( random( 198, 202 ) ) - random( 198, 202 ), (y*(random( 0, 15 )))  , random(cloud.width-20, cloud.width+20), random(cloud.height-20, cloud.height+20) );  
		//popMatrix();
	} else { 
		/*pushMatrix();
			rotateZ( radians( random( -10, 10 ) ) );*/
			tint(random(100, 110), random(80, 100));      
			  image( cloud, xOld*( random( 198, 202 ) ) - random( 198, 202 ), (yOld*(random( 0, 15 )))  , random(cloud.width-20, cloud.width+20), random(cloud.height-20, cloud.height+20) );   
		/*popMatrix();
		pushMatrix();
			rotateZ( radians( random( -10, 10 ) ) );*/        
			tint(random(100, 100), random(0, 200) );  
			  image( cloud2, xOld*( random( 198, 202 ) ) - random( 198, 202 ), (yOld*(random( 0, 15 )))  , random(cloud.width-20, cloud.width+20), random(cloud.height-20, cloud.height+20) );  
		/*popMatrix();
		pushMatrix();
			rotateZ( radians( random( -10, 10 ) ) );*/
			tint(random(100, 100), random(20,30));
			 image( cloud3,  xOld*( random( 198, 202 ) ) - random( 198, 202 ), (yOld*(random( 0, 15 ))), random(cloud.width-20, cloud.width+20), random(cloud.height-20, cloud.height+20) );  
		//popMatrix();
	}
}

void serialEvent( Serial myPort ) {
  
        int blah = myPort.read();
        if( blah != 0 ) {
	  bNew = blah;
        }
}

int randomEvent( ) { // return random number: 0, 11, 21, 31, 41
  	int ran = int( random( 0, 5 ) );
  	if( ran != 0 ) {
    	return (ran*10) + 1;
  	} else {
    	return 0;
  	}
}

void keyPressed() {
	if( serial == 2 ) {
        
		if( key == '1' || key == '2' || key == '3' || key == '4' ) {
			char[] data = { key };
			String theKey = new String(data);
			bNew = parseInt( theKey ) * 11;
		} else if( key == '0' ) {
			bNew = 0;
		}
  	}
}

