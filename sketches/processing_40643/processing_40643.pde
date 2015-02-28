


float[][] data;
int position = 0;

float theta,ba;
float i;

PFont font;

void setup(){
  size(777,777);
  smooth();
  noStroke();
  String[]lines=loadStrings("power2.csv");
  
  data=new float[lines.length][3];
  
  for( int i=0;i<lines.length; i++){
    data[i]=float(split(lines[i],","));
  }
  font = loadFont("FFScala-Bold-66.vlw"); 
textFont(font); 

//translate(width/2,height/2);
}

void draw(){
   ba=ba+0.1;
  float back=map(sin(ba), -1,1,0,255);
  
  background(back);
  t();
  translate(width/2, height/2);
 
 

 //theta=theta+TWO_PI/100;
   float zoom=map(mouseX,0,width,10,150);
     for( float i=0; i<(data.length); i=i+100){
      for(float theta=0; theta<=(data.length);theta+=1){
        // theta+=0.001;
 //i=i+1;
 float imouse=7;
// float imouse=map(mouseX,0,width,1,7);
 float r=map(i*sin(theta*imouse),0,data.length,0,mouseX);
 // float r=r*sin(theta*7);
  float x= r*sin(theta);
  float y= r* cos(theta);
  
  
   //float big = map(sqrt(data[position][2]), 0, sqrt(0.2), 0, 10);
   //float smalll=map(sqrt(data[position+1][2]), 0, sqrt(0.2), 0, 10);
   
   float bigger=data[position][2];
   float small=data[position+1][2];
   
   //float coco=map(position,0,bigger,0,255);
   
   
   float blink=abs(bigger-small)*200;
    // float blink=big;
  
  //fill(0,100);
  fill(abs(255-back));
 
  rect( x,y,blink,blink);
  
  position++;
  if(position>=data.length-1){
    position=0;
  }
  
}
 }
  
}

void t(){
  

for(float i=0; i<TWO_PI; i=i+TWO_PI/7){

float x=(width/2-100)*sin(i);
float y=(height/2-100)*cos(i);

fill(random(0,255));
text("one", x+(width/2),y+height/2);


//s[]=String "one,two,three,for,five,six,seven" ;


}

}

