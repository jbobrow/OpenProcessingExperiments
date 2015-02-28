
PGraphics mask;
PFont f;

void setup(){
size(500,500,P2D);
smooth();
background(1);
noStroke();
strokeWeight(2);

mask = createGraphics(500, 500, P2D);
f = loadFont("HelveticaNeueLT-Light-250.vlw");
}


void draw(){
  background(0);
float hoch = map(minute(),0.0,59,140,311);
fill(#08FF91);
rect(0,0,width,hoch);


mask.beginDraw(); // begin
mask.background(255); //white background
mask.fill(0); // black fill
mask.textFont(f, 250); //select font
mask.textAlign(CENTER); 
mask.text(hour(), 250, 310); //draw letter
mask.endDraw(); // end
blend(mask,0,0,500,500,0,0,500,500,LIGHTEST);

fill(0);
rect(135,350,250,10);
fill(#08FF91);
float breite = map(second(),0,59,0,250);
rect(135,350,breite,10);


}
