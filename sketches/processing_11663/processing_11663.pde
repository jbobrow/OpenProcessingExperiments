

int steps = 80;
int arms = 8;
int ellipsesize = 30;

void setup(){
    size(600,600,P3D);  //P3D allows the 3d rendering
    background(255);
    smooth();

}

void draw(){
    background(255);
    translate(300,300); // move the world
    rotateX(QUARTER_PI); //rotate at 90degrees

fill(0);
   for (int j=0;j<arms;j++){
   rotateZ((mouseX-300)*0.01); // rotation in radians  
   rotateX((mouseX-300)*0.01); // rotation in radians   
   pushMatrix(); // save our current transform
    for (int i=0; i<steps; i++){ // one arm
    fill(i*20,i*40,0,50);
    noStroke();
    //rect(0,0,ellipsesize,ellipsesize);
    box(ellipsesize);
    translate(20,10); // shift over by 20 x 0 y
    rotateY((mouseY-300)*0.01); // rotation in radians
    scale(0.92);
    }
    popMatrix();
    rotate(TWO_PI/arms); // rotate for the next arm
    }




}

