

inter v1= new inter(0,0,30);
inter v2= new inter(0,70,200);

float count = 0;

int 
  samples = 1024;  
float 
  angleStep  = TWO_PI/samples, 
  maxRadius = 300., 
  scaleF = 125., 
  radiusStep; 
PVector 
  shapeCenter,  
  currentVertex; 
PVector[]  
  lookupTable; 
 
 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
Minim minim; 
AudioPlayer song; 

rain[] zrain;
building s0;
building s1;
building s2;
building s3;
building s4;
building s5;
building s6;
building s7;
building s8;
building s9;
building s10;
building s11;
building s12;
building s13;

int drops = 20;

void setup()
{
 size(1000,900,OPENGL);
 frameRate(60); 
 
    minim = new Minim(this); 
   song = minim.loadFile("within.mp3", samples); 
       song.play(); 
     
 
 zrain = new rain[100];
 for(int zcount=0;zcount<100;zcount++)
 {
   zrain[zcount] = new rain(-zcount*70); 
 }
 s0 = new building(0,150);
  s1 = new building(-1000,150);
   s2 = new building(-2000,150);
    s3 = new building(-3000,150);
     s4 = new building(-4000,150);
      s5 = new building(0,850);
       s6 = new building(-1000,850);
        s7 = new building(-2000,850);
         s8 = new building(-3000,850);
          s9 = new building(-4000,850);
           s10 = new building(-5000,150);
            s11 = new building(-5000,850);
             s12 = new building(-6000,150);
              s13 = new building(-6000,850);
 
}

void draw()
{ 

 camera(mouseX, mouseY, 220.0, // eyeX, eyeY, eyeZ
         500.0, 500.0, -3500.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); //
         println(mouseY );
  
backgroundg();

for(int zcount1=0;zcount1<100;zcount1++)
 {
   zrain[zcount1].raining();
 }



s0.wander();
s0.making();
s0.lining();
s1.wander();
s1.making();
s1.lining();
s2.wander();
s2.making();
s2.lining();
s3.wander();
s3.making();
s3.lining();
s4.wander();
s4.making();
s4.lining();
s5.wander();
s5.making();
s6.wander();
s6.making();
s7.wander();
s7.making();
s8.wander();
s8.making();
s9.wander();
s9.making();
s10.wander();
s10.making();
s10.lining();
s11.wander();
s11.making();
s12.lining();
s12.wander();
s12.making();
s13.wander();
s13.making();


count+=0.01;
monster(500+100*(noise(count)-0.5),875,-1250+100*(noise(0,count)-0.5));

}


/////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

void backgroundg()
{

  background(200,200,255,255);
//  rotateX(radians(-30));

  fill(70);
  noStroke();
  beginShape();
  vertex(0,1000,0);
  vertex(1000,1000,0);
  vertex(1000,1000,-7000);
  vertex(0,1000,-7000);
  endShape();

fill(156,133,53);
 // stroke(0);
  pushMatrix();
  translate(150,1000,-3500);
  box(300,70,7000);
   translate(700,0,0);
    box(300,70,7000);
  popMatrix();
 
}

/////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////


class rain
{
float[] y = new float[drops];
float[] x = new float[drops];
float z;
float v = random(5,10);
float a = 3;
float l = random(10,15);
float op;
float ymap;
  
  rain(int zd)
  {
   z = zd;
     for(int i=0;i<drops;i++)
 {
 x[i] = random(1000);
 y[i] = random(-500,1000);
 }
  }
  
  void raining()
  {
     for(int i=0;i<drops;i++)
 {
  op = map(z,0,-5000,0,200);
  stroke(255,255,255,255-op);
  strokeWeight(2);
  line(x[i],y[i],z,x[i],y[i]+l,z);
  v=v+a;
  y[i]=y[i]+v;
 
  if(y[i]>1000)
{
  /*
   pushMatrix();
  translate(x[i],y[i]-10,z-3);
  noStroke();
 rotateX(radians(-90));
  fill(200,200,255,200);
  ellipse(0,0,30,30);
  popMatrix();
  */
  y[i]=0;
  x[i] = random(1000);
  v=random(5,7);

 
 }
}
  }
  
}
/////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

class building
{
 float velo=10;
 float acc=0;
 
 float build;
 float dis ;
 float szx1 ;
 float szx2 ;
 float szy ;
 color bc ;
 float mode;
  
