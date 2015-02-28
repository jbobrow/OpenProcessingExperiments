
Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

boolean square1Playing = false;
boolean square2Playing = false;
boolean square3Playing = false;
boolean square4Playing = false;

void setup()
{

size(600, 600);
 
  strokeWeight(3);
stroke(3);
fill(200, 0, 255);
rect(0, 0, 300, 300);

fill(200, 0, 255);
rect(300, 0, 300, 300);

fill(200, 0, 255);
rect(0, 300, 300, 300);

fill(200, 0, 255);
rect(300, 300, 300, 300);

  maxim = new Maxim(this);
  player1 = maxim.loadFile("Beat.wav");
  player1.setLooping(true);
  player2 = maxim.loadFile("Spacey synth.wav");
  player2.setLooping(true); 
  player3 = maxim.loadFile("Ambient vocal.wav");
  player3.setLooping(true); 
  player4 = maxim.loadFile("Wah.wav");
  player4.setLooping(true); 
  
  
   frameRate(4);
  
 }

void draw()

{

  
    if(square1Playing)
{
  fill(random(255), random(255), random(255));
rect(0, 0, 300, 300);


    player1.play();
  } 
  else {

    player1.stop();
  }


    if(square2Playing)
{

fill(random(255), random(255), random(255));
rect(300, 0, 300, 300);

 player2.play();
  } 
  else {

    player2.stop();
  }



    if(square3Playing)
{
fill(random(255), random(255), random(255));
rect(0, 300, 300, 300);

 player3.play();
  } 
  else {

    player3.stop();
  }


    if(square4Playing)
{

fill(random(255), random(255), random(255));
rect(300, 300, 300, 300);

 player4.play();
  } 
  else {

    player4.stop();
  }

}

void mouseClicked()
{

   if(mouseX < width/2 && mouseY < height/2)
{      
  square1Playing = !square1Playing;
}

if(mouseX > width/2 && mouseY < height/2)
{
  square2Playing = !square2Playing;
}

if(mouseX < width/2 && mouseY > height/2)
{
  square3Playing = !square3Playing;
}

if(mouseX > width/2 && mouseY > height/2)
{
  square4Playing = !square4Playing;
}

}


