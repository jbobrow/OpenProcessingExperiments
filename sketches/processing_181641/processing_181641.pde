

//Info: http://processingjs.org/reference
void setup(){
  size(750,400); 
  frameRate(1);
  colorMode(HSB,100);
} 

void draw(){
  fill(#000000);
  
//set the variables up for the time and date
int h=hour();
int m=minute();
int s=second();
int y=year();
int mo=month();
int d=day();



textSize(30);

stroke(0,0,0);
strokeWeight(3);

background(s,100,100);


//Display Hours
textSize(40);
text(h,300,150);

//Display Minutes
textSize(30);
text(m,width/2,150);

//Display Seconds
textSize(25);

text(s,450,150);

//Display day
textSize(40);
text(d,300,200);

//Display month
textSize(30);
text(mo,width/2,200);

//Display year
textSize(30);
text(y,450,200);


}


