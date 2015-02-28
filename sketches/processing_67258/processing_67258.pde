
  float hour;
  float minute;
  float second;
  int hournumber;

void setup(){
  
size(400,400);
smooth();
frameRate(1);
}
void draw(){

background(0);
  
gethourlum(); 
getminutelum();
getsecondlum();  
gethournumber();

  
noStroke() ;
colorMode(HSB, 100);

fill(360,0,second);
ellipseMode(CENTER);
ellipse(width/2,height/2,width,width);

fill(360,0,minute);
ellipseMode(CENTER);
ellipse(width/2,height/2,(2.2*width/3),(2.2*width/3));

fill(hour);
ellipseMode(CENTER);
ellipse(width/2,height/2,(2.5*width/5),(2.5*width/5));

PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("Dosis-Regular-64.vlw"); 
textFont(font, 64);
fill(map(-hour,-256,0,0,256));
text(hournumber, width/2,height/2);



println(hour);
println(minute);
println(second);



}


void gethourlum(){
  
  if(hour()>12){
    hour=map((-hour()+12),-12,-1,0,100);
  }else{
    hour=map((hour()),1,12,0,100);
  }
}

void getminutelum(){
 
  minute=map(minute(),0,60,0,hour);
  
}

void getsecondlum(){
 
  second=map(second(),0,60,0,minute);
  
}


void gethournumber(){
  if(hour()>12){
    hournumber=hour()-12;
  }else{
    hournumber=(hour());
  }
}

