
///////////////////////////////////////////
//
//              Stereo-Vision
//
//              Hackpact 2012
//
//                  #Dia 1
//////////////////////////////////////////

color bck;
int t ;
float nx=0, i_nx= 0.0006;
float vx=0;

void setup() {
  size(900, 300);
  smooth();
  colorMode(HSB, 360, 100, 100);  
  bck = color(224, 55, 57);
  background(bck);
  background(255,100);
}

void draw() {

  fill(bck, 50);
//  fill(255,150);
  rectMode(CORNER);  
  rect(0, 0, width, height);

  translate(width/2, height/2);

  stroke(255,150);
  
  int s = int(map(mouseX,0,width,6,27));
  int t = int(map(mouseY,0,height,1,10));
  
  vx = noise(nx)*10;
  
  for ( int j = -height/2; j < height/2; j += 40) {
      strokeWeight(1+random(0,1));
    beginShape();
    for ( int i = -width/2; i < width/2; i += s) {    
      curveVertex(i, j + 20*sin(degrees(i+j*t+vx)));
      curveVertex(i, j + 30*cos(degrees(i+j*t-vx)));
      ellipse(i,j + 30*cos(degrees(i+j*t-vx)),10,10);
      
    }
    endShape();
  }
  t++;
  nx += i_nx;
  
}

  void keyPressed(){
   if( key == ' '){ 
    save("capturas/img"+frameCount+".png");
   }
  }


