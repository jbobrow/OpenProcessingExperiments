
int step = 0;
int counter = 0;

void setup () {
size(800,600);

}

void draw() {

  counter = counter + 1;
  if (counter == 50) {
    step = 1;
  } else if (counter == 100) {
    step = 2;
  } else if (counter == 150) {
    step = 0;
    counter = 0;
  
  }



// left red light, right green
  if (step==0) {
   fill (255,0,0);
   ellipse(10,10,10,10);
   // send a letter to aruidno
   
  // both yellow - of course traffic lights don't really do this!
  } else if (step==1) {
   fill (0,255,0);
   ellipse(10,10,10,10);
      
  // left red light, right green
  } else if (step==2) {
   fill (0,0,255);
   ellipse(10,10,10,10);
  }
  
  
}
