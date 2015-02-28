
// -*- coding: utf-8 -*-

/**
 * libraries
 */
import processing.opengl.* ;

/**
 * global variables
 */
int intDebug = 0 ; //silent mode: 0, debug mode: 1

int intScreenSizeX = 600 ;
int intScreenSizeY = 600 ;
//~ int intScreenSizeX = 200 ;
//~ int intScreenSizeY = 200 ;
color intBackgroundColor = color(255) ;

ParticleSystem objParticleSystem ;

/**
 * setup
 */
void setup()
{
	//~ size(intScreenSizeX, intScreenSizeY) ;
	size(600, 600) ;

	frameRate(2) ;
	//~ frameRate(6) ;
	frameRate(30) ;

	objParticleSystem = new ParticleSystem(this) ;
}



/**
 * draw
 */
void draw()
{
	background(intBackgroundColor) ;

	objParticleSystem.update() ;
	objParticleSystem.draw() ;

	//debug
	if (intDebug == 1)
	{
		//println("intDebug : " + intDebug) ;
	}
}



/**
 * stop
 */
void stop()
{
	//custom code

	super.stop() ;
}



/**
 * custom code
 */
void keyPressed()
{
	saveFrame("sketch_01-####.png") ;
}


