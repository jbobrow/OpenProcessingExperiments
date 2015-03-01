
String[] tryto;
void setup()
{
  size(700,700);
  background(252,217,89);
  tryto = loadStrings("bikes-mi.tsv");
  frameRate ( 60);
  smooth();
}
void draw()
{
  if(frameCount< tryto.length)
  {
    String[] fanwei = split(tryto[frameCount],'\t');
    float x =float(fanwei[1])-9.15;
    float y =float(fanwei[2])-45.43;
    float z=random(1,5);
    float s= float(fanwei[3]);
    float diam= s*z;
    noStroke();
    fill(random(x*10000),random(y*10000),random(s*20000),80);
    
    ellipse(x*9250,height-y*9250,diam,diam);
    stroke(random(diam*50),0,random(s*x*500),50 );
    line(0,0,x*9250,height-y*9250);
    line(700,700,x*9250,height-y*9250);
     line(0,700,x*9250,height-y*9250);
      line(700,0,x*9250,height-y*9250);

     
  }
 }

