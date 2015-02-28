
/*
 Ka Kit Cheong 
 Square Pattern V2
 01/29/2012
 */

// variables
float count = 24;
float step = count/2;
float theta = PI/count;

int gap = 10;
int rad = 240;

// setup
size(500, 500);
smooth();
background(195);
strokeWeight(0.5);
noFill();

// draw
ellipseMode(RADIUS);

//ellipse(width/2, height/2, 340, 340);
for (int i = 0; i <= count/2; i++) {
    if(i%2 == 0){
      stroke(255, 0, 0);
    } else{
      stroke(0, 0, 255);
    }
    ellipse(width/2+(rad*sin(theta*i*4)), gap+(rad-rad*cos(theta*i*4)), 350, 350);    
    quad(width/2+(rad*sin(theta*i)), gap+(rad-(rad*cos(theta*i))), width/2+(rad*sin(theta*(i+step))), gap+(rad-(rad*cos(theta*(i+step)))), width/2+(rad*sin(theta*(i+2*step))), gap+(rad-(rad*cos(theta*(i+2*step)))), width/2+(rad*sin(theta*(i+3*step))), gap+(rad-(rad*cos(theta*(i+3*step)))) );
}






