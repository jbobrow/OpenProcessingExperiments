
//Name: Andrew Foresman
//Class: ITGM_315
//Date: Winter 2013
//Title: Assignment 4

class beaver {
  
 
  
  
  //colors for the beaver
  
  color color_tail_base = color(115,69,69);
  color color_tail_outline = color(163,119,119);
  color color_fur_dark;
  color color_fur_light = color(222,200,169);
  color color_ear_inside = color(255,182,193);
  color color_eye_lid = color(212,201,155);
  
  color color_hilite = color(187,228,239);
  

  int x;
  int y;
  
  boolean isActive;  //if the instance is active or not 
  
  beaver(int _x, int _y, float tail_rot, color _color_fur_dark){
 
      x = _x;
      
      y = _y;

     color_fur_dark = _color_fur_dark;
     
     isActive = false;


    
  }
  
  
    //
  // reposition used to update position of the instance
  // input:
  //     _x is new x position
  //     _y is new y position
  //
  void reposition( int _x, int _y ) {
    if ( isActive ) {
      x = _x;
      y = _y;
    }
  }
  
  
  
  //bounding box test 
  
    void select( int _x, int _y ) {
    
   
    if ( ( abs(_x-x) < 60 )  &&  ( abs(_y-y) < 100 ) ) {
      isActive = true;
    }
  }
  
  
//deselect inactivates instance 

  void deselect() {
    isActive = false;
  }
  
 

  
  void display(){
    
    
     if ( isActive ) {          // if active highlight
     
       draw_active_hilite();
    }
    
  
    draw_tail();
    draw_arms(); 
    draw_feet();
    draw_face();
    draw_body();
    draw_face();
    draw_whiskers();

  }
  
  void draw_active_hilite() {
    ellipseMode( CENTER );
    noStroke();
    fill( color_hilite );
    ellipse( x, y+30, 350, 520 );
  }

  void draw_tail(){
  
    //draws the tail

    pushMatrix();

    strokeWeight(3);
    fill( color_tail_base );
  


    //rotate(tail_rot);
    ellipse(x+tail_rot*60,y+0,200,400);



    popMatrix();
  
    //draws the tail inner outline
  
    noStroke();
  
    strokeWeight(0);
  
    pushMatrix();
  
    ellipseMode(CENTER);
    fill(color_tail_outline);
  
    //rotate(tail_rot);
    ellipse(x+tail_rot*60,y+0,180,380);
  
    popMatrix();
    
    //draws the tails innermost ellipse 
  
     fill(color_tail_base);

    pushMatrix();
  
    //rotate(tail_rot);
    ellipse(x+tail_rot*60,y+0,175,375);
  
    popMatrix();
  
  
  
    //draws the tail cross hatching
  
    //stroke(163,119,119);
    //line(mouseX+10,mouseY-150,mouseX+85,mouseY-135);
    //line(mouseX+40,mouseY-170,mouseX+20,mouseY-50);
    //line(mouseX+10,mouseY-110,mouseX+85,mouseY-115);
    //line(mouseX+70,mouseY-70,mouseX+40,mouseY+100);
    //line(mouseX+10,mouseY-22,mouseX+85,mouseY-15);
    //line(mouseX+10,mouseY-12,mouseX+85,mouseY-1);
  
  }//end draw tail



  void draw_feet(){
    
    //draws the feet outline
  
    fill(0);
  
    pushMatrix();
  
  
  
    triangle(x+-30, y+142, x+-30, y+220, x+-180, y+240);
  
    triangle(x+0, y+141, x+0, y+220, x+130, y+240);
  
    //draws the feet
  
    fill(color_fur_dark);
  
    triangle(x+-30, y+150, x+-30, y+220, x+-180, y+240);
  
    triangle(x+0, y+150, x+0, y+220, x+130, y+240);


    popMatrix();
  
    //draws the toe lines
  
    pushMatrix();
    stroke(0);
    strokeWeight(2);
  
  
  
    line(x+-165,y+238,x+-135,y+220);
  
    line(x+115,y+238,x+85,y+218);
  
    popMatrix();
  
  
  }//end draw feet
  
  
  
  //start draw body
  
  void draw_body(){

    //draws the body outline
  
    stroke(0);
  
    pushMatrix();
  
  
    ellipseMode(CENTER);
    fill(0);
    ellipse(x+0,y+114,200,230);
  
    //draws the body
  
    stroke(0);
    ellipseMode(CENTER);
    fill(color_fur_dark);
    ellipse(x+0,y+110,200,230);




    //draws the stomach
  
    noStroke();
    fill(color_fur_light);
    ellipse(x+0,y+140,150,170);
    stroke(0);
  
    popMatrix();
  
  }//end draw_body
  
  


