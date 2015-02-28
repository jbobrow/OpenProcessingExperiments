

float[] numbers;
String[] names;
float[] s;
float[] d;
PFont f;

    float theta;
    float ca;
    float us;
    float happy;

void setup(){
  size(777,777);
  smooth();
  noStroke();
  f=loadFont("ArialMT-16.vlw");
  String[]lines=loadStrings("n.txt");
  numbers=new float[lines.length];
  names=new String[lines.length];
  s=new float[lines.length];
  d=new float[lines.length];
  
  
  for (int i = 0; i < lines.length; i++) {
    String[] splitting = split(lines[i],","); // splitting only has 2 elements
    names[i] = splitting[0];
    numbers[i] = float(splitting[1]);
    s[i]=float(splitting[2]);
    d[i]=float(splitting[3]);
     println(splitting[0] + " " + splitting[1]+" "+ splitting[2]+" "+splitting[3]);
  }
}


void draw(){
  background(255);
   for(int i=0; i<numbers.length; i++ ){
     
     fill(0,100);
    text(names[i], i*width/3+100, 100);
    text("population",width/2, 300);
    text("land", width/2,500);
    text("desitiy", width/2, 700);

    ellipse(i*width/3+100,200,numbers[i]/10000000,numbers[i]/10000000);
    ellipse(i*width/3+100, 400,s[i]/100000,s[i]/100000);
    ellipse(i*width/3+100, 600,d[i],d[i]);
    ////////////// 17 ,6,2,

     theta=theta+TWO_PI/170;
    
     ca=ca+TWO_PI/60;
     us=us+TWO_PI/20;
    
    fill(255,0,0);
    float x=sin(theta)*10+100;
    float y=cos(theta)*10+130;
       
    ellipse(x,y,10,10);
    
    //canada
    
    float xc=sin(ca)*10+width/3+100;
    float yc=cos(ca)*10+130;
    ellipse(xc,yc,10,10);
    
    //us
    
    float xu=sin(us)*10+width/3*2+100;
    float yu=sin(us)*10+130;
    
    ellipse(xu,yu,10,10);
    
/////////////////
           happy+=0.1;
     float hx= sin(happy)*140+width/2;
     float hy=sin(happy)*140+100;
     fill(0,255,0,100);
     rect (width/2,200,40,40);
     rect( 100,200,57,57);
     rect(width/4*3,200,30,30);
     

    
    
   } 
     
}

