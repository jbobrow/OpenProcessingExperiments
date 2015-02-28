
int x = 250;
int y = 480;
int z = 1;
float o;
float q = random(20,480);
float g;
float afstand = 50;
float radius = 20;
int point = 0;
float m = random(20,480);
float t;
float afstand2 = 50;
float t2;
float m2;
float afstand3 = 50;
float t3;
float m3;
float afstand4 = 50;

void setup()
{

  size (500,500);
   background(211,224,32);
}

void draw()
{
 println(afstand2);
    o = o +4;
 background(211,224,32);


 afstand = sqrt((q-x)*(q-x) + (o-y)*(o-y));
if ((afstand <= radius))
{
  
  point = point+1;
 
}
if ((afstand <= radius))
{
 o = -30; 
 q=random(20,480);
}
  
if (o >= 520){
  o = -30;
  q=random(20,480);
}

  ellipse(q,o,20,20); 
  //--ææææ--------------------------------------------------------------------------------
   if (point >= 5)
  {
    bonus();
  }
  if (point >= 15)
  {
    bonus2();
  }
  if (point >= 30)
  {
  bonus3();
  }
//----øøøø-------------------------------------------------------------------------------------
 afstand2 = sqrt((m-x)*(m-x) + (t-y)*(t-y));
 afstand3 = sqrt((m2-x)*(m2-x) + (t2-y)*(t2-y));
 afstand4 = sqrt((m3-x)*(m3-x) + (t3-y)*(t3-y));
 fill(0);
 ellipse(x,y,30,30);
 fill(252,0,0);
 ellipse(x-7,y,10,10);
 ellipse(x+7,y,10,10);
 fill(0,57,255);
 
 
 if (x < 5 ){
  x = 5; 
 }
 if (x > 466) 
 {
  x = 466; 
  
  z = z +1;
   
 }
 text(point,20,20);
 if (mousePressed == false)
 {
  return; 
   
 }
 
 x = mouseX;

 
}


void keyPressed(){
 if (key=='a'){
   x = x -10;
 }
if (key=='d'){
  
  x = x+10;
}
}
//--funktion-----------------------------------------------
 void bonus()
 {
   
    fill(252,0,0);

 t = t + 2.5;

if ((afstand2 <= radius))
{
  point = point + 1;
 t = -30; 
 m=random(20,480);
}

ellipse(m,t,20,20);

if (t >= 580) {
  t = t - 3;
}

  }
  //--bounus 2--------------------------------------------------------
  void bonus2()
 {
   
    fill(8,206,16);

 t2 = t2 + 1;

if ((afstand3 <= radius))
{
  point = point + 1;
 t2 = -30; 
 m2=random(20,480);
}

ellipse(m2,t2,20,20);
  }
// bonus2 slut------------------------------------------'
// bonus3 start-------------------------------------------
void bonus3()
 {
   
    fill(255,245,52);

 t3 = t3 + 2;

if ((afstand4 <= radius))
{
  point = point + 1;
 t3 = -30; 
 m3=random(20,480);
}

ellipse(m3,t3,20,20);

  }
  // bonus3 slut-----------------------------------------------------------
