
void setup()
{
  size(200,400);
  int t = 0;
  smooth();
  background(0,0,0);
}
void draw()
{
  int t = 0;
  background(0,0,0);
  while(t<10000){
    t=t+1;
    stroke(255,0,0); // rouge
    point(100+(t)*sin(millis()*PI/2000+t*PI/100)/4 , 100+t+(t/1000)*cos(t*4*PI/100));
    
    point(100-t/30+(t)*sin(PI+millis()*PI/2000+t*PI/100)/4 , 100+t+(t/1000)*cos(+t*4*PI/100));
    point(100+t/30+(t)*sin(PI+millis()*PI/2000+t*PI/100)/4 , 100+t+(t/1000)*cos(+t*4*PI/100));
    
    
    stroke(0,255,0); // vert
    point(100+(t)*sin(millis()*PI/2000+PI+t*PI/100)/4 , 100+t+(t/1000)*cos(t*4*PI/100));
    
    point(100-t/30+(t)*sin(millis()*PI/2000+t*PI/100)/4 , 100+t+(t/1000)*cos(+t*4*PI/100));
    point(100+t/30+(t)*sin(millis()*PI/2000+t*PI/100)/4 , 100+t+(t/1000)*cos(+t*4*PI/100));
    
  }
  
  line(100,100,25,350);
  line(100,100,175,350);
  line(25,350,175,350);
  stroke(0,0,0);
  fill(0,0,0);
  rect(0, 351, 200, 100);
  
  
  stroke(150,100,50);
  fill(150,100,50);
  rect(90,351,20,20);
  //background(0,0,0);
}
