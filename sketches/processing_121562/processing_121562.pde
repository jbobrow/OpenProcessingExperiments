
//--------------------
//Random_timer
//SCTM_2B91
//2434140
//--------------------
//
bubble troop[] = new bubble[190];
timer timeShown = new timer();
//
void setup() {
  //
  size(780, 420);
  background(30);
  //
  for ( int i = 0 ; i < troop.length ; i++ )
  {
    troop[i] = new bubble(random(width), random(height));
  }
}//setup end

void draw() {
  //
  background(30);
  stroke(0, 0, 0, 200);
  //
  for ( int i = 0 ; i < troop.length ; i++ )
  {
    troop[i].draw();
  }
  //
  timeShown.draw();
  //
}//draw ends

//----------Timer class-----------
//
class timer {
  void draw() {
    //----------clock----------
    int randomDelay;
    int s = second();  // Values from 0 - 59
    int m = minute();  // Values from 0 - 59
    int h = hour();    // Values from 0 - 23
    //
    randomDelay = int(random(0, 1000));
    //
    fill(128, 128);
    textSize(80);
    text((h-12), (width/2)-140, height/2);//hour
    text(m, (width/2)-80, height/2);//minutes
    text(s, (width/2)+40, height/2);//seconds
    //
    delay(randomDelay);
  }//draw ends
}//class ends

//----------bubble class----------
//
class bubble {
  float x;
  float y;
  float colorR, colorG, colorB;
  float myAlpha; 
  color c; 
  //
  bubble(float initialx, float initialy) {
    x = initialx;
    y = initialy;
    //
    colorR = random(255);
    colorG = random(255);
    colorB = random(255);
    //
    myAlpha = random(128);
  }

  void draw()
  {
    c = color(colorR, colorG, colorB, myAlpha );
    fill(c);
    ellipse(x, y, 10, 10); 

    x = (x + 0.5 )% width; 
    y = (y + (myAlpha/800)) % height;
  }//draw ends
}//bubble class ends

