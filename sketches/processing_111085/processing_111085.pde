
// TWO SENTENCE ARTISTIC STATEMENT
//Draws semi-random ellipses, based on mouse input. 
//Try to draw an abstract image by controlling:
// - the color palette('C' key). There is a blue, a green and a brown palette. 
// - Size, position and dispersion of the ellipses with the mouse position and velocity
// Mouse click starts and stops drawing with the movement
// 'P' key saves screenshot 


//Color Palettes
int[][] palettes ={
  {#27F632, #A1AF8D, #71E80C, #0BFF7E},
  {#0216A8, #6AFFFF, #06ACE8, #1507FF},
  {#A8B40C, #FF708D, #98860C, #FFDF8D}
};

int colorPaletteIndex;
int[] colorPalette;

PVector velocity;
float maxVelocity;
boolean drawing;
int BASE_MAX_SIZE, BASE_MIN_SIZE;
   

public void setup(){

   size(1280, 720);
   background(192);

   colorPaletteIndex = 0;
   colorPalette = palettes[colorPaletteIndex];
   
   BASE_MAX_SIZE = height/16;
   BASE_MIN_SIZE = 1;//height/30;

   velocity = new PVector(0,0);
   maxVelocity = 0;

   drawing = false;
}

void keyReleased() {
  if (key == 'P' || (key == 'p')){
    saveFrame("frame_"+frameCount+".png");
  }
  if (key == 'C' || (key == 'c')){ //cycle colors
    colorPaletteIndex = (colorPaletteIndex+1) % 3;
    colorPalette = palettes[colorPaletteIndex];
  }
}

void mouseReleased(){
  println("change Mode:"+drawing);
  drawing = !drawing;
  maxVelocity = 0;
}

public void draw(){
  
  if(drawing){
      println("T:"+millis()/1000+":"+pmouseX+", "+pmouseY+" -> "+":"+mouseX+", "+mouseY);
      velocity.x = (mouseX - pmouseX);
      velocity.y = (mouseY - pmouseY); 
      
      maxVelocity = max(maxVelocity, velocity.mag());
      
      if(velocity.mag() != 0){
      
        float size = ceil(map(velocity.mag(), 0, maxVelocity, BASE_MIN_SIZE, BASE_MAX_SIZE));
        
        color fillColor = color( //fill color is a random color between the first 2 colors of the palette
           floor( random(red(colorPalette[0]), red(colorPalette[1]) )), //Red
           floor( random(green(colorPalette[0]), green(colorPalette[1]) )), //Green
           floor( random(blue(colorPalette[0]), blue(colorPalette[1]) )), //Blue
           floor( map(velocity.y, 0, maxVelocity, 16, 128)) //alpha
         );
         
         color borderColor = color( //fill color is a random color between the last 2 colors of the palette
           floor( random(red(colorPalette[2]), red(colorPalette[3]) )), //Red
           floor( random(green(colorPalette[2]), green(colorPalette[3]) )), //Green
           floor( random(blue(colorPalette[2]), blue(colorPalette[3]) )), //Blue
           floor( map(velocity.y, 0, maxVelocity, 128, 256)) //alpha
         );
         
         println("colors:"+fillColor+", "+borderColor+", velocity:"+velocity.mag()+"["+maxVelocity+"]");
         
         stroke(borderColor);
         strokeWeight(int(random(1, 10)));
         fill(fillColor);
      
         //draw ellipses
         int numEllipses = ceil(map(velocity.mag(), 0, maxVelocity, 1, 10));
         int dispersion = ceil(map(velocity.mag(), 0, maxVelocity, 5, 100));
         for(int i =0; i< numEllipses; i++){
           ellipse(mouseX+random(-dispersion,dispersion), mouseY-random(-dispersion,dispersion), size, size);
         }
      }
  }
}
