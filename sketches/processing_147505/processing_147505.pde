
long lastTime = 0;
int x = 1000;
void setup() {
  size(1280,1024);
  lastTime = millis();
}
void draw() {
  if ( millis() - lastTime <= 30 ) {
    println( "0.03 seconds" );
    background(255,0,0);
    
  }
  else if ( millis() - lastTime <= 60 )
    {
    println( "0.06 seconds" );
    background(255,255,0);}
        else if ( millis() - lastTime <= 90 )
    {
    println( "0.09 seconds" );
    background(255,255,255);
        }
        else if ( millis() - lastTime <= 120)
    {
    println( "0.120 seconds" );
    background(255,0,255);
        }
        else if ( millis() - lastTime <= 150)
    {
    println( "0.150 seconds" );
    background(176,196,222);
        }
         else if ( millis() - lastTime <= 180 )
    {
      println( "0.180 seconds" );
      background(255,69,0);
        lastTime = millis();
    }
    else if ( millis() - lastTime <= 210 )
    {
        lastTime = millis();
    }

        

}
