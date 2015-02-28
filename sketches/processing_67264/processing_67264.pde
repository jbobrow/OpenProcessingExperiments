
String[] lines;
int index = 0;
int vuelta=0;
int t=10;
int r=int(random(50,255));
int g=int(random(50,255));
int b=int(random(50,255));
int r1=int(random(20,255));
int g1=int(random(20,255));
int b1=int(random(20,255));
int r2=int(random(50,255));
int g2=int(random(50,255));
int b2=int(random(50,255));
int r3=int(random(70,255));
int g3=int(random(70,255));
int b3=int(random(70,255));

void setup() {
  size(640, 480);
  background(0);
  
  frameRate(25);
  lines = loadStrings("prueba3.txt");
}

void draw() {
  if (index < lines.length) {
    String[] pieces = split(lines[index], '\t');
            for (int c=0;c<16;c++) {
            int f=int(pieces[c]);
            noStroke();
            
            fill(r*f,g*f,b*f);
            for (int i=0;i<=360;i+=240){
              for(int ii=0;ii<=480;ii+=160){
              rect(c*t+ii, vuelta*t+i,t,t);
            }
            }
            
            fill(r1*f,g1*f,b1*f);
              for (int i=120;i<=360;i+=240){
                for(int ii=0;ii<=480;ii+=160){
                rect(c*t+ii, vuelta*t+i,t,t);
            }
            }
//           
            fill(r2*f,g2*f,b2*f);
             for (int i=0;i<=240;i+=120){
                for(int ii=320;ii<=480;ii+=160){
                rect(c*t+ii, vuelta*t+i,t,t);
            }
            }
//
            fill(r3*f,g3*f,b3*f);
             for (int i=240;i<=360;i+=120){
                for(int ii=0;ii<=480;ii+=320){
                rect(c*t+ii, vuelta*t+i,t,t);
            }
            }

            
          }
    // Go to the next line for the next run through draw()
    index = index + 1;
    if (index==lines.length){index=0;}
    
    vuelta=index%12;
    
    if (vuelta==0){
      r=int(random(10,255));
      g=int(random(10,255));
      b=int(random(10,255));
      r1=int(random(10,255));
      g1=int(random(10,255));
      b1=int(random(10,255)); 
      r2=int(random(10,255));
      g2=int(random(10,255));
      b2=int(random(10,255));
      r3=int(random(10,255));
      g3=int(random(10,255));
      b3=int(random(10,255));
      }
  }
}

