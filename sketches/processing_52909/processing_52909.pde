
import gifAnimation.*;

PVector pos;
float rad = 100;
float dia = rad*2;
float tar;
float vel, ang;

GifMaker gifMaker;
PGraphics gs;

void setup() {
  size(512,160, P3D);
  frameRate(8);
  
  if(!online) {
    gs = createGraphics(256, 80, P3D);
    gifMaker = new GifMaker(this, "test.gif");
    gifMaker.setDelay(125);
    gifMaker.setRepeat(0);
  }
  
  tar = rad;
  pos = new PVector(
    random(width+dia), 
    new float[]{height+dia, -dia}[(int)random(2)]
  );
  vel = random(rad*.1, rad*.6);
  ang = random(TWO_PI);
  background(0);
  loadPixels();
}

void mouseClicked() {
  if(!online) gifMaker.finish();
}

void draw() {
  boolean out =
    pos.x > (width+dia)*.9 || pos.x < -dia*.9 ||
    pos.y > (height+dia)*.9 || pos.y < -dia*.9;
  if(out) {
    ang += random(PI*.9, PI*1.1);
    tar = random(50, 200);
  }
  
  rad = lrp(rad, tar, .1);
  dia = rad*2;
  
  vel = vel<0?0:vel;
  float[] velRnd = 
    new float[]{random(-rad*.1), random(rad*.1)};
  if(vel<rad*.1) vel += velRnd[1];
  if(vel>rad*.6) vel += velRnd[0];
  
  ang += new float[]{random(-.25), random(.25)}[(int)random(2)];
  pos.x += cos(ang)*vel;
  pos.y += sin(ang)*vel;
  
  pos.x = pos.x>width+dia?(width+dia)-(pos.x+rad*.5):pos.x;
  pos.x = pos.x<-dia?width+abs(pos.x)+rad*.5:pos.x;
  
  pos.y = pos.y>height+dia?(height+dia)-(pos.y+rad*.5):pos.y;
  pos.y = pos.y<-dia?height+abs(pos.y)+rad*.5:pos.y;
  
  for(int a=0; a<pixels.length; a++) {
    float dst = 
      dist(pos.x, pos.y, a%width, (a-a%width)/(float)width);
    
    if(dst <= rad) {
      if(brightness(pixels[a])<255) {
        pixels[a] += 
          lerpColor(pixels[a], color(255), 1-dst/rad)<<17;
      }
    }
  }
  
  fill(0, 4);
  rect(0,0,width,height);
  
  if(!online) {
    gs.beginDraw();
    gs.loadPixels();
    gs.image(g, 0,0,gs.width,gs.height);
    for(int a=0; a<gs.pixels.length; a++) {
      gs.pixels[a] = color(red(gs.pixels[a]));
    }
    gs.updatePixels();
    //gs.filter(GRAY);
    gs.endDraw();
    gifMaker.addFrame(gs);
  }
  
  updatePixels();
}

float lrp(float cur, float tar, float rat) {
  if(abs(tar-cur) > .0001)
    return cur+(tar-cur)*rat;
  else return tar;
}
    

