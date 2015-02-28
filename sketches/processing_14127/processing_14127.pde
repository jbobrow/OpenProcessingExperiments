
//setting up values
int ebinner=0;
int blobr=0;
int blobg=0;
int blobb=250;
color colour=color(255,0,0);


//A Basic setup
void setup() {
  size(200,200);
  background(255);
  smooth();
}

//Defining a function "blob"
  void blob(int x, int y, color c, int r, float s)
  {
    int blobx=x;
    int bloby=y;
    color col=c;
    int rot=r;
    float big=s;

    background(255);
    
    translate(blobx,bloby);//controls the position
    rotate(radians(rot));//controls the rotation
    scale(big);//controls the size
  
    //Blobs "Body"
    fill (col);
    ellipse(0,0,50,50);

    //Blobs left eye
    fill(255);
    ellipse(-10,-5,10,10);
  
    //Blobs right eye
    fill(255);
    ellipse(10,-5,10,10);
  
    /*
    Blobs left pupil, moves with mouse,
    but not as far as the mouse (mouse/40)
    */
    fill(0);
    ellipse(-12+mouseX/40,-7+mouseY/40,5,5);
  
     //Blobs right pupil, same as with the left one
    fill(0);
    ellipse(8+mouseX/40,-7+mouseY/40,5,5);

    //Blobs mouth
    line(-5,+10,+5,+10);
  
    //Blobs left eyebrow
    line(-15,-15,-5,-15+ebinner);
  
    //Blobs right eyebrow
    line(+5,-15+ebinner,+15,-15);
 
    }
 
     void mousePressed() {

        if(ebinner==0)//if not angry
        {ebinner=3;}//-->get angry
        else if(ebinner==3)//if angry
        {ebinner=0;}//-->get not angry
      }
      
 //call the "blob" function 

void draw(){
  blob(100, 100, colour, 0, 1.2);//Position X&Y, color, rotation, size multiplicator
}

                                
