
int diam = 10; //correct size
int counter = 0;

void setup(){
size(400, 400); 
background(200);
smooth();
}

//draw a circle
void draw(){

  
//create a counter, i didn't remember the coding for this on the test but now i understand how it works  
counter++;
if(counter > 10){ //speed of counter
counter = 0; //start the counter at 0 so there are no starting dots
float x = random(0,400); //keep inside frame
float y = random(0,400);
int extra = 0;
for(int i=0;i<3;i++){ 
ellipse(x + extra, y, diam, diam); //on test i put x and y + extra which tilted the dots, only x should be altered
extra+=10;
ellipseMode(CENTER); 
}
}
}


