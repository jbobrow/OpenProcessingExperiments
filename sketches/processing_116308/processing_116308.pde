
float X,Y;
float Cx=0, Cy=200;
float Angle = 0;
float AngleA = 0;
float R = 100;
int c = 0;


void setup(){
   size(400,400);
   colorMode(HSB,100);
   background(10);
   frameRate(10);
}


void draw(){

   fade();

////////////////////////change 10
   Angle = Angle + 10;


   X = Cx + ( R * cos(radians(Angle)) );
   Y = Cy + ( R * -sin(radians(Angle)) );

////////////////////////change color
   if(c >= 99){
      c = 0;
   }
   
   c = c + 3;
   noStroke();
   fill(c,99,99);
   
////////////////////////ellipse
   rectMode(CENTER);
   for(int i = 0; i < 3; i++){
  ellipse(X+100*i*2, Y, 10, 10);
}
   
   
////////////////////////change 10
   AngleA = AngleA - 10;

   X = Cx - ( R * cos(radians(Angle)) );
   Y = Cy - ( R * -sin(radians(Angle)) );
   
   
////////////////////////change color
   if(c >= 99){
      c = 0;
   }

   c = c + 3;
   noStroke();
   fill(c,99,99);
   
////////////////////////ellipse
   rectMode(CENTER);
   for(int i = 0; i < 3; i++){
  ellipse(X+100*i*2, Y, 10, 10);
}
   
   
 
}

////////////////////////reset
void fade(){
   noStroke();
   fill(99,30);
   rectMode(CORNER);
   rect(0, 0, 400, 400);
}


