
import processing.opengl.*;
import processing.video.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

AudioPlayer player_background_music,player_camera_sound;
Minim minim_music,minim_microphone,minim_camera_sound;
AudioInput in;
Capture cam;
PImage stamp_photo,sign_photo,UFO_image;

int sze_X=900,sze_Y=600,star_quantity=100,trslt=0,meteor_counter_trslt=0,sze_camera_X=96,sze_camera_Y=96,sze_meteor_X,sze_meteor_Y,size_of_meteor;
float center_star_X=sze_X/3,center_star_Y=sze_Y/3,center_X=sze_X/2,center_Y=sze_Y/2,step_star=0,step_meteor=0,meteor_counter_i=0;
float x[]=new float[star_quantity],y[]=new float[star_quantity],z[]=new float[star_quantity],size_STR_static[]=new float[star_quantity];
color C[]=new color[star_quantity],c=color(0,0,0),color_delivery=color(0,0,0);
String saved="",typing="";
PFont f;
boolean direction_anticlockwise=false,judge_stop=false,text_cursor_show_or_not=false,judge_meteor_anmiation_finished_or_not=true,text_cursor_show_or_not_while_image_show=true,generate_meteor_or_not=false;
boolean judge_background_music_first_time_or_not=true,person_here_or_not=false,speak_or_not=false,have_stopped_or_not=false;
int times_of_background_music_played;
boolean photo_finished_or_not=false;//used in get_feedback()

boolean image_should_show_or_not=false;//used in keyReleased() to club together with get_feedback()

float UFO_location_X,UFO_location_Y,UFO_X_speed,UFO_Y_speed=3;
boolean judge_UFO_animation_finished_or_not=true;
int Shall_we_start_UFO,UFO_counter_i;
void setup(){
  size(sze_X,sze_Y,OPENGL);
  background(0);
  fill(0);
  smooth(8);
  noStroke();
  cam = new Capture(this,sze_camera_X,sze_camera_Y,60);
  cam.start(); 
  minim_camera_sound=new Minim(this);
  player_camera_sound=minim_camera_sound.loadFile("camera.wav");
  minim_music=new Minim(this);
  player_background_music=minim_music.loadFile("background_music.mp3");
  minim_microphone=new Minim(this);
  minim_microphone.debugOn();;
  in=minim_microphone.getLineIn(Minim.STEREO,1024);
  UFO_image=loadImage("UFO.png");
  stamp_photo=loadImage("stamp.png");
  sign_photo=loadImage("ATC.png");
  f = createFont("Arial",25,true);
  rdm();
}

void rdm(){
  int half_size=45;
  switch(int(random(0,1))){
    case 0:direction_anticlockwise=false;break;
    case 1:direction_anticlockwise=true;break;
  }
  for(int i=0;i<star_quantity;i++){
    x[i]=random(-sze_X,sze_X);
    y[i]=random(-sze_Y,sze_Y);
    z[i]=random(-sze_X,sze_X);
    C[i]=color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
    size_STR_static[i]=random(5,13);
    if(center_star_X-half_size-13<=x[i]&&x[i]<=center_star_X+half_size+13){
      if(center_star_Y-half_size-13<=y[i]&&y[i]<=center_star_Y+half_size+13){
        if(-center_star_Y+half_size+13<=z[i]&&z[i]<=center_star_Y+half_size+13){
          while(center_star_Y-half_size-13<=y[i]&&y[i]<=center_star_Y+half_size+13){y[i]=random(-sze_Y,sze_Y);}
        }
      }
    }
  }
}

