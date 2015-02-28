
int radius;
float angle;

void setup() {  //setup function called initially, only once
    size(600,600); //set up the screen size
    radius = width/2;
    ellipse(radius, radius, width, height);  //ellipse formula: ellipse (width/2, height/2, width, height) 
                                                //but since we declare radius = width/2, we substituted radius 
                                               //for width/2. We can also substitute radius for height/2 coz                           
                                               //its a circle
    strokeWeight(5);            //changes the width of the stroke, makes it more wider stroke
    frameRate(120);                //makes the stroke frames go faster.
    stroke(random(255), random(255), random(255)); //random color
    angle = 0.0;                                           
    }
    
void draw() {
    line( radius, radius, radius+radius*cos(angle), radius+radius*sin(angle)); //draw a line: line(width/2,     
                                                                              //height/2, width, height/2)
    angle = angle + 0.01; //make the line move by 0.01                                                                          
    if (angle>= 6.28) {                //if the angle is less than or equal to 2pie(6.28),
        angle = 0.0;                  // then the angle is 0.0
        stroke(random(255), random(255), random(255));    //change the color every time angle is 0.0
        }
}
