
/**
 * Endangered. Processing 2.2.1
 * This project is a visual exploration of what it means to face extinction.
 * The intent is to explore a sense of subtracting from a subject rather than adding onto 
 * a drawing. Although the result still feels additive, the sharpness of the shapes gives
 * a sense of tension and destruction.
 * This project is dedicated to the African Elephant.
 * 2014 Carol Chung
 * CC BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/4.0/
 */

/* @pjs preload="mystic_bgd.jpg"; */

//Maxim maxim;
//AudioPlayer player;

void setup() {
    size(750, 750);

    PImage img;  
    img = loadImage("mystic_bgd.jpg");
    background(img);

    frameRate(4);

    /*
    maxim = new Maxim(this);
    player = maxim.loadFile("Crimson_Brain_Mahishasuramardini.wav");
    player.setLooping(true);
    player.volume(0.65);
    */
}

void draw() {
    float STAR_X = mouseX;
    float STAR_Y = mouseY;
    float STAR_R1 = 10; //10
    float STAR_R2 = 85; //80
    int NUM_POINTS = 7;
    
    float alpha = map(dist(width/2, height/2, mouseX, mouseY), 0, 350, 200, 0);
    //player.volume(map(mouseX, 0, width, 0.35 * 0.65, 1.5 * 0.65));
    //player.speed(map(mouseY, 0, height, 0, 2));

    if (mousePressed) {
        //player.play();    
        
        for (int i = 0; i < 11; i++) { 
            float rand_star_x = random(STAR_X - 150, STAR_X + 150);
            float rand_star_y = random(STAR_Y - 150, STAR_Y + 150);
            float rand_r1 = random(STAR_R1 - 25, STAR_R1 + 5);
            float rand_r2 = random(STAR_R2 - 30, STAR_R1 + 30);  
            int rand_num_points = int(random(5, 9));      
            
            //black fill and stroke colors to explore visual idea of extinction
            fill(0, alpha);
            stroke(0, alpha);
            
            star(rand_star_x, rand_star_y, rand_r1, rand_r2, rand_num_points);     
        }
    }   
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  //fill(255);
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

/*
void run() {
    
}
*/

/* reference
   https://www.processing.org/reference/background_.html
   https://www.processing.org/reference/map_.html
   https://www.processing.org/examples/mousepress.html
   https://www.processing.org/examples/star.html
   http://www.rapidtables.com/web/color/RGB_Color.htm
   
   credits
   https://soundcloud.com/crimsonbrain/mahishasuramardini
*/