void draw(){
  int box_distance_between_each=50;
  clear();
  pointLight(255,255,255,360,220,200);
  center_star();
  noLights();
  lights();
  if(judge_stop == false){
    pushMatrix();
    rotate_star();
    star();
    popMatrix();
    if(judge_meteor_anmiation_finished_or_not == true){trslt=GETKEY();}
    if((generate_meteor_or_not==true)&&(c==color(1,1,1))){color_delivery=color(int(random(0,255)),int(random(0,255)),int(random(0,255)));}
    else if(((generate_meteor_or_not==true)&&(c!=color(1,1,1)))&&(c!=color(0,0,0))){color_delivery=c;}
    meteor();
    if(mousePressed && (mouseButton == LEFT)){judge_stop=true;}
  }
  else{
    pushMatrix();
    rotateY(step_star);
    star();
    popMatrix();
    pushMatrix();
    rotateZ(step_meteor);
    meteor_animation();
    popMatrix();
  }
  if((text_cursor_show_or_not == true)&&(text_cursor_show_or_not_while_image_show == true)){
    textFont(f);
    fill(255);
    text(typing+(frameCount/10 % 2 == 0 ? "_" : ""),center_star_X,center_star_Y,50);
  }
  else if((text_cursor_show_or_not == true)&&(text_cursor_show_or_not_while_image_show == false)){
    textFont(f);
    fill(255);
    text(typing,center_star_X,center_star_Y,50);
  }
  if(image_should_show_or_not==true){
    noLights();
    for(int i=1;i<=5;i++){draw_boxes(box_distance_between_each*i,200-30*i);}
    image(sign_photo,0,0,sze_X,sze_Y);
    pushMatrix();
    translate(sze_X-2*sze_camera_X-20,40*2);
    image(cam,0,0);
    image(stamp_photo,0,0,sze_camera_X,sze_camera_Y);
    popMatrix();
  }
  get_feedback();
  noLights();
  fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  lights();
  UFO();
  noLights();
  if(mousePressed && (mouseButton == RIGHT)){judge_stop=false;}
}

void keyReleased(){
  if((keyCode == LEFT)&&(judge_stop==false)){direction_anticlockwise=true;}
  else if((keyCode == RIGHT)&&(judge_stop==false)){direction_anticlockwise=false;}
  else if((keyCode == DOWN)&&(judge_stop==false)){typing+='\n';}
  else if(keyCode == DOWN){typing+=' ';}
  else if((key == '\n')&&(judge_stop==false)){
    saved=typing;
    typing="";
    text_cursor_show_or_not=false;
    step_meteor=0;
  }
  else if(key == BACKSPACE){
    typing=typing.substring(0,max(0,typing.length()-1));
  }
  else if(keyCode == CONTROL){typing="";text_cursor_show_or_not=false;}
  else if(keyCode == SHIFT){
    if(image_should_show_or_not==true){image_should_show_or_not=false;text_cursor_show_or_not_while_image_show=true;}
    else{image_should_show_or_not=true;text_cursor_show_or_not_while_image_show=false;}
  }
  else if((key == ' ')&&(image_should_show_or_not == true)){
    saveFrame("line-######.tif");
    player_camera_sound.play();
  }
  else{typing+=key;text_cursor_show_or_not=true;}
}

void captureEvent(Capture video) {
  video.read();
}

void stop(){
  player_camera_sound.close();
  minim_camera_sound.stop();
  super.stop();
}

void UFO(){
  int How_long_will_it_show=50;
  if(judge_UFO_animation_finished_or_not==true){
    UFO_location_X=int(random(0,sze_X));
    UFO_location_Y=int(random(0,sze_Y));
    Shall_we_start_UFO=500;
    judge_UFO_animation_finished_or_not=false;

  }
  if(Shall_we_start_UFO==500){
    for(;UFO_counter_i<How_long_will_it_show;){
      pushMatrix();
      translate(UFO_location_X,UFO_location_Y);
      image(UFO_image,0,0,100,80);
      UFO_location_X+=UFO_X_speed;
      UFO_location_Y+=UFO_Y_speed;
      if (UFO_location_X>= width ||UFO_location_X<0)
      {UFO_X_speed=-UFO_X_speed;}
      // if(UFO_location_Y>= height ||UFO_location_Y<0)
      {UFO_Y_speed=-UFO_Y_speed;}
      popMatrix();
      UFO_counter_i++;
      break;
    }
    if(UFO_counter_i==How_long_will_it_show){
      UFO_counter_i=0;
      judge_UFO_animation_finished_or_not=true;
    }
  }
}

void center_star(){
  color blk=color(0,0,0);
  color blu=color(100,255,252);
  int size=100;
  float number=0.01;
  color change=lerpColor(blk,blu,0);
  pushMatrix();
  translate(center_star_X,center_star_Y,0);
  fill(blu);
  sphere(size/2);
  popMatrix();
}

