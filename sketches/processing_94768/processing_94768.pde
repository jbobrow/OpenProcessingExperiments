
//String[] data =loadStrings("that.txt");
String[] data= { "900,254,10,2", "800,290,90,.3", "700,300,8,3", "500,40,200,.001", "200,90,8,.9", "100,380,.9,1", "750,250,400,.5","900,300,200,.25"}; //x start(px), y start(px), amplitude(px), frequency(waves/second)
float time;
float light;

spheres[][] spheree= new spheres[data.length][900];

float a1;
float a2;
float a3;

void setup() {
  light=150;
  size(1000,500);
  smooth();

  
  for(int i=0; i<spheree.length; i++) {
    a1= random(0,50);
    a2=random(0,50);
    a3=random(0,50);
    for(int k=0; k<spheree[i].length; k++) {
      
    spheree[i][k]=new spheres(i,k,random(25,100),a1,a2,a3,data[i]);
    
    }

  }
  
  
}




void draw() {

  
  background(light);
  text("press enter to turn out the lights",10,10);
  for(int i=0; i<spheree.length; i++) {
        for(int k=0; k<spheree[i].length; k++) {
 

    spheree[i][k].display();
    spheree[i][k].go();
        }
    
    
  }

}



    
void keyPressed() {
  if(key=='\n') {
    if(light==150) {
      light=0;} else {
        light=150;
      }
  }
}
class spheres{
  float xloc;
  float yloc;
  float xv;
  float yv;
  int inte;
  float mousex;
  float mousey;
  float c;
  float xa;
  float ya;
  int thing;
  float rand;
  float rande1;
  float rande2;
  float rande3;
  float xv1;
  float yv1;
  String[] datae;
  float[] datae2;
  
  
  spheres(int thing1,int inte1,float rand1, float rande11, float  rande21, float  rande31, String datae1) {
  
  
    datae=splitTokens(datae1,",");
    datae2=new float[datae.length];
    
    for(int as=0; as<datae2.length; as++) {
    datae2[as]=float(datae[as]);
    } 
   
    
    
    inte=inte1;
       mousex=0;
       mousey=datae2[1];
       
       
       xloc=mousex-inte1*2;
   yloc=mousey;
   
   
   thing=thing1;
   rand=rand1;
   rande1=rande11;
   rande2=rande21;
   rande3=rande31;
   
       
      
  }
  
  
  
  
 void display() {
   fill(abs(yv+xv)*rande1,abs(yv+xv)*rande2,abs(yv+xv)*rande3);
   noStroke();

   ellipse(xloc,yloc,2,2);
   
 }
 
 
 
 
 
 void go() {
   c=c+1;
  
     xloc=xloc+xv;
   yloc=yloc+yv;
   
   
   
   
     if(inte>0) {   //y location
    
   mousey=spheree[thing][inte-1].yloc;
   mousex=spheree[thing][inte-1].xloc-1;
    
   } else{
   //   mousex=mousex+xv1;
      mousey=sin(radians(c*180/60*datae2[3]))*datae2[2]+datae2[1];//mousey+yv1;
      mousex=datae2[0];
 
  
   }
  
 xv=(mousex-xloc)/3;
  yv=(mousey-yloc)/3;
 
   
   
 }
}

   
  
    


