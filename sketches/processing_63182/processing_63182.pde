
//dancing iris
//based on dancing circles by conroy

int t=0;

int numberOfCircles=47;
float sizes[] = new float[numberOfCircles];

float sumSizes=0;

    
float r1=random(0,1.57);
float r2=random(0,1.57);

float s1=random(0.05,0.07);
float s2=random(0.05, 0.07);

float t1=random(0.0009,0.0011);
float t2=random(0.0009,0.0011);

void setup(){
  size(920,1000);
  background(0);
smooth();
for(int i=0;i<numberOfCircles;i++) {
   sizes[i]=random(2,50);
   sizes[i]=60;
    }

}
  
void draw(){
  
    translate(width/2,height/2);
  rotate(frameCount/100.0);
  
   translate(-width/2,-height/2);
  

  ++t;
    fill(0);
    noStroke();
//if((t % 1)==0) {
  //rect(0,0,width,height);}
    //background(0);

    float red=100+60*sin(t*0.012+r1);
    float green=100+60*sin(t*0.013+r2);
    float blue=100+60*sin(t*0.014);
    stroke(red,green,blue);
    strokeWeight(2);
    noFill();
    //ellipse(12*t,12*t,red,green);

float offSet=(width-sumSizes)/12;
sumSizes=0;
for(int i=0; i<numberOfCircles; i++) {
  ellipseMode(CORNER);
  ellipse(offSet,height/2-sizes[i]/2,sizes[i],sizes[i]);
  offSet += sizes[i];
  sizes[i] = sizes[i]+12*cos((0.005+0.002*i)*t+0.2*i);
  sumSizes=sumSizes+sizes[i];
}
    


}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