void star(){
  color blc=color(0,0,0);
  float size_STR_dynamic=5.0;
  float number;
  color change;
  for(int i=0;i<star_quantity;i++){
    size_STR_dynamic=size_STR_static[i];
    number=0;
    pushMatrix();
    translate(x[i],y[i],z[i]);
    fill(C[i]);
    sphere(size_STR_static[i]);
    popMatrix();
  }
}

void rotate_star(){
  rotateY(step_star);
  if(direction_anticlockwise == false){step_star+=0.01;}
  else{step_star-=0.01;}
}

int GETKEY(){
  int TRSLT=0;
  boolean judge_key_number_or_not=false,judge_key_letter_or_not=false;
  for(int i=0;i<saved.length();i++){
    if(i==0){
      if((('a'<=saved.charAt(0))&&(saved.charAt(0)<='z'))||(saved.charAt(0)=='C')){judge_key_letter_or_not=true;}
      else{judge_key_letter_or_not=false;break;}
    }
    else{
      if(('0'<=saved.charAt(i))&&(saved.charAt(i)<='9')){judge_key_number_or_not=true;}
      else{judge_key_number_or_not=false;break;}
    }
  }
  if(judge_key_letter_or_not && judge_key_number_or_not){
    meteor_counter_trslt=0;
    judge_meteor_anmiation_finished_or_not=false;
    generate_meteor_or_not=true;
    for(int i=1;i<saved.length();i++){
      TRSLT+=get_final_number(int(saved.charAt(i))-48,i,saved.length()-1);
    }
  }
  if(TRSLT!=0){
    switch(saved.charAt(0)){
      default:c=color(0,0,0);break;//Ignore
      case 'C':c=color(1,1,1);break;//Colorful
      case 'b':c=color(0,30,255);break;//Blue
      case 'c':c=color(255,0,198);break;//Peacock
      case 'e':c=color(253,131,0);break;//Orange
      case 'g':c=color(12,253,0);break;//Green
      case 'l':c=color(2,255,240);break;// Light Bule
      case 'n':c=color(240,0,255);break;//Pink
      case 'o':c=color(253,250,0);break;//Yellow
      case 'p':c=color(73,2,255);break;//Purple
      case 'r':c=color(255,0,66);break;//Rose
      case 'v':c=color(139,2,255);break;//Lavender
      case 'w':c=color(161,253,0);break;//Warm Green
      case 'y':c=color(0,253,185);break;//Cyan
    }
  }
  saved="";
  return TRSLT;
}

void meteor(){//////////////////////////////////////////////////////////////////////////////////////////////
  if(c==color(1,1,1)){main_meteor_function();}
  else if((c!=color(1,1,1))&&(c!=color(0,0,0))){main_meteor_function();}
}

void main_meteor_function(){
  float step=0.1;
  if(judge_meteor_anmiation_finished_or_not == false){
    if(generate_meteor_or_not==true){
      sze_meteor_X=int(random(0,sze_X));
      sze_meteor_Y=int(random(0,sze_Y));
      size_of_meteor=int(random(10,50));
      generate_meteor_or_not=false;
    }
    for(;meteor_counter_i<3*QUARTER_PI;){
      if(keyPressed){if(key=='Q'){break;}}
      pushMatrix();
      rotateZ(step_meteor);//k_diagonal*k_perpendicular=-1
      step_meteor+=step;
      meteor_animation();
      popMatrix();
      meteor_counter_i+=step;
      if((meteor_counter_i>=3*QUARTER_PI)&&(meteor_counter_trslt<trslt)){
        meteor_counter_i=0;
        meteor_counter_trslt++;
        generate_meteor_or_not=true;
      }
      else if((meteor_counter_i>=3*QUARTER_PI)&&(meteor_counter_trslt>=trslt)){
        meteor_counter_i=0;
        judge_meteor_anmiation_finished_or_not=true;
        c=color(0,0,0);
      }
      break;
    }
  }
}

void meteor_animation(){
  pushMatrix();
  translate(sze_meteor_X,sze_meteor_Y,0);
  fill(color_delivery);
  lights();
  lights();
  lights();
  sphere(size_of_meteor);
  noLights();
  popMatrix();
}

int get_final_number(int number,int i,int number_leth){
  int final_number=1;
  for(;i<number_leth;i++){final_number*=10;}
  final_number*=number;
  return final_number;
}

