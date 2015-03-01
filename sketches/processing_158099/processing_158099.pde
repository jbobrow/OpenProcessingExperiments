
   PImage sourceimg;
  float scale = 10;
  int iterations = 14000;
  float step;
  boolean changeColor = true;
  boolean   useImage = false;
  int colorShift = 0xbeca;// 
  int bgColor = 35;
  
  
  public void setup() {
     frameRate(6);
    size(700, 480);
    //sourceimg = loadImage("ocean2_sm.jpg");
    //sourceimg = loadImage("bw_owl1.jpg");
      sourceimg = loadImage("nightowl.jpg");
      //sourceimg = loadImage("svgowl.jpg");
    //step = (float)sourceimg.width/iterations;
    step = float(700)/iterations;
    noStroke();
  }

  public void draw(){
    if(useImage == false) {
      background(bgColor);
    }
    else {
      loadPixels();
      image(sourceimg, 0, 0);
    } 
  
  
    float  xn, yn, xn1, yn1;
    float a, b;

    xn1 = mouseX/15;
    a = mouseY/11000f;
    yn1 = 0f;
    b = 0.9993f;
    
    for (int i = 0; i < iterations; i++){
      xn = xn1;
      yn = yn1;
      xn1 = b*yn + gumowski(xn, a, b);
      yn1 = -xn + gumowski(xn1, a, b);   
    
      if(useImage == false){
        if(changeColor == true){          
          fill(bgColor-(colorShift+frameCount*2), 180);
        }
        rect((i*step), yn1*scale +250, 1, 2);
      } 
      // So what I changed is no image    
       
        int xc = (int) (i*step);
        int yc = (int) (yn1*scale + 250);
        yc = constrain(yc,0, sourceimg.height);
        int loc = (int)(xc + yc*sourceimg.width);

        if(loc < sourceimg.width * sourceimg.height){
          int c = sourceimg.pixels[loc];
          noStroke();
          fill(c-(colorShift+frameCount%0xffffff), 180 );
          if( i%2 == 0){
            fill(0);
            rect((i*step), yn1*scale +250, 1, 1);
          } else {
            rect((i*step), yn1*scale +250, 2, 16);
          }  
        }
      
      
    }    
   }


  float gumowski(float x, float a, float b){
    float x2 = x*x;
    return  a*b*x + (2*(1-a)*x2)/(1+ x2);
  }



