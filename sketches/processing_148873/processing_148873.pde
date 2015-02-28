
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


import ddf.minim.*; 


  


Minim minim; 


AudioPlayer song; 


float x = 0; 


float y = 0; 


  


void setup () { 


size (600, 600); 


noStroke (); 


  


minim = new Minim (this); 


song = minim.loadFile("a.mp3"); 


song.play (); 


} 


  


void draw () { 


  


   background(0); 


 float d= song.mix.level() *250; 


    for (int a = 10; a< width; a = a+40) {   


     for (int b = 10; b< width; b = b+40) {   


      


      pushMatrix();  


     stroke(#404FFF);   


      strokeWeight(9);   


      fill(20);   


      ellipse(a-0.4, b-0.4, d, d);   


  


     stroke(#7CB291);


      strokeWeight(10); 


      fill(#FCF8D9);   


      ellipse(a-0.2, b-0.2, d, d);   


      popMatrix(); 


    } 


  }     


} 

