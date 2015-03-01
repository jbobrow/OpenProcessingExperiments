

//Info: http://processingjs.org/reference
void setup(){
  size(750,750); 
  frameRate(1);
  colorMode(HSB,100);
} 

int rotation=0;

void draw(){
  translate(width/2,height/2);
  fill(#000000);
  rotation=rotation+6;
  rotate(rotation);
  
//set the variables up for the time and date
int h=hour();
int m=minute();
int s=second();
int y=year();
int mo=month();
int d=day();



textSize(30);

stroke(0,0,0);
strokeWeight(0);


//Display Seconds
textSize(20);text(s,s*4,20,20);
fill(s,100,100);
rect(0,0,s*4,10);



//Display Minutes
textSize(30);
fill(m+s,100,100);
rect(0,20,m+200,10);
text(m,m+220,40,30);

//Display Hours
textSize(40);
fill(h+s,100,100);
rect(0,40,h+300,10);
text(h,h+300,50,50);




}


