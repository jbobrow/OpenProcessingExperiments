
import processing.video.*;
Movie movie;

void setup()
{
  size(480,800);
  
  movie= new Movie(this,"1.avi");
  movie.loop();
}

void movieEvent (Movie movie)
{
  movie.read();
}

void draw()
{
  image(movie,0,0);
}


