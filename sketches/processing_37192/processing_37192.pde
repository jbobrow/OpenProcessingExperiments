

size (300, 300);
background (255);

float r= 50;
float mySpace=10;
int nLines= 30;

for (int x=0; x<=nLines; x=x+1) {


  line (x, x*mySpace, r, x*mySpace);
}                
                
