
/* Fractal Curves for Processing
   based on an article of Danilo Toma
   
   by Christian Lovato 
   chr.lovato@gmail.com

*/



int P = 7; // Transformation number
int S = 6; // number of curves (sides of support polygon)
int N = 3; // curve order
boolean outside_curve = false;
int mag = 400;

boolean viewParTable = false;

boolean saveimage = false;

void setup(){
  size(480,480);
  background(0);
  stroke(255);
  strokeWeight(1.5);
  smooth();
  
  textFont(createFont("Consolas", 14));
  println("Press 'h' for command help");
}

void draw(){
  
  background(0);
  stroke(255);
  strokeWeight(1.5);
  
  plotCurve();
  
  if(viewParTable)
    drawParTable();
  if(saveimage){
    save("peano" + P + S + N + ".png"); // save image
    saveimage=false;
  }
}

void plotCurve(){
  float gr = - TWO_PI / P; // turning angles
  if(outside_curve)
    gr = TWO_PI/P;
  float r = - TWO_PI / S; // support polygon angles
  
  // vector D: rotation angles of the curve
  // condition sum D[k] = 0; start and end in the same direction
  // D(0)=D(P-1) make a open polygon with intial and final tails
  float[] D = new float[P]; 
  for (int i = 1; i < P-1; i++)
    D[i] = -gr;
  D[0]=D[P-1]=gr*(P-2)/2;
  
  // vector O: track the segment of curve at each level
  int[] O = new int[N];
  
  // Turtle parameters
  float x1 = width/2;
  float y1 = height/2-mag/2;
  float x2,y2;
  
  float an = r/2-TWO_PI; // current direction (change at every step)
  float l =  mag * sin(r/2)/pow(3,N); // step length
  
  int i,k;
  boolean curve_finished;
  for (i=0;i<S;i++) { // numbero of curves, sizes of polygon
    for (k=0; k<N; k++) // clear O (build curve from zero)
      O[k]=0;
    // draw curve
    curve_finished=false;
    k=0;
    while(true){
      // plot
      x2=x1+cos(an)*l;
      y2=y1+sin(an)*l;  
      line(x1,y1,x2,y2);
      x1=x2; y1=y2;
      if(curve_finished)  break;
      
      an = an + D[O[k]]; // update direction
      O[k]=O[k]+1;
      
      k=0;
      while(O[k]==P){
         O[k] = 0;
         k = k + 1;
         if(k==N){
           curve_finished = true;
           break;
         } 
      }
    }
    an = an + r; // add polygon angle
  }
}


void keyTyped() {
  background(0);
  switch (key){
    case 'a': case 'A':
      P=P+1;
      break;
    case 'z': case 'Z':
      if(P>1) P=P-1;
      break;
    case 's': case 'S':
      S=S+1;
      break;
    case 'x': case 'X':
      S=S-1;
      break;
    case 'd': case 'D':
      N=N+1;
      break;
    case 'c': case 'C':
      if(N>1) N=N-1;
      break; 
    case 'f': case 'F':
      mag=mag+40;
      break;
    case 'v': case 'V':
      mag=mag-40;
      break; 
    case 'o': case 'O':
      outside_curve=outside_curve?false:true;
      break;
    case 'p': case 'P':
      viewParTable=viewParTable?false:true;
      break;
    case 'h': case 'H': case'?':
      printHelp();
      break;
    case 'i': case 'I':
      saveimage=true;
      break;
      
    case '1':
      P=4; S=4; N=4;
      outside_curve = false;
      break;
    case '2':
      P=5; S=5; N=2;
      outside_curve = false;
      break;
    case '3':
      P=6; S=6; N=2;
      outside_curve = false;
      break;
    case '4':
      P=6; S=6; N=3;
      outside_curve = false;
      break;
    case '5':
      P=5; S=6; N=3;
      outside_curve = false;
      break;
    case '6':
      P=3; S=4; N=4;
      outside_curve = false;
      break;
    case '7':
      P=5; S=5; N=4;
      outside_curve = false;
      break;
    case '8':
      P=3; S=3; N=4;
      outside_curve = false;
      break;
    case '9':
      P=4; S=5; N=3;
      outside_curve = false;
      break;
    case '0':
      P=4; S=5; N=5;
      outside_curve = false;
      break;

  }
  
}

void drawParTable(){
 int[] pos = {10,420};
 int lstep= 15;
 stroke(100);
 fill(80,200);
 rect(pos[0],pos[1],130,48);
 fill(255);
 int x = 15, y=pos[1]+14;
 text("Trf # " + P, x,y);
 y+=lstep;
 text("Sides " + S, x,y);
 y+=lstep;
 text("Order " + N, x,y);

 x =  85; y=pos[1]+14;
 if(outside_curve)
   text("outside", x,y);
 else
   text("inside", x,y);
 y+=lstep;
 text("Mag " + mag, x,y);
};


void printHelp(){
  println("Curve di Peano 4Processing, by Christian Lovato");
  println("Command keys:");
  println("A/Z increase/decrease transformation number");
  println("S/X increase/decrease sides of the support polygon");
  println("D/C increase/decrease curve order");
  println("F/V increase/decrease magnification coefficient");
  println("I   save image of the curve");
  println("O   inside/outside curve drawing");
  println("P   show/hide parameters table");
  println("h/? print help message");
  println("1..0 predefined parameters, as in the original Toma article");  
};



