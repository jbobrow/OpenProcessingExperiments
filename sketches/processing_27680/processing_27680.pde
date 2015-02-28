
/*
Modified by Alastair Gray. (Original by Jared "BlueThen" C,  'Wavy'.)
*/

float compression = .55;
float a;
float speed = 0.8;

void setup()
{

  size(500,500);
  colorMode(RGB, 10);
  
  //compression = (dist(mouseX,mouseY, width/500.0,height/500.0)*compression++);
  
  
  stroke(2);

  frameRate(30);
}
void draw()
{
  
  
  

  speed = (width/2-dist(mouseX,mouseY, width/2,height/2)) / (width/2);
  
 // if (mouseX < width-100 > width-400, mouseY < height-100 > height-400){
    
    if ((mouseX < width -100)&&(mouseX > 100)){
      
   
    compression = .88;
    
  }else{
    compression = .55;
  }
  
  compression = (width/2-dist(mouseX,mouseY, width/2,height/2))/( dist(0,0, width/2, height/2));




    //When "i" is less than "35"...
   


  a -= speed;

  background(6);

  for (int x = -42; x < 42; x++) {
    //if (x > - 20) {
     // compression = .88;
    
    
    for (int z = -42; z < 42; z++) {

      //for (int y = int(10 * cos(0.55 * distance(x,z,0,0) - a))); halfw+halfh >= 250; int a -= 0.5;)  {     


      int y = int(24 * cos(compression * distance(x,z,0,0) - a));





      float xm = x*17 -8.5;
      float xt = x*17 +8.5;
      float zm = z*17 -8.5;
      float zt = z*17 +8.5;

      int halfw = mouseX;
      int halfh = mouseY;


      int isox1 = int(xm - zm + halfw);
      int isoy1 = int((xm + zm) * 0.5 + halfh);
      int isox2 = int(xm - zt + halfw);
      int isoy2 = int((xm + zt) * 0.5 + halfh);
      int isox3 = int(xt - zt + halfw);
      int isoy3 = int((xt + zt) * 0.5 + halfh);
      int isox4 = int(xt - zm + halfw);
      int isoy4 = int((xt + zm) * 0.5 + halfh);
      
      color from = color(34,0,90);
  color to = color(9,0,23);
  color intA = lerpColor(from,to,.2);
  color intB = lerpColor(from,to,.4);
  color intC = lerpColor(from,to,.6);
  color intD = lerpColor(from,to,.8);

      fill (intA);
      quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+40, isox2, isoy2+40);
      fill (intB);
      quad(isox3, isoy3-y, isox4, isoy4-y, isox4, isoy4+40, isox3, isoy3+40);


      fill(intC,intD,2);
      quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
    }
  }
}
  



float distance(float x,float y,float cx,float cy) {
  return sqrt(sq(cx - x) + sq(cy - y));
}


