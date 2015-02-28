
// perlin noise based terrain generation
// mouse position defines scroll direction in XZ plane
// click & drag mouse left/right to scale noise function

// author: info@toxi.co.uk

float noise_offset=0;
int   xyScale=8;
int   zScale=200;
float currScale=0.1f;
int   numSegments=50;

float xoff=0;
float yoff=0;

void setup() {
  size(400,400,P3D);
  noiseDetail(2);
  noStroke();

}

void draw() {
  background(255);
  noise_offset+=0.1;

  int idx=0;
  // scale the noise function based on mouseX when mouse is pressed
  if (mousePressed) {
    currScale+=(((width/2)-mouseX)*0.01-currScale)*0.01;
  } else {
    // get the movement direction from mouse coordinates
    float angle=atan2((height/2)-mouseY,(width/2)-mouseX);
    float xySpeed=sqrt(sq((width/2)-mouseX)+sq((height/2)-mouseY))*currScale*0.01;;
    xoff+=xySpeed*cos(angle);
    yoff+=xySpeed*sin(angle);
  }

  float currZ;

  //setup perspective
  translate(-20,height/2.5,-90);
  rotateX(PI/3);

  // build the 3d mesh
  for(int y=0; y<numSegments; y++) {
    beginShape(QUAD_STRIP);
    for(int x=0; x<numSegments; x++) {
      currZ=noise(xoff+x*currScale,yoff+y*currScale,currScale);
      // do a bit of fogging by basing the colour on the y-coordinate
      fill(currZ*300+255-y*8,max(255-y*8,0),max(255-y*16,0));
      vertex(x*xyScale,y*xyScale,currZ*zScale);
      vertex(x*xyScale,(y+1)*xyScale,noise(xoff+x*currScale,yoff+(y+1)*currScale,currScale)*zScale);
      vertex((x+1)*xyScale,(y+1)*xyScale,noise(xoff+(x+1)*currScale,yoff+(y+1)*currScale,currScale)*zScale);
      vertex((x+1)*xyScale,y*xyScale,noise(xoff+(x+1)*currScale,yoff+y*currScale,currScale)*zScale);
    }
    endShape();
  }
}



