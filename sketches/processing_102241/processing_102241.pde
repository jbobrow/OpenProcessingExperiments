
Maxim maxim;
AudioPlayer player1,player2,player3,player4,player5,player6,player7,player8;
AudioPlayer beat1, beat2;
//PLabel labelb1;
PImage score;

float margin,platos;  //global variables
float ratio; //A ratio used to vary volume of sound
float pl_a, x;    //platos= final width for each rectangle, pl_a= width of the screen divided by 8, margin= 5% of pl_a
boolean playit1=false;
boolean playit2=false;
float pow1, pow2;

float ax=0;   //variables used in animations
float ay=0;

void setup()
{
  size (1024,768);
  background(0);
  
  maxim = new Maxim(this);
  player1 = maxim.loadFile("do.wav");
  player1.setLooping(false);
  player2 = maxim.loadFile("re.wav");
  player2.setLooping(false);
  player3 = maxim.loadFile("mi.wav");
  player3.setLooping(false);
  player4 = maxim.loadFile("fa.wav");
  player4.setLooping(false);
  player5 = maxim.loadFile("sol.wav");
  player5.setLooping(false);
  player6 = maxim.loadFile("la.wav");
  player6.setLooping(false);
  player7 = maxim.loadFile("si.wav");
  player7.setLooping(false);
  player8 = maxim.loadFile("do8.wav");
  player8.setLooping(false);
  beat1=maxim.loadFile("mybeat.wav");
  beat1.setAnalysing(true);
  beat1.setLooping(true);
  beat2=maxim.loadFile("beat2.wav");
  beat2.setAnalysing(true);
  beat2.setLooping(true);
  
   
  
}

void draw()
{
 background(0);
 strokeWeight(5);
 stroke(0);
 
  fill(0,255,100);
  rect(width/3,0,width/3,height/4,10);
  rect(width/3,height/4,width/3,height/4,10);
 
 score=loadImage("empty.png");
  image(score, width-width/3,0);


//The piano - drawing
 pl_a=width/8;
 margin=pl_a*0.05;
 platos=pl_a-margin;
 x=margin;
 fill(255);
 for (int i=0;i<=7;i=i+1)
 {
   rect(x, height/2, platos, (height/2)-margin, 10);
   x=x+platos+margin;  //Leaves a small gap between rectangles, adjusted to screen size
 }


//Mapping key pressed and playing sounds 
int pos;  //Integer between 1 and 8 showing the exact position over rectangles
println(margin);
  // Mapping position in screen with numbers 1-8
if (mouseY>=height/2) 
{
  //pos=map(mouseX,  ,  ,1,8);
  if ((mouseX>=margin) && (mouseX<=margin+platos)) 
      {pos=1;
       println(pos);
       player1.volume(ratio);
       player1.play();
       score=loadImage("do.png");
       image(score, width-width/3,0);} 
   else if ((mouseX>2*margin+platos) && (mouseX<=2*margin+2*platos)) 
        {pos=2;
         println(pos);
         player2.volume(ratio);
         player2.play();
         score=loadImage("re.png");
         image(score, width-width/3,0);}
     else if ((mouseX>3*margin+2*platos) && (mouseX<=3*margin+3*platos)) 
          {pos=3;
           println(pos);
           player3.volume(ratio); 
           player3.play(); 
           score=loadImage("mi.png");
           image(score, width-width/3,0);}
       else if ((mouseX>4*margin+3*platos) && (mouseX<=4*margin+4*platos)) 
            {pos=4;
             println(pos);
             player4.volume(ratio);  
             player4.play();
             score=loadImage("fa.png");
             image(score, width-width/3,0);}
         else if ((mouseX>5*margin+4*platos) && (mouseX<=5*margin+5*platos)) 
               {pos=5;
             println(pos);
             player5.volume(ratio);
             player5.play();
             score=loadImage("sol.png");
             image(score, width-width/3,0);}
            else if ((mouseX>6*margin+5*platos) && (mouseX<=6*margin+6*platos)) 
                  {pos=6;
                println(pos);
                player6.volume(ratio);
                player6.play();
                score=loadImage("la.png");
                image(score, width-width/3,0);}
               else if ((mouseX>7*margin+6*platos) && (mouseX<=7*margin+7*platos)) 
                     {pos=7;
                   println(pos);
                   player7.volume(ratio);
                   player7.play();
                   score=loadImage("si.png");
                   image(score, width-width/3,0);}
                  else if ((mouseX>8*margin+7*platos) && (mouseX<=8*margin+8*platos))
                        {pos=8;
                      println(pos);
                      player8.volume(ratio);
                      player8.play();
                      score=loadImage("do8.png");
                      image(score, width-width/3,0);}
  
} 
//Adjusting volume for rhythm
 beat1.volume(ratio);
 beat2.volume(ratio);
 
 //Calculating ratio for volume slider
 if ((float)mouseX<=(float)(width/3) && (mouseY<(height/2)))
 {
  ratio = (float) mouseX / (float) (width/3);
  //ratio *= 10;
  //println(ratio);
  }
 
  //volume slider
 fill(ratio*255);
 rect(0,0,width/3,height/2,10);
 
 //Rhythm1 button
 pow1=beat1.getAveragePower();
 fill(0,2*pow1*255,0);
 rect(width/3,0,2*pow1*width/3,height/4,10);
 
 //Rhythm2 button
 pow2=beat2.getAveragePower();
 fill(0,2*pow2*255,0);
 rect(width/3,height/4,2*pow2*width/3,height/4,10);
 
 //button animations
strokeWeight(10);
stroke(255,0,0);
pushMatrix();
translate(0,height/4);
ay = ratio * 100 * sin(100*ax);
ax = ax+5;
point(ax,ay);
if (ax>(width/3)-margin)
{
 ax=margin;
}
popMatrix();
}



void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{

   if ((mouseX>width/3) && (mouseX<(width-width/3)) && (mouseY<height/4))
   {
      playit1 = !playit1;
      println(playit1);
    
       if (playit1) {
            beat1.play(); 
 
       } else {
     
        beat1.stop(); 
      
       }
  
   
  }
  if ((mouseX>width/3) && (mouseX<(width-width/3)) && (mouseY>height/4) && (mouseY<height/2))
   {
      playit2 = !playit2;
      println(playit2);
    
       if (playit2) {
            beat2.play(); 
 
       } else {
     
        beat2.stop(); 
      
       }
  
   
  }
}



void mouseReleased()
{
// code that happens when the mouse button
// is released
}



