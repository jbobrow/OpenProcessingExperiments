
int counter;
int counter2;
int oldcounter;
int oldcounter2;
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  counter = 250;
  counter2 = 250;  
  oldcounter = 250;
  oldcounter2 = 250;
}

void draw() {  //draw function loops 
  counter=oldcounter+random(20)-10;
  counter2=oldcounter2+random(20)-10;
  line (oldcounter,oldcounter2,counter,counter2);
  oldcounter=counter;
  oldcounter2=counter2;
  
  
  
}
