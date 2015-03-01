
float phi = (sqrt(5)+1)/2 - 1; // golden ratio
float ga = phi*2*PI;           // golden angle
float raio;

float easing = phi/10; // Numbers 0.0 to 1.0

float rr, gg, bb, dis;
int gain = 2;
float xpos, ypos;
float cc0, cc1, cc2;

float fr= 20;

float zi;
float rot = 0, rotc = 5;
PImage tex;
float rd = 0, gn = 127, bl = 255;
float rc = 3, gc = 50, bc = 10; //incrementos

float targetX, ptargetX;
float targetY, ptargetY;

void setup()
{
  size(680, 680, P2D);
  background(0);

  tex = get(); 
  textureMode(NORMAL);
  zi=width*phi/30;
  xpos=width/2;
  ypos=height/2;  
  raio=width/2;
}

void draw()
{
  translate(width/2, height/2);

  rotate(rot);
  translate(-width/2, -height/2);  

  rd += rc;
  gn += gc;
  bl += bc;
  if (rd >= 255 || rd <= 0) rc = -rc;
  if (gn >= 255 || gn <= 0) gc = -gc;
  if (bl >= 255 || bl <= 0) bc = -bc;

  cc0=rd;
  cc1=gn;
  cc2=bl;

  noStroke();
  //strokeWeight(4);
  stroke(color(rd, gn, bl, 200));
  beginShape();
  texture(tex);  
  for (int i=0; i<360; i+=40) {
    float y=raio*sin(radians(i))+tex.height/2;
    float x=raio*cos(radians(i))+tex.width/2;
    float raior=raio*0.01;
    float yr=raior*sin(radians(i))+tex.height/2;
    float xr=raior*cos(radians(i))+tex.width/2;
    vertex(xr, yr, x, y);
  }
  endShape(CLOSE);

  strokeWeight(3);
  // easining
  targetX = mouseX;
  targetY = mouseY;

  float speed = dist(targetX, targetY, pmouseX, pmouseY);
  speed += ((targetX+targetY)/2 - speed) * easing;//
  float diameter = (speed * 1.2)/30+1;//
  //println(diameter);

  //strokeWeight(diameter);
  xpos += (targetX - xpos) * easing;
  ypos += (targetY - ypos) * easing;

  for (int y=0; y<height; y+=3) {
    for (int x=0; x<width; x+=3) {
      color col = get(x, y); //pixels[pos];
      if (true) { //col!=color(255)) {
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;

        dis =dist(xpos, ypos, x, y);
        rr += cc0/dis; //-gain;
        gg += cc1/dis-gain;
        bb += cc2/dis-gain;
        stroke( rr, gg, bb, 220);

        point(x, y);
      }
    }
  }

  //get the next texture from the screen image
  tex = get(); 

  float st=cos(fr); //dist(mouseX,mouseY,width/2,height/2));  
  fr+=st;
  //println(abs(fr));

  //increment rotation
  rot += (ga/(100 * fr));  

  // mascara 
  //image(mascara,0,0);
}



