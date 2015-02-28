
PFont font;
int time=0;
int score=0;

PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

int timer=11;
int timeLast = 0;

void setup()
{
  size(800, 577);
  frameRate(20);

  img  = loadImage ("space.jpg");
  img1 = loadImage ("nyan.png");
  img2 = loadImage ("kitty.png");
  img3 = loadImage ("cat.png");
  img4 = loadImage ("kitten.png");




  timeLast=second(); 


  font = loadFont("ForteMT-48.vlw");
  textFont(font, 50);

  background(img);
}

void draw() {






  fill(0);  
  ellipse(360,190,100,100);
  ellipse(600, 290, 100, 100);
  fill(255);

if (timer>0) { 
    game();
  }
}


  




    void game() {   





      if (second()!=timeLast)

      {        


        timeLast=second();

        img=loadImage("space.jpg");

        timer-=1;
      }


      {
        text("SCORE: "+score, 150, 200);

        text("TiME LEFT 4 CATZ: "+timer, 150, 300);
      }


{
    if (timer == 0) {   //     check if time is up
      if (score < 100) {  //  failed to attain 40 on time
        font = loadFont("Dialog.bold-72.vlw"); 
        fill(255, 0, 0);
        textFont(font); 
        text("FAIL", 20, 60); 
             }
             
      else {   //   otherwise,  it means final score >= 40
        font = loadFont("Dialog.bold-72.vlw"); 
        textFont(font); 
        fill(0, 255, 0);
        text("WIN", 20, 60);         
      }
    }
}



      if (keyPressed==true) {
        {
          if (key=='x' || key =='X') {        
            score+=1; 
            image(img1, random(800), random(577));
          }






          {
            if (keyPressed==true) {
              if (key=='c' || key =='C') {
                score+=1; 
                image(img2, random(800), random(577));
              }



              {
                if (keyPressed) {
                  {
                    if (key=='v' || key == 'V') {
                      score+=1; 
                      image(img3, random(800), random(577));
                    }




                    if (keyPressed) {
                      if (key=='b' || key =='B') {
                        score+=1; 
                        image(img4, random(800), random(577));
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }








