
void setup(){
  setupAudio();
size(800,800);
int height = 800;
int width = 800;
smooth();
}

void draw(){
background (255, 255, 57);
size (width, height); 

  getVolume(); 
  float Y = map(volume, 0,100, 2,120); 

//head//
noStroke ();
fill (247, 76, 7);
ellipse (width/2, height/2, 700, 600);


//left eye//
stroke (0,0,0);
strokeWeight(2); 
fill (255, 255, 255);
ellipse(width/3, height/3, 80, 150);
strokeWeight(6);
stroke(3, 80, 27);
fill (0, 0, 0);
ellipse(width/3, height/3, 55, 120);

//shadow//
noStroke ();
fill (0,0,0, 80);
ellipse (width/3, height/2.3, 50, 15);

//eyelid//
noStroke();
fill (118, 8, 2);
arc (width/3, height/3.3, 100, 120, radians (180), radians (360));




//right eye//
strokeWeight (2);
stroke (0, 0, 0);
fill (255, 255, 255);
ellipse (width/1.5, height/3, 80, 150);

strokeWeight (6);
stroke (3, 80, 27);
fill (0, 0, 0);
ellipse (width/1.5, height/3, 55, 120);

//eyelid//
noStroke();
fill (118, 8, 2);
arc (width/1.5, height/3.3, 100, 120, radians (180), radians (360));

//shadow//
noStroke ();
fill (0,0,0, 80);
ellipse (width/1.5, height/2.3, 50, 15);

//nose//
noStroke();
fill (118, 8, 2, 75);
ellipse (width/2, height/2, 200, 100);
fill (118, 8, 2, 85);
ellipse (width/2, height/1.95, 200, 90);
fill (118, 8, 2);
ellipse (width/2, height/1.90, 200, 80);

//nostril//

//right//
noStroke();
fill (0,0,0);
ellipse (width/1.85, height/1.85, 30, 40);

//left//
noStroke();
fill (0,0,0);
ellipse (width/2.15, height/1.85, 30, 40);

//mouth//
stroke(0,0,0);
strokeWeight (1);
fill (198, 108, 161);
ellipse (width/2, height/1.4, 300+Y, 100);

//ear//
//stroke(0,0,0);
//fill (247, 76, 7);
//triangle (158, 100, 200, 200, 300, 120); 

//cheeks//
noStroke ();
fill (198, 108, 161, 75);
ellipse (width/1.3, height/ 1.75, 80, 80);

noStroke ();
fill (198, 108, 161, 75);
ellipse (width/4.35, height/ 1.75, 80, 80);


//eyebrows//
//left//
stroke (0,0,0);
strokeWeight (17);
line (250, height/5, 330, (height/5) + 30);

//right//

stroke (0,0,0);
strokeWeight (17);
line (530, height/5, 440, (height/5) + 30);

}

