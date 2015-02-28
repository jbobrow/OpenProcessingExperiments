
//roscharch rocks!//Ale González//Public Domain//2011//a(en)60rpm.tv//////////////////////////
//Un ejemplo muy sencillo de micródigo aumentado para enseñar aspectos básicos de processing//
//////////////////////////////////////////////////////////////////////////////////////////////
//A basic example of augmented 'microde' in order to teach some of p5 features////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

  int n=360;            //'magic number' for color, size and angle range
  float n_f=0,          //noise factor 
  k=TWO_PI/n,           //angle step
  R,f=.5,               //variables to shift radius
  h,s=n*.8,b,a=n*.1;    //color variables: hue,saturation,brightness,alpha
  boolean z=false;      //imagine it!

void setup(){           
  size(720,720);smooth();noCursor();  //basic settings | Use size(n*2,n*2)
  colorMode(HSB,n);background(n);     //color settings
  h=random(n-a);R=n;                  //variable settings 
}

void draw(){
  if (!z){
    stroke(R,a);
    fill(h+(sin(n_f+=k)*a),s,b++%n,a);  //small palette of hue (1/10 of the palette)
    beginShape();
    for (float i=0;i<=TWO_PI;i+=k){
      float cc=cos(i);float ss=sin(i);float rr=noise(cc,ss,n_f)*R;    
      vertex(n+rr*cc,n+rr*ss);       //make a circle but shift the radius of the vertexes with the noise 
    }
    endShape();
  }
  R-=R>0?f:0;
}

void mousePressed(){z=!z;}
void keyPressed()  {setup();}

