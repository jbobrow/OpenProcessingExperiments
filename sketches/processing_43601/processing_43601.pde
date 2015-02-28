
/*
Laurel Deel
Midterm Fall 2011
10-24-11
Lally
*/
// Sequence animation code from James Patterson

float x;
float y;
int s;
int half_size;
int speed;
int navi_x, navi_y, navi_speed;

String state = "play";




// HEY... LISTEN!!!
import ddf.minim.*;
 
Minim minim;
AudioSnippet song;
float lastCollision =0;





//These are for the circling circles
float bg_r = 15;
float bg_pos = 30;
float bg_r_theta = 0;
float bg_pos_theta =0;




//This is for navi
int numFrames = 4;
int frame = 0;
PImage[] images = new PImage[numFrames];




//Key
PImage token;




// our displayed level
PImage clearmaze;
boolean[][] collisionMap;
boolean hasKey = false;





void setup() {
  
           size(500, 500);
           background(255);
           imageMode(CENTER);
           smooth();
           frameRate(18);
           token = loadImage("token.png");
           
           
           //navi's frames
           images[0] = loadImage("navi_norm.png");
           images[1] = loadImage("navi_up_col.png");
           images[2] = loadImage("navi_norm.png");
           images[3] = loadImage("navi_down_col.png");
           
           
           //starting postion
           navi_x = 10;
           navi_y = 10;
           navi_speed = 5;
          
          
           //I'm not sure what these are for...
           s = 15;
           half_size = s / 2;
           
           
           //HEY... LISTEN!!!
           minim = new Minim(this);
          
           
           
           //loading mazes
           clearmaze = loadImage("clearmaze.png");
           PImage colMapImage = loadImage("collisionMap.gif");
           
           // generate our collision map as an two-dimensional boolean array
           collisionMap = new boolean[colMapImage.width][colMapImage.height];
           color black = color(0);
           color white = color(255);
           
           // looks through collion map rows
           for (int i = 0; i < colMapImage.width; i++) {
             // looks through collion map columns
             for (int j = 0; j < colMapImage.height; j++) {
               
               color c = colMapImage.get(i, j);
               if (c == black) {
                 collisionMap[i][j] = false;
               } 
          
               else if (c == white) {
                 collisionMap[i][j] = true;
               }
               else {
                 // should happen 
                 //println("Whoops! We shouldn't have colors other than black and white in our collision map!");
               }
          
             }
           }
}





//Win screen
void win(){
  
      background(0);
      stroke(255);
      text("Yay, you win!",(width/2-50),200);
      //navi:
      frame = (frame+1) % numFrames;
      image(images[frame], (width/2 - half_size), height/2);
}





void draw() {
  
        //lower right corner = win! (finish maze)
        if((navi_x>=485)&&(navi_y>=480)){
          state = "win";
         }
       
        
          if(state=="win"){
            win();
            return;
          }
        
      
      //println(mouseX + "," + mouseY);
      //up right 274,327
      //down right 275, 350
      //down left 229, 348
      //up left 230, 327  
      
      
       background(26,99,137);
                  //circling circles
                  bg_r_theta += .03;
                  bg_pos_theta += .1;
                  
                  drawCircles(75,155,206, 0, 1);
                  drawCircles(20, 108, 165, 10, .4);
                  drawCircles(3, 123, 165, 20, .7);
                  drawCircles(24, 130, 185, 30, .2);
                  drawCircles(49, 125, 162, 40, .4);
                  drawCircles(21, 122, 175, 50, .9);
                  
                  
      // take down wall that blocks end of maze          
         if(!hasKey){
          fill(0);
          rect(473,378,27,122);
                //key
           image(token,250,335);
         }
       
       //check for key collision
         if(navi_x >230 && navi_x < 275){
          if(navi_y >327 && navi_y < 350){
            //println("!");
            hasKey = true;
          }
         }
       
       
       //load visible maze walls
       image(clearmaze, width/2, height/2);
       
      
      
       //animated navi character
       frame = (frame+1) % numFrames;
        image(images[frame], navi_x, navi_y);
}



/*
*  this is where we actually move
*  the strategy is as follows:
*  - pretend we would move in the planned direction 
*    (left, right, up or down)
*  - then check if at this new position, all 4 corners
*    of our rectangle would be within our allowed area
*  - if that's the case: move
*/




