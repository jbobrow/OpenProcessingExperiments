


PImage cute; 
PImage sad;
float r=50;    
float theta = 0;



float x;//=height;
float y;//=width;
float diam=30; 
float a=0;
float b=0;
float back=100;
float speeda=3;
float speedb=6;
int s=0;
int p=300;
int duh1=0;
float a1=0;
float b1=0;
float d1=0;
float e1=0;
float f1=0;
float c1,diam1;
float co1=40;
float ho1; 





void setup() {
  size(800,800);
  smooth();
  cute = loadImage("cutelw.jpg");
  sad = loadImage("sadlw.jpg");
  
   rectMode(CENTER);
  ellipseMode(CENTER);

  
  frameRate(20);
 
}

void draw() {
  
   back=back+1;
 if( back>300){back=20;}
 background(back);
  
    if (s>300) {
    s=-10;
  }
  s=s+3 ;
  //background(s);

  //stroke(s);
  noFill();
  math();
  drops();
  insane();
    lw();
    
}

void math () {


  if(p<-19) {
    p=280;
  }
  p=p-3;


  float count = constrain((mouseX+mouseY)/70,0,70);
  float rot = constrain((mouseY+mouseY)/6,0,360);
  float c=count;
  translate(350,350);
  
 
 
//  back=back+1;
//  if( back>300){back=100;}
//  background(back);
  noFill();

  while (count> 0) {  



    {

      rotate(radians(rot));
      noFill();
      stroke(s-50);
      rect(0,0,mouseX,mouseY);
    }

    noFill();
    stroke(p-10);
    ellipse(0,0,mouseX,mouseY);
    stroke(s/2);
    line((mouseX-mouseX/3*c),(mouseY-mouseX/3*c),diam*2,diam*2);
    ellipse(mouseX-350,mouseY-350,mouseX,mouseX); 



    float blinkx=mouseX-mouseX/3*count;
    float blinky=mouseY-mouseX/3*count;
    float speedblinkx=random(0,3);
    float speedblinky=random(0,3);

    blinkx=blinkx+speedblinkx;
    blinky=blinky+speedblinky;

    if(blinkx>30||blinkx<0) {
      speedblinkx=-1*speedblinkx;
    }

    if(blinky>30||blinky<0) {
      speedblinky=-1*speedblinky;
    }

    diam=diam+3;
    if (diam>30) {
      diam=0;
    }


    fill(p-10);

    ellipse(blinkx,blinky,diam,diam);
    c=c+1;
    count = count -1;
  }
}


void drops() {

  float d;

  d = diam + 9;
  if (diam > 100) {
    d = 40;
  }






  if(a>400||a<0) {
    speeda=-1*speeda;
  }

  if (b>400||b<0) {
    speedb=-1*speedb;
  } 
  fill(s);
  ellipse(a,b,d,d);
  a=a+speeda;
  b=b+speedb;

  
}
void insane(){
  noFill();
  
  duh1=duh1-1;
  if (duh1<-10) {
    duh1=200;
  }

  

  a1=random(-50,25);
  b1=random(-15,35);
  f1=random(5,33);
  c1=random(0,100);
  c1=c1-diam1;
  if (c1<-100) {
    c1=100;
  }

ho1=ho1-1;
if (ho1<0){
  ho1=300;}
  
stroke(back+33);
  
  diam1=random(0,30);
  diam1=diam1+1;
  if (diam1>30) {
    diam1=-100;
  }


  
  ellipse(f1,0,f1-2*c1,f1-2*c1);// oppiste 
  
  // line=ellipse
  ellipse(a1,c1-duh1,2*diam1+33,2*diam1+33);
  rect(a1,duh1*3-duh1,3*diam1,3*diam1); 
  translate (c1,a1);
  line(0,diam1,0+duh1, diam1);
  line(3*c1,0+3*diam1,100,0+3*diam1);
  
  
  line(a1,duh1*2,a1,100);
  line(duh1,111,c1,111);
  ellipse(e1-c1,f1,c1*2,c1*2);
  
  rect(1,co1,c1*3,c1*3);
 
 
 rect(c1,1,111,1);
 
  line(a1+111,c1-duh1,a1+111,duh1*2);
  line(c1,a1,duh1*2,a1);
  // oppiste line
  line( 11, c1 ,11, c1+111);
  line(e1,c1+duh1,c1-111,c1+duh1);
  line (0,duh1+c1,0,duh1*2+c1);
   
   
 
  rect(0,duh1-c1,duh1,duh1);
  line(duh1-c1,0,duh1*2-c1,0);
  line(1,duh1,1,duh1*2);
  line(duh1,c1*8,   duh1,c1*8+11);// more line
  
 
 //REVISED
 
 //b 
 //line(b,f,b,f);

 
 
  //
  //stroke(ho);
  
  
  ellipse(diam1,0,f1-3*c1,f1-3*c1);// oppiste 
  
  // line=ellipse
  ellipse(a1,c1-duh1,2*diam1,2*diam1);
  rect(a1,c1-duh1,2*diam1,2*diam1);
  //translate (c1,a1);
  line(111,diam1,f1, diam1);
  line(3*diam1,e1-3*diam1,3*diam1,e1);
  //translate(a1,c1);
  line(a1,c1-duh1,a1,duh1);
  line(c1-111,0,111,0);
ellipse(0,f1,c1,c1*2);
//  
}

void lw() {
  
  
  
  float x = r * cos(theta);
  float z = r * sin(theta);
  theta += 0.005;
  //
  if(keyPressed) {
    if (key == 'b' ) {
     image(sad,mouseX+x,mouseY+z);
     
    }
  }
  
  if (keyPressed){ 
    if (key=='a'){
    
  image(cute,mouseX+x,mouseY); 
  
}
}
stroke(250,252,153);
//strokeWeight(3);
ellipse(mouseX,mouseY,x+5,z+5);





}


