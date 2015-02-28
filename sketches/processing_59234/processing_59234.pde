
/**
* Logaritmic dynamics by kof, 2012
*/


ArrayList pnts, orig;

PVector pos;

void setup() {

  size(512, 512, P2D);

  pnts = new ArrayList();
  orig = new ArrayList();


  for (int i = 0 ; i < width*height;i+=3) {
    pnts.add(new PVector(i%width, i/width)); 
    orig.add(new PVector(i%width, i/width));
  }
  
  textFont(loadFont("SempliceRegular-8.vlw"));
  textMode(SCREEN);
  
  noStroke();

  fill(255
  );
}

void draw() {

  background(0);


for(int z  = 0 ;z<2;z++){

  float X = (noise(frameCount/60.0+z*5.0, 0)*width);
  float Y =  (noise(0, frameCount/60.0+z*5.0)*width);
  
  if(z==0)
  text("A",X+24,Y-6);
  if(z==1)
  text("B",X+24,Y-6);
  
  stroke(255,120);
  line(X,Y,X+20,Y-10);
  


  for (int i =0 ; i < pnts.size();i++) {
    PVector pos = (PVector)pnts.get(i);
    PVector org = (PVector)orig.get(i);
    float d = dist(X, Y, pos.x, pos.y)+1.0;
    float d2 = dist(org.y, org.x, pos.x, pos.y)+1.0;
    
    stroke(lerpColor(#FFCC00, #00CCFF, d2/700.0), map(d,0,width,100,5));

    pos.x -= (X-pos.x)/((log(d/10.0+1.01)*(2.0)));
    pos.y -= (Y-pos.y)/((log(d/10.0+1.01)*(2.0)));



    pos.x += (org.x-pos.x)/(10.0);
    pos.y += (org.y-pos.y)/(10.0);

    pos.x += (X-pos.x)/((log(d/30.0+1.01)*(3.0)));
    pos.y += (Y-pos.y)/((log(d/30.0+1.01)*(3.0)));

  if(z==1)
    point(pos.x, pos.y);

  }
  
}  
}


