
import ddf.minim.*;
AudioPlayer music; 
Minim minim;
float body=10;
float head=20;
float eye1=26;
float eye2=38;
float ant=30;
float ball=32;
float mouth=24;
float leg1=20;
float leg2=39;
float wing1=17;
float wing2=53;
////////////////////
float bodyY=800;
float headY=775;
float antY=763;
float eyeY=784;
float eye2Y=784;
float ballY=761;
float mouthY=790;
float legY=850;
float wingY=810;
////////////////////

float rocketX=25;
float rocketY=875;
float rocket2X=44;
float rocket2Y=875;



boolean b=true;


void setup() {
size(500,1000);
  
}
void draw() {
  
  

  
  background(0);
if (mousePressed == true) {
  fill(234,random(224),9);  
  ellipse(rocketX,rocketY,10,30);
  ellipse(rocket2X,rocket2Y,10,30);
     bodyY=bodyY-3;
    headY=headY-3;
    antY=antY-3;
    eyeY=eyeY-3;
    eye2Y=eye2Y-3;
    ballY=ballY-3;
    mouthY=mouthY-3;
    legY=legY-3;
    wingY=wingY-3;
    rocketY=rocketY-3;
    rocket2Y=rocket2Y-3;
     minim = new Minim(this);
  music = minim.loadFile("U.mp3", 1024); 
  music.play();
  
}





  
  
   fill(193,193,193);
   ellipse(wing1,wingY,40,10);
   ellipse(wing2,wingY,40,10);
  
  rect(body,bodyY,50,50); //body
  fill(193,193,193);
  rect(head,headY,25,25); //head
  rect(ant,antY,5,12);  //antenna
  fill(random(255),0,0);
  ellipse(eye1,eyeY,7,7); //left eye
  ellipse(eye2,eye2Y,7,7);  //right eye
  fill(0,36,255);
  ellipse(ball,ballY,12,12); //ball
  fill(random(239),0,0);
  rect(mouth,mouthY,17,6); //mouth
  fill(193,193,193);
  rect(leg1,legY,10,25); //leg one
  rect(leg2,legY,10,25); //leg two
 








} // end of void draw





  
void keyPressed(KeyEvent evt) {

 
  int key = evt.getKeyCode();  // Keyboard code for the pressed key.
 
  if (key == KeyEvent.VK_LEFT) {  // left-arrow key; move square up
    body=body-10;
  head=head-10;
  eye1=eye1-10;
  eye2=eye2-10;
  ant=ant-10;
  ball=ball-10;
  mouth=mouth-10;
  leg1=leg1-10;
  leg2=leg2-10;
  wing1=wing1-10;
  wing2=wing2-10;
  rocketX=rocketX-10;
  rocket2X=rocket2X-10;
  }
  else if (key == KeyEvent.VK_RIGHT) {  // right-arrow key; move right
    body=body+10;
  head=head+10;
  eye1=eye1+10;
  eye2=eye2+10;
  ant=ant+10;
  ball=ball+10;
  mouth=mouth+10;
  leg1=leg1+10;
  leg2=leg2+10;
  wing1=wing1+10;
  wing2=wing2+10;
  rocketX=rocketX+10;
  rocket2X=rocket2X+10;
  }
  else if (key == KeyEvent.VK_UP) {  // ROCKET BOOSTERS
   
    
    
    
    
    
    
    
    
  }
  else if (key == KeyEvent.VK_DOWN) {  // down-arrow key; move down
  fill(234,random(224),9);  
  ellipse(rocketX,rocketY,10,30);
  ellipse(rocket2X,rocket2Y,10,30);
  bodyY=bodyY+3;
    headY=headY+3;
    antY=antY+3;
    eyeY=eyeY+3;
    eye2Y=eye2Y+3;
    ballY=ballY+3;
    mouthY=mouthY+3;
    legY=legY+3;
    wingY=wingY+3;
    rocketY=rocketY+3;
    rocket2Y=rocket2Y+3;
   
music = minim.loadFile("U.mp3", 1024);
music.play();
 
  }
}



void mouseReleased() {
  music.pause();
}

