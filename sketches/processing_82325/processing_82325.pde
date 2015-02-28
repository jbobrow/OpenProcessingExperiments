
import processing.video.*;

Movie movie;
int videoScale=6;
int cols, rows;


void setup()
{
  size(320, 240, P2D);
  movie = new Movie(this, "cat.mov");
  movie.loop();

  cols=width/videoScale;
  rows=height/videoScale;
}

void movieEvent(Movie movie)
{
  if(movie.available()) movie.read();
}

void draw()
{
  background(0);
  //if(movie.available()) movie.read();
  
  
  if (movie.width>1)
  {
    
    int frame=(int)map(mouseX,0,width,2,7);
    if(frame==4)frame+=1;
    movie.jump(frame);
    for (int i=0;i<cols;i++)
    {
      for (int j=0;j<rows;j++)
      {
        int x=i*videoScale;
        int y=j*videoScale;
        
        color c;
        if(dist(mouseX,mouseY,x,y)<=videoScale+4)
        {
          int cc=(int)map(dist(mouseX,mouseY,x,y),0,videoScale+4,0,200);
          c=color(255-cc,255,0);
        }
        else c= movie.pixels[x+y*width];
        
        fill(c);
        stroke(0);
        ellipse(x, y, videoScale, videoScale);
      }
    }
  }
  //image(movie,0,0);
}


