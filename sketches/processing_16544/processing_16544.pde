
//setting up values
int ebinner=0;
color colour=color(255,255,0);
blob[] BLOB=new blob[20];

//A Basic setup
void setup() {
  size(450,450);
  frameRate(30);
  smooth();
  for(int h=0;h<20;h++)
   {
    BLOB[h]=new blob(random(500),random(500), color(255,0,0), 0, 0.9, h, BLOB);//Position X&Y, color, rotation, size multiplicator
   }
}

void draw(){
  background(255);
  for(int i=0;i<20;i++)
  {
   BLOB[i].bump();
   BLOB[i].drawBlob();
   BLOB[i].move();
 }
 //println(BLOB[2].blobx);
}

void mousePressed()
  {
    if(ebinner==0)//if not angry
    {ebinner=3;}//-->get angry
    else if(ebinner==3)//if angry
    {ebinner=0;}//-->get not angry
  }

class blob
{
  float blobx;
  float bloby;
  color col;
  int rot;
  float big;
  float movex=random(10);
  float movey=random(10);
  blob[] part;
  int nr;

  
   blob(float x, float y, color c, int r, float s, int num, blob[] crash)
  {
    blobx=x;
    bloby=y;
    col=c;
    rot=r;
    big=s;
    part=crash;
    int nr=num;


   // background(255);
  } 
  
  void drawBlob()
  {
    pushMatrix();
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
    ellipse(-10+(mouseX/2-blobx/2)/100,-5+(mouseY/2-bloby/2)/100,5,5);
  
     //Blobs right pupil, same as with the left one
    fill(0);
    ellipse(10+(mouseX/2-blobx/2)/100,-5+(mouseY/2-bloby/2)/100,5,5);

    //Blobs mouth
    line(-5,10,5,+10);
  
    //Blobs left eyebrow
    line(-15,-15,-5,-15+ebinner);
  
    //Blobs right eyebrow
    line(5,-15+ebinner,15,-15);
    popMatrix();
 
    }
    
  void move()
  {
    blobx+=movex;
    bloby+=movey;
    
    if (blobx+25 > width) {
      blobx = width-25;
      movex*=-1; 
    }
    else if (blobx-25<0) 
    {
      blobx = 25;
      movex *= -1;
    }
    if (bloby+25>height)
    {
      bloby=height-25;
      movey*=-1; 
    } 
    else if (bloby-25<0)
    {
      bloby=25;
      movey*=-1;
    }

  }
  
  void bump()
  {
   for (int l=nr+1;l<20;l++) 
   {
      float dx=part[l].blobx-blobx;
      float dy=part[l].bloby-bloby;
      float dista=sqrt(dx*dx + dy*dy);
      if (dista<50)
      { 
        float angle=atan2(dy,dx);
        float targetX=blobx+cos(angle)*50;
        float targetY=bloby+sin(angle)*50;
        float ax=(targetX-part[l].blobx)*0.05;
        float ay=(targetY-part[l].bloby)*0.05;
        movex-=ax;
        movey-=ay;
        part[l].movex+=ax;
        part[l].movey+=ay;
      }
   }
  }
  
}
 

/*
Always remember: Big Blob is watching you(r mouse)!
Due to assignment restriction he will ALWAYS get angry if you click in his place, and you can ALWAYS calm him down with another click.
*/
 