void draw_boxes(int location,int box_color){
  int box_distance_between_Left_and_Right_X=30,box_distance_between_Top_and_Bottom_Y=40;
  int box_top_left_X=0,box_top_left_Y=0;
  int box_bottom_left_X=box_top_left_X,box_bottom_left_Y=box_top_left_Y+box_distance_between_Top_and_Bottom_Y;
  int box_bottom_right_X=box_bottom_left_X+box_distance_between_Left_and_Right_X,box_bottom_right_Y=box_bottom_left_Y;
  int box_top_right_X=box_bottom_right_X,box_top_right_Y=box_top_left_Y;
  pushMatrix();
  strokeCap(ROUND);
  strokeJoin(BEVEL);
  strokeWeight(5.0);
  stroke(box_color);
  noFill();
  translate(60+location,75);
  beginShape();
  vertex(box_top_left_X, box_top_left_Y);
  vertex(box_bottom_left_X,box_bottom_left_Y);
  vertex(box_bottom_right_X,box_bottom_right_Y);
  vertex(box_top_right_X,box_top_right_Y);
  vertex(box_top_left_X, box_top_left_Y);
  vertex(box_bottom_left_X,box_bottom_left_Y-10);
  endShape();
  noStroke();
  popMatrix();
}

void get_feedback(){
  print("1[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
  color findcolor=color(255,255,255);
  float color_difference=280;
  cam.loadPixels();
  for(int x=0;x<cam.width;x++){
    for(int y=0;y<cam.height;y++){
      int loc=x+y*cam.width;
      color videocolor=cam.pixels[loc];
      float red_camera_get=red(videocolor),green_camera_get=green(videocolor),blue_camera_get=blue(videocolor);
      float red_target=red(findcolor),green_target=green(findcolor),blue_target=blue(findcolor);
      float d=dist(red_camera_get,green_camera_get,blue_camera_get,red_target,green_target,blue_target);
      int camera;
      if(d<color_difference){
        person_here_or_not=true;//person here or not
      }
      else{person_here_or_not=false;}
      if(person_here_or_not==true){break;}
    }
    if(person_here_or_not==true){break;}
  }
  for(int i=0;i<in.bufferSize()-1;i+=8){
    if((in.left.get(i)>=0.5)&&(in.right.get(i)>=0.5)){
      print("################################################################################");
      speak_or_not=true;
      break;
    }
    else{speak_or_not=false;}
  }
   print("2[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
  if((person_here_or_not==true)&&(speak_or_not==true)){
    for(int x=0;x<cam.width;x++){
      for(int y=0;y<cam.height;y++){
        int loc=x+y*cam.width;
        color videocolor=cam.pixels[loc];
        float red_camera_get=red(videocolor),green_camera_get=green(videocolor),blue_camera_get=blue(videocolor);
        float red_target=red(findcolor),green_target=green(findcolor),blue_target=blue(findcolor);
        float d=dist(red_camera_get,green_camera_get,blue_camera_get,red_target,green_target,blue_target);
        int camera;
        if(d<color_difference){
          person_here_or_not=true;
        }
        else{person_here_or_not=false;}
        if(person_here_or_not==true){break;}
      }
      if(person_here_or_not==true){break;}
    }
     print("3[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
    if(person_here_or_not==true){
      if((!player_background_music.isPlaying())&&(judge_background_music_first_time_or_not==true)){
         print("4[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
        player_background_music=minim_music.loadFile("background_music.mp3");
        player_background_music.play();
        judge_background_music_first_time_or_not=false;
         print("5[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
      }
      else if((!player_background_music.isPlaying())&&(judge_background_music_first_time_or_not==false)){
         print("6[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
        player_background_music.rewind();
        player_background_music.play();
         print("7[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
      }
    }
  }
  else if((person_here_or_not==true)&&(speak_or_not==false)){
     print("8[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
    if((!player_background_music.isPlaying())&&(judge_background_music_first_time_or_not==false)){
      player_background_music=minim_music.loadFile("background_music.mp3");
      player_background_music.rewind();
      player_background_music.play();
       print("9[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
    }
  }
  else if(person_here_or_not==false){
    print("10[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
    minim_music.stop();
    judge_background_music_first_time_or_not=true;
     print("11[P,"+person_here_or_not+",S,"+speak_or_not+",J,"+judge_background_music_first_time_or_not+",");
  }
}