  //start drawe face
  
  void draw_face(){
    
    
    
    //draws the cheeks
  
    pushMatrix();
  
  
    fill(color_fur_light);
    ellipse(x+0,y+0,150,85);
  
    popMatrix();
  
    //draws the ears---------------------//
  
    //draws the right ear
  
    pushMatrix();
  
  
  
    strokeWeight(2);
    fill(color_fur_dark);
    ellipse(x+30,y+-130,40,50);
  
    //right ear pink
  
    strokeWeight(1);
    fill(255,182,193);
    ellipse(x+30,y+-130,20,30);
  
    popMatrix();
  
    //draws the left ear

    pushMatrix();
  
  
  
    strokeWeight(2);
    fill(color_fur_dark);
    ellipse(x+-20,y+-140,40,50);
  
    //left ear pink
  
    strokeWeight(1);
    fill(color_ear_inside);
    ellipse(x+-20,y+-140,20,30);
  
    popMatrix();
  
    //------------------------------------//
  
  
    //draws the skull
  
    pushMatrix();
  
  
  
    fill(color_fur_dark);
    ellipse(x+0,y+-110,70,50);
  
    popMatrix();
  
    //draws the face shadow
  
    pushMatrix();

  
    fill(0);
    ellipse(x+-5, y+0,40,30);
  
    popMatrix();
  
    //draws the eyes------------------------//
  
    //black circle around left eye
  
    pushMatrix();
  
  
    noStroke();
    fill(15);

        ellipse(x-35,y-70,70,105);
                rotate(.3);



  
    popMatrix();
  
  
    //black circle around right eye
  
    pushMatrix(); 
  
  
    noStroke();
    fill(15);
    
    ellipse(x+35,y+-65,70,100);
  
    popMatrix();
  
  
    //if statement, if true draw white, if not draw closed
  
    float eyes_rand = random(1);
    //println (eyes_rand);
  
    if( mousePressed && ( mouseButton == RIGHT)){
      
      //left eye closed
  
    pushMatrix();
  
  
    noStroke();
    fill(color_eye_lid);
    ellipse(x-30,y+-70,70,100);
  
    popMatrix();
  
  
    //right eye closed
  
    pushMatrix();
  
    
  
    noStroke();
    fill(color_eye_lid);
    ellipse(x+30,y+-65,70,100);
    
    stroke(0);
  
  
    popMatrix();
    
    
    
    pushMatrix();
    
  
   //closed eyes creases 
    line(x+0,y-45,x+70,y-60);
    line(x+0,y-45,x-70,y-60);
  
    
    popMatrix();
      
    
  
    }
  
    else{
      
      //left eye white
  
    pushMatrix();
  
  
    noStroke();
    fill(254);
    ellipse(x-30,y+-70,70,100);
  
    popMatrix();
  
  
    //right eye white
  
    pushMatrix();
  
  
    noStroke();
    fill(254);
    ellipse(x+30,y+-65,70,100);
  
  
    popMatrix();
    
  
    //left eye pupil
  
  
  
    float x_left_pupil = map (mouseX, 0, width, x+-60, x+0);
    float y_left_pupil = map (mouseY, 0, height, y+-100, y+-40);
  
    fill(0);
    ellipse(x_left_pupil+10,y_left_pupil,13,13);
  
    //left eye spec
  
    fill(255);
    float x_spec_left_eye = map (mouseX, 0, width, x-63, x+3);
    float y_spec_left_eye = map (mouseY, 0, height, y+-103, y+-37);
    ellipse(x_spec_left_eye+10,y_spec_left_eye,3,3);
  
    //right eye pupil
  
    float x_right_pupil = map (mouseX, 0, width, x+0, x+60);
    float y_right_pupil = map (mouseY, 0, height, y-100,y-40);
  
    fill(0);
    ellipse(x_right_pupil-10,y_right_pupil,13,13);
  
    //right eye spec
  
    fill(255);
    float x_spec_right_eye = map (mouseX, 0, width, x-3,x+63);
    float y_spec_right_eye = map (mouseY, 0, height, y-104, y-36);
    ellipse(x_spec_right_eye-10,y_spec_right_eye,3,3);
  
    
  
  
    }
  
  
  
  
    //draws the teeth--------------\\
  
  
    //draws the left tooth shadow
  
    fill(0);
  
    pushMatrix(); 
  
  
    noStroke();
    rectMode(CENTER);
  
  
  
    rect(x-19,y+30,44,70);
  
    popMatrix();
  
    //draws the left tooth
  
    fill(255);
  
    pushMatrix();
  
    noStroke();
    rectMode(CENTER);
  
  
  
    rect(x-18,y+28,40,70);
  
    popMatrix();
  
    //draws the right tooth shadow
  
    pushMatrix();
  
    fill(0);
    noStroke();
    rectMode(CENTER);
  
  
  
    rect(x+7,y+28,33,54);
  
    popMatrix();
  
    //draws the right tooth
  
    pushMatrix();
  
    fill(255);
    noStroke();
    rectMode(CENTER);
  
  
  
    rect(x+7,y+28,30,50);
  
  
    popMatrix();
  
  
    //draws the mouth
  
    pushMatrix();
  
  
    stroke(0);
    strokeWeight(1);
    fill(color_fur_light);
    ellipse(x-5,y-10,75,65);
  
    popMatrix();
  
    //draws the nose
  
    pushMatrix();
  
  
    fill(30);
    ellipse(x-5,y-33,40,30);
  
    popMatrix();
  
    //draws the nose-highlight
  
    pushMatrix();
  
  
  
    fill(250);
    ellipse(x-5,y-42,15,8);
  
    popMatrix();
  
  }//end draw_face-----------------------------------------------
  
  
  
