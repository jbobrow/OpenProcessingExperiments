
/*Hi ...this is one of the very first creativity by a beginner(me)..

Using the concept of Image sequencing and multiple audio players concept i have created a basic animation of a basketball

player ready for a shootout...Keep your Mouse Pressed until you see the player successfully shoots the ball to the basket...


Let the basketball fever reign...*/


/*to run this in java mode you have to add MaximJava_api an change the mode to java*/



    int numFrames = 10; // The number of animation frames used in this context
    int frame = 0; // The 'frame' holds the frame to be displayed
    PImage[] images = new PImage[numFrames];// Image array to store the images
    boolean p=false;//a boolean used to check pressed or not


    Maxim maxim;
    AudioPlayer player1,player2;
    
    
    void setup() {
          size(800, 460);
          frameRate(4); // Maximum 4 frames per second
          
          
          images[0] = loadImage("bb1.gif");
          images[1] = loadImage("bb2.gif");
          images[2] = loadImage("bb3.gif");
          images[3] = loadImage("bb4.gif");   //Images loaded into array
          images[4] = loadImage("bb5.gif");
          images[5] = loadImage("bb6.gif");
          images[6] = loadImage("bb7.gif");
          images[7] = loadImage("bb8.gif");
          images[8] = loadImage("bb9.gif");
          images[9] = loadImage("bb91.gif");
           
           
          maxim=new Maxim(this);
          player1 = maxim.loadFile("118428__alexy621__basket-ball-loop.wav");
          player2=  maxim.loadFile("yells.wav");
          player1.setLooping(true);
          player2.setLooping(true); 
         
  
     }

     void draw() {
         if(!p)
           {
             player2.stop();
             frame++;
             if(frame==4)
                  frame=0;
             image(images[frame],0,0);
             player1.play();
           }
 
          if(mousePressed)
           {
              p=true;
              player1.stop();
              player2.play();
              frame++;
              if(frame==10)
                 {
                    p=false;
                    frame=0;
                    frame++;
                    if(frame==4)
                        frame=0;
                    image(images[frame],0,0);
                    player2.stop();
                  }
              image(images[frame],0,0);
       
           }
   }