 building(int bx, int ddrx)
{
  build=bx;
  mode=ddrx;
  dis = 1000;
  szx1 = random(200,500);
  szx2 = random(200,500);
  szy = random(400,700);
  bc = color(random(40,150));
}


void wander()
{
  velo += acc;
  build -=velo;
  
  if(build<-6000)
  {
 szx1 = random(300,500);
 szx2 = random(300,500);
 szy = random(400,700);
  bc = color(random(40,150));
 build=1000;
  }
}

void making()
{
 fill(bc);
 noStroke();
 pushMatrix();
 translate(mode,1000,build);
 translate(0,-szy/2,szx1/2); 
 box(200,szy,szx1);
 translate(0,0,-szx1/2-szx2/2);
 box(200,szy,szx2);
 popMatrix();
}

void lining()
{
 fill(255);
 pushMatrix();
 translate(500,1000,build); 
 box(25,6,400);
  translate(0,0,600); 
   box(25,6,400); 
 popMatrix();
}

}
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

float r = 70;
float[] sml = { 16, 51, 63, 71, 78, 
85, 90, 95, 96, 98,
96, 95, 94, 90, 88,
85, 82, 78, 73, 69,
67, 64, 59, 58, 58,
58, 58, 56, 52, 47,
38, 25, 0};
float scalar = 0.5;


 void monster(float monx, float mony, float monz)
 {
pushMatrix();
translate(monx,mony,monz);
rotateX(radians(90));
 noStroke();
 fill(0,140,230);
    rotateY(v2.value()/500);
  rotateX(v2.value()/500);
   PVector cart = new PVector(); // cartesian coordinates

  for(int tall=0; tall<32; tall+=1){
     beginShape(QUAD_STRIP);  
    //rotateZ(radians(2));
   for(float deg=0; deg<361; deg+=10){
 
     rotater(tall,deg,cart);
      vertex(cart.x*scalar, cart.y*scalar, cart.z*scalar);
     rotater(tall+1,deg,cart);
      vertex(cart.x*scalar, cart.y*scalar, cart.z*scalar);


   } 
     endShape();
  }

  popMatrix();
  
  
  pushMatrix();
  translate(monx,mony,monz);  
  translate(0,80,0);
  rotateX(radians(90));
  rotateY(radians(90 ) );
  rotateZ(radians(-90 ) );
   rotateX(radians(v2.value2()*5));
  skateboard(0,20-v2.value()/2,0); 
  popMatrix();
  
  /////  /////  /////  /////  /////  /////  /////  /////
   /////  /////  /////  /////  /////  /////  /////  /////
   

  pushMatrix();
  translate(monx,mony,monz);
  translate(-31*sin(radians(15)),-10,31*cos(radians(15)));
  rotateZ(radians(80+v2.value()));
  wheel(0,0,0,9,4.5, color(0,140,230));
  popMatrix();
  pushMatrix();
  translate(monx,mony,monz);
  translate(-31*sin(radians(15)),-10,31*cos(radians(15)));
  translate(45*sin(radians(10-v2.value())),45*cos(radians(10-v2.value())),0);
  sphere(9); 
  popMatrix();
    pushMatrix();
  translate(monx,mony,monz);
  translate(-31*sin(radians(15)),-10,31*cos(radians(15)));
  translate(45*sin(radians(10-v2.value())),45*cos(radians(10-v2.value())),0);
  rotateZ(radians(100+v2.value()));
  wheel(0,0,0,9,4.5, color(0,140,230));  
  popMatrix();  
  
    
  // wheel(),-31*sin(radians(-30)),9,4.5, color(0,140,230));
 
pushMatrix();
  translate(monx,mony,monz);
  translate(21*cos(radians(30)),-10,-21*sin(radians(30)));
  rotateZ(radians(80-v2.value()));
  wheel(0,0,0,9,4.5, color(0,140,230));
  popMatrix();
  pushMatrix();
  translate(monx,mony,monz);
  translate(21*cos(radians(30)),-10,-21*sin(radians(30)));
  translate(45*sin(radians(10+v2.value())),45*cos(radians(10+v2.value())),0);
 
  sphere(9); 
  popMatrix();
    pushMatrix();
  translate(monx,mony,monz);
  translate(21*cos(radians(30)),-10,-21*sin(radians(30)));
  translate(45*sin(radians(10+v2.value())),45*cos(radians(10+v2.value())),0);
  rotateZ(radians(100-v2.value()/3));
  wheel(0,0,0,9,4.5, color(0,140,230));  
  popMatrix(); 
  
   /////  /////  /////  /////  /////  /////  /////  /////
    /////  /////  /////  /////  /////  /////  /////  /////
  
  
  //facial expression
  pushMatrix();

  translate(monx,mony,monz);
   //gogaedoligi
   
  v1.reset(500);
    rotateY(v2.value()/500);
  rotateX(v2.value()/500);
  rotateY(radians(v1.value()));

  translate( 62*cos(radians(90))*scalar,-240*scalar,62*sin(radians(90))*scalar);
 
  face(0,0,0,0.5);

  popMatrix();
  
  
  
}