  //start draw arms
  void draw_arms(){
    
    //draws the left fingers
  
    pushMatrix();
  
  
    fill(22,18,18);
    stroke(0);
    strokeWeight(4);
    
    
    line(x-165+(arm_rot*10), y+(arm_rot*40)+70, x-175+(arm_rot*10), y+(arm_rot*40)+71);
  
    
    line(x-165+(arm_rot*10), y+(arm_rot*40)+80, x-175+(arm_rot*10), y+(arm_rot*40)+81);
  
  
    line(x-165+(arm_rot*10), y+(arm_rot*40)+90, x-175+(arm_rot*10), y+(arm_rot*40)+91);
    
  
    popMatrix();
  
    //draws the left arm outline
  
    pushMatrix();
  
  
    noStroke();
    fill(0);
    rect(x-123+(arm_rot*10), y+(arm_rot*40)+80, 95, 40);
  
    popMatrix();
  
    //draws the left arm
  
    pushMatrix();
  
  
  
    noStroke();
    fill(color_fur_dark);
    rect(x-123+(arm_rot*10), y+(arm_rot*40)+80, 95, 35);
  
    
  
  
  
    popMatrix();
  
  
  
  
    //draws the right fingers
  
    pushMatrix();
  


    stroke(0);
    strokeWeight(4);
    
    line(x+161-(arm_rot*5), y+(arm_rot*60)+70, x+165-(arm_rot*5), y+71+(arm_rot*60));
  
    
    line(x+161-(arm_rot*5), y+(arm_rot*60)+80, x+165-(arm_rot*5), y+81+(arm_rot*60));
  
  
    line(x+161-(arm_rot*5), y+(arm_rot*60)+90, x+165-(arm_rot*5), y+91+(arm_rot*60));
  
    popMatrix();
  
    //draws the right arm outline
  
    pushMatrix();
  
  
    noStroke();
    fill(0);
    rect(x+111+(arm_rot*-5), (y+arm_rot*60)+80, 100, 40);
  
    popMatrix();
  
    //draws the right arm
  
    pushMatrix();
  
  
    noStroke();
    fill(color_fur_dark);
    rect(x+111+(arm_rot*-5), (y+arm_rot*60)+80, 100, 36);
  
    popMatrix();
    
  
  }//ends draw_arms




  void draw_whiskers(){
    //draws the whiskers 
  
  
    //draws the left side whiskers 
  
    pushMatrix();
  
  
    stroke(0);
    line(x-90,y-50,x-30,y-20);
  
    line(x-110,y-20,x-35,y-10);
    line(x-90,y+10,x-30,y+0);
  
    //draws the right side whiskers
  
    line(x+80,y-40,x+20,y-20);
    line(x+100,y-10,x+20,y-12);
    line(x+75,y+10,x+20,y-2);
  
    popMatrix();
  
  }//ends draw whiskers


}




