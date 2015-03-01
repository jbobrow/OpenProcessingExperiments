
/*line repetition composition from a random point of origin*/

size(400,400); //set stage
background(50,50,50); //set background color. percentage of black

/*line variables*/
float pointAx = random(100,250);//assign random stationary x at center
float pointAy = random(100,300);//assign random stationary y at center
float pointBx = random(0,400);//random line x end outside of center
float pointBy = random(0,400);//random line y end outside of center
float weight = 2; //initializing weight for loop

/*color settings*/
colorMode( HSB ); //HSB rather than RGB
float overallColor = random (0,2);
float h, s, b, a; //declaring variables for stroke color changes
h = 100; //default hue
s = 200; //default saturation
b = 255; //default brightness
a = 255; //default alpha

//drawing the lines in varying colors and stroke widths
for ( int i = 1 ; i < 400 ; i = i+1 ){ //outside loop for line repeat
  weight = random(1,4); //weight variable
  strokeWeight (weight); //change line weight every loop
  
  if (overallColor <= 1){//based of random color set variable at beginning, two color sets of possibilities
    h = random (0,90); //small hue variety at random
  }else{
    h = random (120,220);
  }
  
  if (weight >= 2) { //lower opacity on the thicker lines
    a = 100; //less than 50%
  }
  stroke (h,s,b,a); //set stroke color and weight
  
  pointBx = random(-100,550); //point B is random and allowed outside the frame
  pointBy = random(-100,550); //point B is random and allowed outside the frame
  line( pointAx, pointAy, pointBx, pointBy ); //draw line with new color and new ending point
}

//box overlying
noFill (); 
strokeWeight (1); //thin outline only
stroke (50,10,255); //white stroke
rect (100,100,200,200); //rectangle fitting to the bounds of where the orgin can go


