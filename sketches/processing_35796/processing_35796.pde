
  import ddf.minim.*;
Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0; 


void setup(){
  setupAudio();
  size(500, 500);
  background (255, 137, 194);
}

void draw(){
    fill(255,137,194);

  rect(0,0,500, 500);
  fill(255,255,255);
  getVolume(); // this call fetches the mic volume for the current frame.
  float Y = map(volume, 0,100, 2,120); 
smooth();
stroke(0, 30, 110);  

strokeWeight (8);
rect(105, 80, 300,300);

strokeWeight (2);
rect(130, 100, 250, 250);

strokeWeight (4);
fill (249, 250, 15);
ellipse(255, 225, 200, 200);

// triangle (255, 320,  100, 500,  400, 500);

fill (245, 22, 130);
quad(200,300,  255,310,   255,330,   200,340);
quad(255,310,  310,300,   310,340,   255,330); 

strokeWeight(4);
fill(206, 31, 219);
triangle(199, 50, 315, 140, 160, 180);

ellipse (255, 320, 25, 25);

fill(245, 22, 130);
ellipse (199, 50, 25, 25);

noFill();
//strokeWeight (30);
//rect (0,0, 500, 500);

strokeWeight (2);
stroke(0);
fill(250,3,36);
arc(255, 255+Y, 70, 50, 0, PI);//50



fill(0);
strokeWeight(2);
  float dx = constrain((mouseX-218)/20, -14,14);
  float dy = constrain((mouseY-200)/20, -14,14);
ellipse (218+dx, 200+dy,   12, 12);
ellipse (280, 190,   12, 12);


  fill(250, 3, 36);
  stroke(0);
  beginShape();
  curveVertex(220, 260); 
  curveVertex(220, 260);
  curveVertex(240, 238);
  curveVertex(255, 250);
  curveVertex(270, 238);
  curveVertex(290, 260); 
  curveVertex(290, 260);
  endShape();


//mustache
 strokeWeight (2);
stroke(0);
fill(25, 8, 250);
smooth();
curve(100, 100,    200, 230,    255, 230,    300, 150);
curve(70, 230,    200, 230,    255, 230,    400, 400);
curve(250, 250,    255, 230,    310, 230,    430, 50);
curve(200, 400,    255, 230,    310, 230,   460,230);




//mouth line
  noFill();
  stroke(0);
  strokeWeight(1);
  beginShape();
  curveVertex(220, 260); 
  curveVertex(220, 260);
  curveVertex(245, 255);
  curveVertex(255, 260);
  curveVertex(265, 255);
  curveVertex(290, 260); 
  curveVertex(290, 260);
  endShape(); 
  smooth();

}
  
  void setupAudio(){
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
}

void getVolume(){
  volumeF = in.right.level()*1000;
  volume = 0.8*volume + 0.2*volumeF;
}
 
//-------------------------------------
void stop(){
  in.close();
  minim.stop();
  super.stop();
}


