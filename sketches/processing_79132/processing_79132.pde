
PImage bild; 

int anzahl =60;
float[] x = new float[anzahl];
float[] y = new float[anzahl];


void setup() {

  frameRate(60);
  smooth();
  size(800,800);
  ellipseMode(CORNER);
  for (int i=0; i < anzahl; i++) {         
  bild = loadImage("Lego800x800.jpg");
 noStroke();   
  colorMode(HSB,360,255,255);
  x[i] = i*width/anzahl+width/anzahl/2;      
  y[i] = i*width/anzahl+width/anzahl/2;
  background(0);
}}
void draw(){
  
  
  fill(360,255,0,15);
  rect(0,0,800,800);
  //background(0);
  
  fill(bild.get(mouseX,mouseY));
  //ellipse(mouseX-12*(width/anzahl/2)/2,mouseY-12*(width/anzahl/2)/2,4*(width/anzahl/2),4*(width/anzahl/2));
  
  for (int i=0; i<=x.length-1; i++){
    
    for (int j=0; j<=y.length-1;j++){
    
    //point(x[i],y[j]);
    
     pushMatrix();
translate(x[i],y[j]);
  float a = atan2(mouseY-y[j], mouseX-x[i]);
  rotate(a);
 //scale (map(dist(x[i],y[i],mouseX,mouseY),200,1130,3,3));
  float distmouse = dist(mouseX,x[i],mouseY,y[j]);
  float distmax = sqrt(2*sq(width))-sqrt(2*sq(width/anzahl/2));
  int xe = int(map(distmouse,distmax,0,0,-2*(width/anzahl/2)))-2*(width/anzahl/2);
  int ye = -2*(width/anzahl/2);
 
  color c = bild.get(int(x[i]),int(y[j]));
       
   //fill(255);
     float  cs2 = map(brightness(c),255,0,15,5); //ellipsendurchmesser nach helligkeit
  
  
  
  
  fill(hue(c),saturation(c)-int(map(distmouse,distmax,0,saturation(c),0)),brightness(c)); //das mit der saturation funktioniert so noch nicht!
 

  
  
  
  ellipse(2*xe,ye,cs2,cs2); //kreis um ursprung wird in -x-richtung bis 2*durchmesser verschoben und danach um ursprung gedreht
  //line (-25,0,25,0);
  //ellipse(-100,0,cs2,cs2);
  
  popMatrix();
    
  point(x[i],y[j]);
}}
  



}