void rotater (int talling, float dug, PVector cartesian) 
{
  float theta = radians(dug);
  cartesian.x = sml[talling]*cos(theta);
  cartesian.y = sml[talling]*sin(theta);
  cartesian.z = talling*10;
  
}

void face(float x,float y,float z,float a)
{
  stroke(0);
  strokeWeight(10*a/1.5);
  strokeCap(ROUND);
  point(x-20*a,y-17*a,z);
  point(x+20*a,y-17*a,z);
  point(x,y-2*a,z);
    strokeWeight(10*a/2);
  line(x-17*a,y+12*a,z,x+17*a,y+12*a,z);
}
float adjust = 0.7;
 void skateboard(float skatex, float skatey, float skatez)
{ 
translate(150*adjust+skatex,-50*adjust+skatey-20,skatez);
  pushMatrix();
  rotateZ(radians(90 ) );
  wheel(50*adjust,50*adjust,0,50*adjust,2*adjust,color(3));
  wheel(50*adjust,250*adjust,0,50*adjust,2*adjust,color(3));
  pushMatrix();
  translate(60*adjust,150*adjust,0);
  box(20*adjust,200*adjust,100*adjust);
  popMatrix();
  popMatrix();
  rotateY(radians(90 ) );
  wheel(21*adjust,95*adjust,-240*adjust,20*adjust,2.5*adjust,color(223,37,36));
  wheel(-41*adjust,95*adjust,-240*adjust,20*adjust,2.5*adjust,color(223,37,36));
  wheel(-43*adjust,95*adjust,-240*adjust,8*adjust,9.3*adjust,color(140));
  
  wheel(21*adjust,95*adjust,-60*adjust,20*adjust,2.5*adjust,color(223,37,36));
  wheel(-41*adjust,95*adjust,-60*adjust,20*adjust,2.5*adjust,color(223,37,36));
  wheel(-43*adjust,95*adjust,-60*adjust,8*adjust,9.3*adjust,color(140));
  
  //x,y,z,r,h*10,color
}

 void wheel(float wheelx, float wheely, float wheelz,float r, float length2, color drop)
 {
    fill(drop);
  pushMatrix();
  translate(wheelx,wheely,wheelz);
  rotateY(radians(90 ));
  ellipse(0,0,2*r,2*r);
  translate(0,0,length2*10);
  ellipse(0,0,2*r,2*r);
  popMatrix();
   
pushMatrix();
translate(wheelx,wheely,wheelz);
 noStroke();
 fill(drop);
  
  
  
   PVector cart = new PVector(); // cartesian coordinates
  
  for(int tall3=0; tall3<10; tall3+=1){
     beginShape(QUAD_STRIP);  
    //rotateZ(radians(2));
   for(float deg=0; deg<361; deg+=10){
 
     cylinder(tall3,deg,cart,r,length2);
      vertex(cart.x , cart.y , cart.z );
     cylinder(tall3+1,deg,cart,r,length2);
      vertex(cart.x , cart.y , cart.z );


   } 
     endShape();
  }
 
  popMatrix();
  
}

void cylinder (int talling1, float dug1, PVector cartesian1, float rad, float length1) 
{
  float theta = radians(dug1);
  cartesian1.z = rad*cos(theta);
  cartesian1.y = rad*sin(theta);
  cartesian1.x = talling1*length1;
  
}

void transtester()
{
 strokeWeight(4);
 stroke(255,0,0); 
 line(-300,0,0,300,0,0);
 stroke(0,255,0);  
  line(0,-300,0,0,300,0);
 stroke(0,0,255);  
    line(0,0,-300,0,0,300);
}


class inter
{
  float a;
  float b;
  float term;
  float x;
  float count =0;
  
  inter(float aa, float bb, float c)
 {
  term = c;
  a = aa/term/term-bb/term/term;
  b = bb;
  x = -c-1;
 } 
 
  void action()
  {
    x = -term;
  }
 
  float value()
  {
   if(x>=-term&&x<=term)
   {
    x++;
    return a*x*x+b;
   }
   return 0; 
  }
  
   float value2()
  {
   if(x>=-term&&x<=0)
   {
    x++;
    return a*x*x+b;
   }
   return 0; 
  }
  
  void reset(int frame)
  { 
    count++;
    if(count%frame==0)
    {
      x= -term;
    }
}
}

void mousePressed()
{
    v2.action();
}