void keyPressed(){
      
       // would each corner of the next step be within our boundaries?
       // default: no!
       boolean up_left = false;
       boolean up_right = false;
       boolean down_right = false;
       boolean down_left = false;
      
       if (keyCode == LEFT) {
         // check first if we are still within our canvas
         if (navi_x >= half_size + speed)
         {
           // check all four corners to see if they would be with the allowed area
           up_left = collisionMap[navi_x - navi_speed - half_size][navi_y - half_size];
           up_right = collisionMap[navi_x - navi_speed + half_size][navi_y - half_size];
           down_right = collisionMap[navi_x - navi_speed + half_size][navi_y + half_size];
           down_left = collisionMap[navi_x - navi_speed - half_size][navi_y + half_size];
           
           // if that's the case for each corner
           if (up_left && up_right && down_right && down_left) {
             // move
             navi_x -= navi_speed;
           }else{
              if(millis() > lastCollision + 2000){
                //println("ohhai");
                lastCollision = millis();
                song = minim.loadSnippet("Hey.mp3");
                song.play();
              }
           }
         }
       }
       
       // this basically is repeated for all possible ways to go…
       if (keyCode == RIGHT) {
         if (navi_x <= width - half_size - navi_speed)
         {
           up_left = collisionMap[navi_x + navi_speed - half_size][navi_y - half_size];
           up_right = collisionMap[navi_x + navi_speed + half_size][navi_y - half_size];
           down_right = collisionMap[navi_x + navi_speed + half_size][navi_y + half_size];
           down_left = collisionMap[navi_x + navi_speed - half_size][navi_y + half_size];
      
           if (up_left && up_right && down_right && down_left) {
             navi_x += navi_speed;
           }else{
              if(millis() > lastCollision + 2000){
                //println("ohhai");
                lastCollision = millis();
                song = minim.loadSnippet("Hey.mp3");
                song.play();
              }
           }
         }
       }
      
       if (keyCode == UP) {
         if (navi_y >= half_size + navi_speed)
         {
           up_left = collisionMap[navi_x - half_size][navi_y - navi_speed - half_size];
           up_right = collisionMap[navi_x + half_size][navi_y - navi_speed - half_size];
           down_right = collisionMap[navi_x + half_size][navi_y - navi_speed + half_size];
           down_left = collisionMap[navi_x - half_size][navi_y - navi_speed + half_size];
      
           if (up_left && up_right && down_right && down_left) {
             navi_y -= navi_speed;
           } else{
              if(millis() > lastCollision + 2000){
                //println("ohhai");
                lastCollision = millis();
                song = minim.loadSnippet("Hey.mp3");
                song.play();
              }
           }
         }
       }
      
       if (keyCode == DOWN) {
         if (navi_y <= height - half_size - navi_speed)
         {
           up_left = collisionMap[navi_x - half_size][navi_y + navi_speed - half_size];
           up_right = collisionMap[navi_x + half_size][navi_y + navi_speed - half_size];
           down_right = collisionMap[navi_x + half_size][navi_y + navi_speed + half_size];
           down_left = collisionMap[navi_x - half_size][navi_y + navi_speed + half_size];
      
           if (up_left && up_right && down_right && down_left) {
             navi_y += navi_speed;
           } else{
              //navi_y += navi_speed; /// CHANGE THIS
              if(millis() > lastCollision + 2000){
                //println("ohhai");
                lastCollision = millis();
                song = minim.loadSnippet("Hey.mp3");
                song.play();
              }
           }
         }
       }
       
       //keep navi from touching end corners
       if(navi_x >= 485){
         navi_x=485;
       }
       if(navi_y >= 485){
         navi_y=485;
       }
}





void drawCircles(float c1, float c2, float c3, float offset, float to){
        PVector player = new PVector(navi_x,navi_y);
        //PVector mouse = new PVector(mouseX,mouseY);
        //println(dist(player.x,player.y,mouse.x,mouse.y));
        float sizeDist = 0;
        float theta_offset =bg_pos_theta * to;
        
        for(float i=(sin(theta_offset) * (bg_pos * sin(bg_r_theta)))+offset; i<width; i+=60){
                      for(float j=(cos(theta_offset) * (bg_pos * sin(bg_r_theta)))+offset; j<height; j+=60){
                            noStroke();
                            fill(c1,c2,c3);
                            sizeDist = dist(player.x,player.y,i,j);
                            if(sizeDist > 350){
                              sizeDist = 350;
                            }
                            sizeDist = sizeDist/350;
                            ellipse(i, j, 60 * sizeDist,60 * sizeDist);
                      }
         }
}




//HEY...LISTEN!!!
void stop(){
      // always close Minim audio classes
      song.close();
      // always stop Minim before exiting
      minim.stop();
     
      super.stop();
}

