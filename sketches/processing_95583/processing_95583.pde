
//Winter/holiday sketch: one array (of floats, ints, or objects), some 
//"blinking" lights, and either rotate or scale (to use those, you'll also
//need pushMatrix, popMatrix, and translate, most likely.)
//Make a seasonal sketch that uses at least one array (an array of objects,
//ints, or floats will all work), at least one instance of scale or rotate, and
//some blinking or flickering "lights" (such as twinkling stars, blinking Christmas
//lights, flickering Menorah flames, etc.)
PImage snow;
float w;
float q;
int l;
float [] rayx = new float [100];
float [] rayy = new float [100];
float [] rayc = new float [225];


void setup(){
  
  snow=loadImage("snowflake.jpg");
  
  size (500, 500);
  background (#285ADE);
  frameRate (30); 
 
imageMode (CENTER);
w=0;

  for (int i = 0; i<rayx.length; i++){
    rayx[i] = random (0, 500);
  }
    for (int p=0; p<rayy.length; p++){
    rayy[p] = random (0, 500);
  }
}

  void draw(){
    
    fill (#ED0C00);
translate(250, 250);
rotate(w);
image(snow, 0, 0);
if (q<5){
  w=w+.1;
}
else if(q>5 && q<10){
  w=w-.1;
}
else if (q>=10){
  q=0;
}

q=q+.1;


        for (int c=0; c<rayc.length; c++){
    rayc[c] = random (0, 225);
        }   
    for (int j=1; j<100; j++){
      fill (#000000, rayc [j]);
      ellipse (rayx [j], rayy [j], 10, 10);
      fill (#FFFFFF, rayc [j]);
      ellipse (rayx [j], rayy [j], 10, 10);
    }
  }

