
PShape s;
float ScreenMove = 0.0;


void setup(){
size(500, 500);
s = loadShape("barbell.svg");
smooth();
}


void draw(){
   frameRate(15);
   background(42, 32, 90);
   noStroke();
   smooth();
   fill(255);


   float rand;
   
   float my = map(mouseY, 0, height, 0, 255); // adjust range of my to controll amplitude variations
   float mx = map(mouseX, 0, width, 0, 100);
   randomSeed(int(6));

   int NumDots = 50; // EDITABLE number of dots on screen (density)
   //float dotW = width / (NumDots * 2); // TWEAKABLE sets size of dot in relateion to number of dots on screen
   //float dotH = dotW * 0.5; // TWEAKABLE relationship of dot width to height
   float spacing = (width + 200)/NumDots; // EDITABLE space between dots
   float AngleBegin = PI + ScreenMove;
   float angle = AngleBegin; // EDITABLE starting position of sine curve - ScreenMove is part of the program to see the next frame of the pattern using left and right arrow keys - if this is changed, also change angle reset in second for structure
   float AngleInc = 2 * PI / NumDots; // NOT EDITABLE cycles 4PI/3 (one bay) per display window where the whole cycle is 4PI

   float VerticleSpacing = spacing/2; // TWEAKABLE sets the spacing between verticle lines (if set to spacing the space between dots is uniform horizontally and vertically or it can be divided by 1.5 or 2 to make it smaller)
   float VerticleOffset = PI / 55; //EDITABLE if you want a phase shift from line to line

   float AmplitudeMin = 0.0; // EDITABLE min amplitude of sine curve - put my in here
   float AmplitudeMax = 100.0; // EDITABLE max amplitude (top wave starts at min amplitude, moving down they increase linearly to maxamplitude)

   float offsetX;
   float offsetAngle;

   float RotateStartAngle = PI/4; // EDITABLE start angle of the rotation - put mx in here

   float ScaledMin = 0.3;//EDITABLE scale minimum
   float ScaledMax = 2.5;//EDITABLE scale maximum
   
   float det = 4000.0;//Screen Move

   for(float i = 0; i < 2 * height; i += VerticleSpacing){ // verticle for structure
   
   
     for(float x = 0; x < (width+200); x += spacing){ // horizontal for structure

       if((i% (2*(VerticleSpacing)) == 0) || (i == -10)){// this block does the checkerboard placement along with the block after the sine curve
         offsetAngle = angle + (AngleInc/2);
       } else{
         offsetAngle = angle;
       }

       float y = i + sin(offsetAngle) * AmplitudeMin; // THE SINE CURVE

       if((i% (2*(VerticleSpacing)) == 0) || (i == -10)){// this block does the checkerboard placement along with the block before the sine curve
         offsetX = x + (spacing/2);
       } else{
         offsetX = x;
       }
float colors = map(ScaledMin, 0.3, 2, 0, 300);
       
       s.disableStyle();
       pushMatrix();
       fill(colors, 100+mx, my);
       translate(offsetX, y);
       rotate((angle/2) + RotateStartAngle); // rotates once all around on full cycle (could be twice or once on full cycle by adding or deleting /2 inside (angle))
       scale(ScaledMin);
       
       rand = random(0, 99);
       if(rand < mx){
         
       shape(s, 0, 0);
         //ellipse(0, 0, dotW, dotH);
       
     }
       popMatrix();
       
       //changes per horizontal for structure
       angle += AngleInc;
       }
     //changes per verticle for structure
     angle = AngleBegin;
     AngleBegin += VerticleOffset; // if angle is edited above, change this also in order to keep controll of second for structure
     AmplitudeMin += AmplitudeMax / ((2 * height + 0) / VerticleSpacing);// the 0 added is if the verticle for structure starts before zero ex: -10, you would need to replace this with +10
     ScaledMin += ScaledMax / ((2 * height + 0) / VerticleSpacing);// the 0 added is if the verticle for structure starts before zero ex:  -10, you would need to replace this with +10 
     ScreenMove -= 1 * PI / det;
   }

}//END VOID DRAW

