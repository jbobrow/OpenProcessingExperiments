
//Rayniel Estrella | HW6 - Predicting Time
//Nick Lally | Math, Programming, and Art

void setup(){
  size(350,200);
  colorMode(HSB,360,100,100);
  smooth();
  noStroke();
}
void draw(){
background(64);

int m=minute(), s=second(), h=hour(); //For some reason, when I place this on the very top it would stop working.
float hy=(height)/60*h;
float my=(height)/60*m;
float sy=(height)/60*s; //This bar that tells the seconds is not supposed to move while it stretches down.

//Hours - Yellow
fill(60,99,99);
rect(50,h,50,hy);

//Minutes - Purple
fill(275,52,87);
rect(150,m,50,my);

//Seconds - Red
fill(360,100,80);
rect(250,s,50,sy);
}

