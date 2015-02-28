
//Adaptation to Sound responsive visualizer. 
//Inspired on Magnetosphere from Robert Hodgin
//February 01 2012
//Hatus Peters

// Updated version of flight404 Particle Emitter release 1
// This works with Processing 1.0
// All of the advanced openGL direct calls that use display lists, etc. have been stripped out
// It's my intention to redo this example using GlGraphics (http://glgraphics.sourceforge.net/)
// But for now, just want to make sure it works in principal

// February 28 2011
// Daniel Shiffman

// Source Code release 1
// Particle Emitter
//
// February 11th 2008
//
// Built with Processing v.135 which you can download at http://www.processing.org/download
//
// Robert Hodgin
// flight404.com
// barbariangroup.com

// features:
//           Toxi's magnificent Vec3D library
//           perlin noise flow fields
//           ribbon trails
//           OpenGL additive blending
//           OpenGL display lists
//
// Uses the very useful Vec3D library by Karsten Schmidt (toxi)
// You can download it at http://code.google.com/p/toxiclibs/downloads/list
//
// Please post suggestions and improvements at the flight404 blog. When nicer/faster/better
// practices are suggested, I will incorporate them into the source and repost. I think that
// will be a reasonable system for now.
//
// Future additions will include:
//           Rudimentary camera movement
//           Magnetic repulsion
//           More textures means more iron
//
// UPDATES
//
// February 11th 2008
// Reorganized some of the OpenGL calls as per Simon Gelfius' suggestion.
// http://www.kinesis.be/

import damkjer.ocd.*;
import toxi.geom.*;
import processing.opengl.*;
import javax.media.opengl.*;
import com.sun.opengl.util.texture.*;
import java.io.*;
//import krister.Ess.*;

import ddf.minim.*;
import ddf.minim.Minim;
import ddf.minim.analysis.*;

float band, mis, maxFFT = 0;

int xWidth = 1240;
int yHeight = 800;
float yCenter = yHeight/4.7;
float xCenter = xWidth/4.7;

FFT fft;
Minim minim;
AudioInput input;
//AudioStream inputStream;

PGraphicsOpenGL pgl;
GL gl;

POV pov;
Emitter emitter;
Gravity gravity;

PImage particleImg;
PImage particle2Img;
PImage nebulaImg;
PImage emitterImg;
PImage reflectionImg;

int numParticles = 190;

ArrayList particles;

void setup() {
  size( xWidth, yHeight, OPENGL );
  
  // Turn on 4X antialiasing
  hint( ENABLE_OPENGL_4X_SMOOTH );
  // Lately I have gotten into the habit of limiting the color range to be 
  // 0.0 to 1.0. It works this way in OpenGL so I might as well get used to it.
  colorMode( RGB, 1.0 );

  // More OpenGL necessity.
  pgl         = (PGraphicsOpenGL) g;
  gl          = pgl.gl;

  minim = new Minim(this);
  input = minim.getLineIn(Minim.STEREO, 1024);
  
  //inputStream = new AudioStream(256*1024);
  //inputStream.sampleRate(input.sampleRate);
  
  fft = new FFT(input.bufferSize(), input.sampleRate());
  fft.forward(input.mix);
  // Loads in a particle image from the data folder. Image size should be a power of 2.
  particleImg = loadImage( "particle.png" );
  particle2Img = loadImage( "particle2.png" );
  nebulaImg = loadImage("nebula.png");
  emitterImg  = loadImage( "emitter.png" );
  reflectionImg  = loadImage( "reflection.png" );

  pov           = new POV( this );
  particles = new ArrayList();
  emitter   = new Emitter();
  gravity   = new Gravity();
  emitter.initParticles(numParticles);
}

void draw() {
  background( 20 );
 
  fft.forward(input.mix);

  pov.exist();
  // Turns on additive blending so we can draw a bunch of glowing images without
  // needing to do any depth testing.
  gl.glDepthMask(false);
  gl.glEnable( GL.GL_BLEND );
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);

  lights();
  directionalLight(random(255), 0, random(145), -1, 0, 0);
  directionalLight(random(220), 30, 30,  1, 0, 0);
  emitter.exist();
  gravity.exist();
  


}

