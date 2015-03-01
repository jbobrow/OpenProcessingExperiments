
int ox1 = 50;
int oy1 = 50;
int hb = 20;    //hitbox
int aix = 0;
int aiy = 0;
int aix2 = 400;
int aiy2 = 0;
int aispeed = int(3);
int count = 0;

void setup(){
  size(400,400);
  background(255);
  noStroke();
}

void draw(){
  count = count + 1;
  background(0);
  fill(255,0,0);
  ellipse(mouseX,mouseY,hb,hb);
  fill(255,255,0);
  rect(ox1,oy1,hb,hb);
  
  if((mouseX) >ox1){
    if((mouseX) < (ox1+hb)){
      if((mouseY) > oy1){
        if((mouseY) < (oy1+hb)){
          text("hit", random(100),random(100));
  } } } } //hitbox if

//======================================AI shit
if (aix >= mouseX) //ai
    {aix -= aispeed;}
if (aix < mouseX)
    {aix += aispeed;}
if (aiy >= mouseY)
    {aiy -= aispeed;}
if (aiy < mouseY)
    {aiy += aispeed;}
 
if(mouseX > aix-25 && mouseX < aix+25 && mouseY > aiy-25 && mouseY < aiy + 25)
//enemy collision
{
    fill(0,0,0); // if hit
    fill(255);
    text("hit", random(100),random(100));
}
ellipse(aix, aiy, 50, 50);
//================================================================================
//================================================================================
if (aix2 >= mouseX) //ai
    {aix2 -= aispeed;}
if (aix2 < mouseX)
    {aix2 += aispeed;}
if (aiy2 >= mouseY)
    {aiy2 -= aispeed;}
if (aiy2 < mouseY)
    {aiy2 += aispeed;}
 
if(mouseX > aix2-25 && mouseX < aix2+25 && mouseY > aiy2-25 && mouseY < aiy2 + 25)
//enemy collision
{
    fill(0,0,0); // if hit
    fill(255);
    text("hit", random(100),random(100));
}
ellipse(aix2, aiy2, 50, 50);
if(count >= 100){
  ellipse(aix2, aiy2, 50, 50);  // if i want this i have to do an array
}
//================================================================================
//================================================================================

}//draw end


