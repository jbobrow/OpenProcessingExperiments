
import themidibus.*;
import java.util.Vector;


Vector growers; //growers is a vector
int savedTime;
int totalTime = 5000;

 
void setup(){
  size(500, 500);
  PImage bg = loadImage("background2.jpg");  //loading image to bark into a variable 
  image (bg, 0, 0);
  savedTime = millis();
  int c1 = 0x9DDBED;
  int c2 = 0xFFEEEEFF;
 // gradientBackground(c1, c2);
  growers = new Vector();
  smooth();
  //noLoop(0);
  
}
 
void draw(){
  
  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) {
     PImage bg = loadImage("background.gif");  //loading image to bark into a variable 
     PImage bg2 = loadImage("background2.gif");
     tint(255, 126);
     image (bg, 0, 0);
     image(bg2, 0, 0);
     savedTime = millis(); // Save the current time to restart the timer!
  }
      
  for (int i = 0; i < growers.size(); i++) {
    ((Grower)growers.get(i)).grow();
    ((Grower)growers.get(i)).display();

  }
}
 
void gradientBackground(int c1, int c2) { //clear screen except background.
        for (int i = 0; i <= width; i++) {
            for (int j = 0; j <= height; j++) {
                int c = color(
                        (red(c1) + (j) * ((red(c2) - red(c1)) / height)),
                        (green(c1) + (j) * ((green(c2) - green(c1)) / height)),
                        (blue(c1) + (j) * ((blue(c2) - blue(c1)) / height)));
                set(i, j, c);
            }
        }
        //draw background tree here.
    }
 
 
    public void mousePressed() {
        if (mouseButton == LEFT) { //when left button clicked, branch grows
        //    filter(BLUR, 1);
            growers.add(new Grower(228, 165, 15));
            growers.add(new Grower(235, 250, 20));
            growers.add(new Grower(250, 210, 20));
            growers.add(new Grower(270, 160, 12)); //grow branch points
            
        } else { //when right button clicked, ALL branches disappear.
            int c1 = 0x9DDBED; //adds background colour
            int c2 = 0xFFEEEEFF;
            PImage bg = loadImage("background.gif");  //loading image to bark into a variable 
            PImage bg2 = loadImage("background2.gif");
            tint(255, 100);
            image (bg, 0, 0);
            image(bg2, 0, 0);}
            
  //  } else { 
      //redraw(RIGHT+4);
          //  (int i= 0; i < 6; i = i+1)
        //   (int i = RIGHT) 
            
            //redraw();
        }
       
           //void mousePressed()   {
           //  (mouseButton == RIGHT + 4);
           // loop();
           // gradientBackground(c1, c2);
        
    
 
 
    public void keyPressed() {
        if (key == 'a') {
        }
        if (key == 'b') {
        }
    }
 
    class Grower {
 
        double x;
        double y;
        double lastxadjust;
        double lastyadjust;
        double size;
        double minimumsize;
        double sizecount;
        boolean dead;
        int branchchance;
 
        Grower(double x, double y, double size) {
            this.x = x;
            this.y = y;
            dead = false;
            this.size = size;
            lastxadjust = random(((float) -0.1), ((float) 0.1));
            lastyadjust = random(((float) -1.0), ((float) 0.0));
            minimumsize = (40 + (round(random(-20, 10))));
            sizecount = 0;
            branchchance = 15;
 
        }
 
        void grow() {
            if (!dead) { //dead kills growth of branch
                double lowerbound = lastxadjust - 0.1;
                double upperbound = lastxadjust + 0.1;
                double xadjuster = random(((float) lowerbound), ((float) upperbound));
                lowerbound = lastyadjust - 0.08;
                upperbound = lastyadjust + 0.08;
                double yadjuster = random(((float) lowerbound), ((float) upperbound));
                lastxadjust = xadjuster;
                lastyadjust = yadjuster;
                this.x = this.x + xadjuster;
                this.y = this.y + yadjuster;
                if (this.size > 1.5) {
                    this.size = this.size - 0.1; //make branch diameter -0.1
                    checkBranchChance(); //work out branch direction
                    branch(); //grow next piece of branch
                } else {
                    if (sizecount > minimumsize) {
                        dead = true;
                        placeFlower();
                    } else {
                        sizecount++;
                        checkBranchChance();
                    branch();
                    }
                }
            }
        }
 
        void checkBranchChance() {
            if (this.size < 3) {
                branchchance = 15;
            }
            if (this.size < 2.5) {
                branchchance = 20;
            }
            if (this.size < 2) {
                branchchance = 25;
            }
            if (this.size < 1.6) {
                branchchance = 50;
            }
 
 
        }
 
        void placeFlower() {
            float fmod1 = random(((float) -1), ((float) 1));
            float fmod2 = random(((float) -1), ((float) 1));
            fill(254, 131, 162);
            ellipse((float) x, (float) y, 5 + fmod1, 5 + fmod2);
          // fill(254, 197, 211, 200);       //petal colour
         // fill(random(255), random(255), 57, 200);
           fill(240, random(255), 57, 200);
            ellipse((float) x - 5, (float) y, 5 + fmod1, 5 + fmod2);
            ellipse((float) x + 5, (float) y, 5 + fmod1, 5 + fmod2);
            ellipse((float) x, (float) y - 5, 5 + fmod1, 5 + fmod2);
            ellipse((float) x, (float) y + 5, 5 + fmod1, 5 + fmod2);
        }
 
        void branch() {
            int chance = round(random(1000));
            if (chance < branchchance) {
                Grower temp = new Grower(x, y, size);
                growers.add(temp);
                temp.lastxadjust = this.lastxadjust;
                temp.lastyadjust = this.lastyadjust;
                temp.sizecount = this.sizecount;
 
            }
        }
 
        void display() {
            if(!dead){
            noStroke();
            //fill(255, 255, 255, 10);
            //ellipse((float)x,(float)y,(float)size+30,(float)size);
            fill(0);
          //
         //shadow
         ellipse((float) x-1, (float) y, (float) size+1 , (float) size);
            //  fill(0,0,0);
 
            //fill(67,88,103);
            //ellipse((float)x,(float)y,(float)size,(float)size);
            fill(89, 62, 36, 200);
            //fill(255, 0, 0);//89, 62, 36, 200

            //loadImage("barkcmall.jpg");
            //image (bark, x, y);
           // blendMode(MULTIPLY);
            ellipse((float) x, (float) y, (float) size, (float) size);
            }
        }
    }



