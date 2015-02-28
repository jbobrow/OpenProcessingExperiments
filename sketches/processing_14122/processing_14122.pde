
/**
This draws Blob. Blob is an unholy creature, summoned by an evil wizard.
(He mainly consists of a ball with eyes)
Blob will stay in his place and might get angry by chance
if you click in his territory!
You are not supposed to keep your mouse pressed.
It's not a nice thing to do.
*/


//setting up values for the eyebrows
int ebinner=85;
int ebouter=85;

//Lets begin to draw this thing!
void setup() {
  size(200,200);
  background(255);
  smooth();
}


void draw(){

  background(255);
  
  //Blob
  fill(255,0,0);
  ellipse(100,100,50,50);

  //Blobs left eye
  fill(255);
  ellipse(90,95,10,10);

  //Blobs right eye
  fill(255);
  ellipse(110,95,10,10);

  /*
  Blobs left pupil, moves with mouse,
  but not as far as the mouse (mouse/40)
  */
  fill(0);
  ellipse(88+mouseX/40,93+mouseY/40,5,5);

  //Blobs right pupil, same as with the left one
  fill(0);
  ellipse(108+mouseX/40,93+mouseY/40,5,5);

  //Blobs mouth
  line(95,110,105,110);

  //Blobs left eyebrow
  line(85,ebouter,95,ebinner);
  
  //Blobs right eyebrow
  line(105,ebinner,115,ebouter);


    if(mousePressed==true){
  
      if(ebinner==85)
      {ebinner=88;}
      else if(ebinner==88)
      {ebinner=85;}
    }

  }
                
