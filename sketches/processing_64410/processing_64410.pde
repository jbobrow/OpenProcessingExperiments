
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/59807*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//
// outline: takes an image (image.jpg) and creates a sketch version
//
// procsilas (procsilas@hotmail.com / http://procsilas.net)
//

String iName="image.jpg";

void setup() {
  llegeixImatge("./"+iName);
  size(img.width, img.height);
}

// parameters
// NO real control, so be careful

int NP=10000; // 1000 for line art, 10000 for complex images, O(N^2) so be patient!!!
int B=1; // try 2 or 3
float THR=28; // range 5-50
float MD=6; // range 0-10
int NMP=6; // range 1-15

float[][] punts;
color[] cpunts;
int [] usat;
int [] NmP=new int[NMP];
float [] NdmP=new float[NMP];

int inici=0;

PImage img;

void llegeixImatge(String s) {
  img = loadImage(s);
  img.loadPixels();
}

float fVar(int x, int y) {
  // neighborhood 2B+1x2B+1 pixels
  float m=0;
  for (int k1=-B; k1<=B; k1++) {
    for (int k2=-B; k2<=B; k2++) {
      color c=img.pixels[(y+k1)*img.width+(x+k2)];
      m+=brightness(c);
    }
  }
  m/=float((2*B+1)*(2*B+1));
  float v=0;
  for (int k1=-B; k1<B; k1++) {
    for (int k2=-B; k2<B; k2++) {
      color c=img.pixels[(y+k1)*img.width+(x+k2)];
      v+=(brightness(c)-m)*(brightness(c)-m);
    }
  }
  v=sqrt(v)/(float) (3*B+1); //change here   

  return v;
}

void creaPunts() {
  punts = new float[NP][2];
  cpunts = new color[NP];
  usat = new int[NP];

  int nint1=0;
  int nint2=0;

  for (int i=0; i<NP;) {

    int x=B+int(random(width-2*B));
    int y=B+int(random(height-2*B));

    //println(i+" = "+x+", "+y+": "+THR+", "+MD);

    // points need to be at least MD far from each other
    int flag=0;
    if (MD>0.0) {  
      for (int j=0; flag==0 && j<i; j++) {
        if (dist(x, y, punts[j][0], punts[j][1])<MD) {
          flag=1;
        }
      }
    }

    if (flag==0) { 
      nint1=0;
      float f=fVar(x, y);

      // use only "valid" points      
      if (f>=THR) {
        nint2=0;
        punts[i][0]=x;
        punts[i][1]=y;
        cpunts[i]=img.pixels[y*img.width+x];
        usat[i]=0;
        i++;
      } 
      else {
        nint2++;
        if (nint2>=10) {
          THR/=(1+1.0/float(NP-i));
          MD/=(1+1.0/float(NP-i));
          nint2=0;
        }
      }
    } 
    else {
      nint1++;
      if (nint1>=10) {
        MD/=2.0;
        THR*=1.618;
        nint1=0;
      }
    }
  }
}

int NessimMesProper(int i) {
  if (NMP<=1) {
    int mP=-1;
    float dmP=dist(0, 0, width, height);
    for (int j=0; j<NP; j++) {
      if (usat[j]==0) {
        float jmP=dist(punts[i][0], punts[i][1], punts[j][0], punts[j][1]);
        if (jmP<dmP) {
          dmP=jmP;
          mP=j;
        }
      }
    }
    return mP;
  } 
  else {
    for (int j=0; j<NMP; j++) {
      NmP[j]=-1;    
      NdmP[j]=dist(0, 0, width, height);
    }
    for (int j=0; j<NP; j++) {
      if (usat[j]==0) {
        float jmP=dist(punts[i][0], punts[i][1], punts[j][0], punts[j][1]);
        int k=NMP;
        while(k>0 && NdmP[k-1]>jmP) {
          k--;
        }
        if (k<NMP) {
          for (int l=0; l<(NMP-k)-1; l++) {
            NmP[(NMP-1)-l]=NmP[(NMP-1)-(l+1)];
            NdmP[(NMP-1)-l]=NdmP[(NMP-1)-(l+1)];
          }
          NmP[k]=j;
          NdmP[k]=jmP;
        }
      }
    }
    return NmP[NMP-1];
  }
}

int fase=0;

void draw() {
  if (fase==0) {
    creaPunts();
    background(#FFFFFF);
    fase=1;
  } 
  else {
    if (inici!=-1) {
      stroke(200,100,100,33);
      usat[inici]=2;

      int seguent=NessimMesProper(inici);
      if (seguent!=-1) {
        line(punts[inici][0], punts[inici][1], punts[seguent][0], punts[seguent][1]);
      }
      inici=seguent;
    } 
    else {
      save("outline_"+iName);
      noLoop();
    }
  }
}


