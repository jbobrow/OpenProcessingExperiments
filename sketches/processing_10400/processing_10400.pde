
int[] x,y,j;

int side=500;
int ox=-1;
int oy=-1;
int index;

void setup() {
  size(side, side);
  background(255);
  stroke(0);
  String[] lines = loadStrings("mona-lisa100K.tsp");
  x=new int[lines.length-7];
  y=new int[lines.length-7];
  println (x.length);
  int center=0;
  int i=0;
  for (int l=6; l < lines.length; l++) {
     String[] pieces = split(lines[l], ' ');
      if (pieces.length == 3) {
        x[i] = int(pieces[1]);
        y[i] = int(pieces[2]);
        if (abs(x[i]-10000)<50 && abs(y[i]-10000)<50)
          center=i;
        i+=1;
      }
  }
  lines = loadStrings("monalisa_5757191.tour");
  j=new int[lines.length-5];
  println (j.length);
  i=0;
  index=1;
  for (int l=5; l < lines.length-1; l++) {
    j[i]=int(lines[l])-1;  
    if (j[i]==center) index=i;
    i+=1;
  }
  ox=x[j[index-1]]*side/20000;
  oy=side-y[j[index-1]]*side/20000;;

}

void draw() {
  for (int i=0; i < 200; i++)
  {
    int nx=x[j[index]]*side/20000;
    int ny=side-y[j[index]]*side/20000;
    line(ox,oy,nx,ny);
    ox=nx; oy=ny;
    index=(index+1)%x.length;
  }
}

