
void setup(){
  size(400,700);

}

  float mncr8 = random(5,15);

void draw(){
  fill(5,5,20,30);
  rect(0,0,width,height);
  translate(200,350);
  
  noStroke();

  if (mncr8 <= 5){
    mncr8 = mncr8 * random(1,1.1);}
  else{
    mncr8 = mncr8 * random(0.9,1.1);}

  int mny = 0;
  int mnx = 0;
  
  while(mny<20){
    fill(random(240,255),random(230,240),random(170,190),80);

  ellipse(0,mncr8*3,mncr8,mncr8);
  rotate(radians(18));
  mnx=mnx+20;
  if(mnx>=360){
    mny=mny+1;rotate(radians(5));}
  }
}

