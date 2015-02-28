
import processing.video.*;

Movie [] movies = new Movie[20];

int card;

//Movie annakarina;
//Movie cabiria;
//Movie elevator;
//Movie gena;
//Movie jeanne;
//Movie manhattan;
//Movie ottomezzo1;
//Movie ottomezzo2;
//Movie persona;
//Movie seven;
//Movie death2;

PFont times;

void setup()
{
  noStroke();
  smooth();
  size(720, 540);
  //  background(255);
  textAlign(CENTER);

  movies= new Movie[20];
  movies[0]= new Movie(this, "annakarina2.mov");
  movies[1]= new Movie(this, "cabiria2.mov");
  movies[2]=new Movie(this, "elevator2.mov");
  movies[3]=new Movie(this, "gena2.mov");
  movies[4]=new Movie(this, "jeanne2.mov");
  movies[5]=new Movie(this, "manhattan2.mov");
  movies[6]=new Movie(this, "ottomezzo1_2.mov");
  movies[7]=new Movie(this, "ottomezzo2_2.mov");
  movies[8]=new Movie(this, "persona2.mov");
  movies[9]=new Movie(this, "seven2.mov");
  movies[10]= new Movie(this, "d1.mov");
  movies[11]= new Movie(this, "d2.mov");
  movies[12]= new Movie(this, "d3.mov");
  movies[13]= new Movie(this, "d4.mov");
  movies[14]= new Movie(this, "d5.mov");
  movies[15]= new Movie(this, "d6.mov");
  movies[16]= new Movie(this, "d7.mov");
  movies[17]= new Movie(this, "d8.mov");
  movies[18]= new Movie(this, "d9.mov");
  movies[19]= new Movie(this, "death2_.mov");

  times = loadFont("Times-BoldItalic-48.vlw");
  textFont(times);



  colorMode(RGB);


  card = 1;

  float mr = int(random(0, 10));
  int mr2 = int(mr);

  float dr = int(random(11, 20));
  int dr2 = int(dr);
}

void movieEvent(Movie movies)
{
  movies.read();
}






void draw()
{ 

  image(movies[0], 0, 0);
  image(movies[1], 0, 0);
  image(movies[2], 0, 0);
  image(movies[3], 0, 0);
  image(movies[4], 0, 0);
  image(movies[5], 0, 0);
  image(movies[6], 0, 0);
  image(movies[7], 0, 0);
  image(movies[8], 0, 0);
  image(movies[9], 0, 0);
  image(movies[10], 0, 0);
  image(movies[11], 0, 0);
  image(movies[12], 0, 0);
  image(movies[13], 0, 0);
  image(movies[14], 0, 0);
  image(movies[15], 0, 0);
  image(movies[16], 0, 0);
  image(movies[17], 0, 0);
  image(movies[18], 0, 0);
  image(movies[19], 0, 0);


  float mr = int(random(0, 10));
  int mr2 = int(mr);

  float dr = int(random(11, 20));
  int dr2 = int(dr);








  //card 1
  if (card==1)
  { 
    movies[10].loop();
    movies[10].play();
    textSize(48);
    text("death has confronted you", width/2, height/2);
    textSize(18);
    text("hover over the x's", width/7, height*.75);

    stroke(255);
    line(0, 0, 160, 120);
    line(0, 120, 160, 0);
    line(0, 540, 160, 420);
    line(0, 420, 160, 540);

    if (millis()>2000)
    {
      movies[6].read();
      image(movies[6], 0, 0, movies[6].width/2, movies[6].height/2);
      movies[6].pause();

      if (mouseX>0 && mouseX<width/3
        && mouseY<height/3 && mouseY>0)
      { 
        movies[6].play();
        if (mousePressed)
        {
          card=2;
        }
      }


      movies[9].read();

      image(movies[9], 0, height*2/3, movies[9].width/2, movies[9].height/2);
      movies[9].pause();


      if (mouseX>0 && mouseX<width/3
        && mouseY<height && mouseY>height*2/3)
      {
        movies[9].play();
        if (mousePressed)
        {
          card=5;
        }
      }
    }
  } 


  //card 2
  if (card == 2)
  {
        movies[12].loop();
    movies[12].play();

         stroke(255);
    line(0, 180, 160, 300);
    line(0, 300, 160, 180);
    line(0, 540, 160, 420);
    line(0, 420, 160, 540);
    
//        textSize(18);
//    text("hover", width/4, height/2);

    movies[1].read();
    image(movies[1], 0, height/3, movies[1].width/2, movies[1].height/2);
    movies[1].pause();
    
    
    if (mouseX>0 && mouseX<width/3
      && mouseY>height/3 && mouseY<height*2/3)
    { 
      movies[1].play();
      if (mousePressed)
      {
        card=3;
      }
    }

    movies[3].read();

    image(movies[3], 0, height*2/3, movies[3].width/2, movies[3].height/2);
    movies[3].pause();
    
    
    if (mouseX>0 && mouseX<width/3
      && mouseY<height && mouseY>height*2/3)
    {
      movies[3].play();
      if (mousePressed)
      {
        card=5;
      }
    }

  }
  
  
  
 //card=3
  if (card==3)
  {
        movies[14].loop();
    movies[14].play();

         stroke(255);
    line(240, 420, 400, 540);
    line(240, 540, 400, 420);
    line(0, 540, 160, 420);
    line(0, 420, 160, 540);

    movies[0].read();
    image(movies[0], width/3, height*2/3, movies[1].width/2, movies[0].height/2);
    movies[0].pause();
    
    
    if (mouseX>width/3 && mouseX<width*2/3
      && mouseY<height && mouseY>height*2/3)
    { 
      movies[0].play();
      if (mousePressed)
      {
        card=4;
      }
    }

    movies[2].read();

    image(movies[2], 0, height*2/3, movies[2].width/2, movies[2].height/2);
    movies[2].pause();
    
    
    if (mouseX>0 && mouseX<width/3
      && mouseY<height && mouseY>height*2/3)
    {
      movies[2].play();
      if (mousePressed)
      {
        card=5;
      }
    }

  } 
  
  
  
  //card 4 
  if (card==4)
  {
            movies[15].loop();
    movies[15].play();

         stroke(255);
    line(0, 0, 160, 120);
    line(0, 120, 160, 0);
    line(0, 540, 160, 420);
    line(0, 420, 160, 540);

    movies[7].read();
    image(movies[7], 0, 0, movies[7].width/2, movies[7].height/2);
    movies[7].pause();
    
    
    if (mouseX>0 && mouseX<width/3
      && mouseY<height/3 && mouseY>0)
    { 
      movies[7].play();
      if (mousePressed)
      {
        card=5;
      }
    }

    movies[5].read();

    image(movies[5], 0, height*2/3, movies[5].width/2, movies[5].height/2);
    movies[5].pause();
    
    
    if (mouseX>0 && mouseX<width/3
      && mouseY<height && mouseY>height*2/3)
    {
      movies[5].play();
      if (mousePressed)
      {
        card=5;
      }
    }
  }
  


  if (card==5)
  {  
    noStroke();
    movies[18].loop();
    movies[18].play();

    movies[4].read();
    image(movies[4], 0, height*2/3, movies[4].width/2, movies[4].height/2);
    movies[4].play();
    textSize(48);
    text("la morte!", width/4, height*.6);
  }


}


