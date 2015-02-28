
int arraysize=10;

int[] x=new int[arraysize];
int[] y=new int[arraysize];
int[] s=new int[arraysize];
int[] xs=new int[arraysize];
int[] ys=new int[arraysize];
int[] c=new int[arraysize];

void setup() {
  size(800, 600);

  for (int i=0;i<arraysize;i++) {
    x[i]=int(random(100,200));
    y[i]= int(random(100,200));
    xs[i]=int(random(10,20));
    ys[i]=int(random(10,20));
    s[i]=int(random(10,20));

  }
}


void draw() {
  
  background(255); 

  for (int i=0;i<arraysize;i++) {
    x[i]=x[i]+xs[i];
    y[i]=y[i]+ys[i];

    //right
 if(mousePressed){
 fill(x[i],y[i],i);} 
    if (x[i]>=width ) {
     xs[i]= xs[i]*-1;
    }

    //bottom

    if (y[i]>=height) { 
      ys[i]=ys[i]*-1;
    }
    //left

    if (x[i]<=0) {
     xs[i]= xs[i]*-1;
    }


    //top

    if (y[i]<=0) {
     ys[i]=ys[i]*-1;
    }
 
   ellipse(x[i], y[i], s[i], s[i]);

  }}
