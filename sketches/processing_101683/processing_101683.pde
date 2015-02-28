


/*
 ▄▀▀▄  █▀▀▄  █▀▀▀  █▀▀▄  ▀█▀  ▀▀█▀▀  ▄▀▀■ 
 █     █▀▀▄  █■■   █  █   █     █    ▀■■▄ 
 ▀▄▄▀  █  █  █▄▄▄  █▄▄▀  ▄█▄    █    ■▄▄▀ 
*/

// author benjamin w kiesewetter
// www.noviquitaeten.de

// Digital Analog Surfaces, 2012 - 2013
// Steffi Husslein Robert Laux Michael Bertuleit 
// http://interaction-design-group.de/toolbox/

/*
████████       ▀█▀  █▄ ▄█  █▀▀▄  ▄▀▀▄  █▀▀▄  ▀▀█▀▀ 
████████        █   █▀▄▀█  █▀▀   █  █  █▀▀▄    █   
████████       ▄█▄  █ █ █  █     ▀▄▄▀  █  █    █   
*/

import java.awt.event.*;
import javax.swing.*;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;
import javax.swing.filechooser.FileNameExtensionFilter;
import blobDetection.*;
import java.awt.image.BufferedImage;
import java.util.*;
import java.io.*;



//████████        ▄▀▀■  █▀▀▀  ▀▀█▀▀  █  █  █▀▀▄      ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
//████████        ▀■■▄  █■■     █    █  █  █▀▀       ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
//████████        ■▄▄▀  █▄▄▄    █    ▀▄▄▀  █         ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████


void setup() {

  frameRate(10);
  background(c_background);

  size(800, 600);

  archive_dots = new ArrayList (); 
  archive_lines = new ArrayList(); 
  setup_interface(10,10);  
  read_image_file(glb_image_file);
  add_code=false;
  g_proloque();
  current_height=height;
  current_width=width;
  build_sim=true;
  println("____SETUP DONE______"); 
}

//████████        █▀▀▄  █▀▀▄  ▄▀▀▄  █   █      ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
//████████        █  █  █▀▀▄  █■■█  █ █ █      ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
//████████        █▄▄▀  █  █  █  █   █ █       ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████

void draw() {
  
  if(mouseX>menue_width){
    //enable dragging and zooming
    cursor(HAND);
    frameRate(15);
    grid_draggable=true;
  } else if(!grid_dragging&&grid_draggable){
    cursor(ARROW);
    frameRate(20);
    grid_draggable=false;
  }
  if(grid_dragging && (mouseX!=pmouseX || mouseY!=pmouseY)){
    frameRate(30);
    noCursor();
   steps_per_line=floor(max(10,map(mouseX,menue_width+50,width,10,150)));
    build_sim=true;
  }

  if(!grid_draggable){
    if(steps_per_line++>90){
      steps_per_line=10;
      pattern++;
      if(pattern > 3){
        pattern=0;
      } 
    }
    build_sim=true;
  }else{
    if(!grid_dragging && (mouseX!=pmouseX || mouseY!=pmouseY)){
      noise_factor= max(0,map(mouseX,menue_width+50,width,0,2));
      max_depth=map(mouseY,0,height,0.1,2);
      build_sim=true;
    }
  }



  if(build_sim){//only update if values changed
    //println("building sim");
    grid_offset.x=max(((width-menue_width)/zoom-max_size-20),grid_offset.x);
    grid_offset.y=max((height/zoom-max_size-20),grid_offset.y);
    grid_offset.x=min(20,grid_offset.x);
    grid_offset.y=min(20,grid_offset.y);
    build_sim = false;
    process_image(menue_width,0);
  }

  fill(c_background);
  //fill(c_debug);  //debug
  noStroke();
  rect(0,0,menue_width, height);
  show_drill(20,160,180);
  display_text("rasterfahrer 3 (web demo)\nbenjamin kiesewetter 2013",20,40,c_fonts,fonts_main_L);
  display_text("points/lines:\n"
                +line_or_point_counter
                +"\n "
                +"\npattern:"
                +"\n"+pattern_list[pattern]
                +"\n "
                +"\nnoise:"
                +"\n"+noise_factor
                +"\n"
                +"\nsteps per line "
                +"\n"+steps_per_line
                +"\n"
                +"\n"
                +"\n"
                ,20,380,c_fonts,fonts_main_L);
  strokeWeight(0);//this is for a controlp5 problem with multi lists  
  menue_message();

  if(!grid_draggable){
      message(menue_width-50,  150, 400,     #BFF5F9,     #4B6A74,       200, new String[]{
      ""
      ," THIS IS ONLY THE WEB DEMO "
      ,""
      ,"the original rasterfahrer 3 is processing java (not javascript)"
      ,"it converts your BITMAP pictures to true G-CODE"
      ,"what you see is what you get"
      ,"it comes with a proper interface: buttons, sliders, explorer windows..."
      ,""
      ,"what you see here is the simulation engine of rasterfahrer 3 with some pattern examples"
      ,"rasterfahrer can do this with any image and produce the g-code for cnc-mills"
      ,"sorry this looks so crappy, but this is a quick'n'dirty javascript conversion of the original program "
      ,""
      ,"to find the download look below"
      ,""
    });
  }
}

/*
████████       ▄▀▀▄  █     ▄▀▀▄  █▀▀▄  ▄▀▀▄  █           █  █  ▄▀▀▄  █▀▀▄  ▄▀▀■       most global variables are here          ██████████████████████████████████████████████████████████████████████████████████████████
████████       █ ▄▄  █     █  █  █▀▀▄  █■■█  █           █ █   █■■█  █▀▀▄  ▀■■▄       additionally some are right before      ██████████████████████████████████████████████████████████████████████████████████████████
████████       ▀▄▄▀  █▄▄▄  ▀▄▄▀  █▄▄▀  █  █  █▄▄▄         █    █  █  █  █  ■▄▄▀       the function that will use them)        ██████████████████████████████████████████████████████████████████████████████████████████
*/

PImage pic_loaded;
PImage pic_resized; //input image
String g_code;
boolean interacted = false;
boolean add_code = false;
boolean save_code = false;
boolean build_sim = true;
boolean grid_draggable =false;
boolean grid_dragging = false;
boolean zooming = false;
boolean something_changed=false;


ArrayList archive_dots; 
ArrayList archive_lines;
String archive_texts ="";

String ini_filename = "ini.xml";
float move_counter = 0;
int frame_counter =0;
int line_or_point_counter=0;
int position_counter=0;
int pattern_counter=0;
int current_width;
int current_height;
int max_size =1000;
int material_thickness=0;

/*
████████       ▀▄ ▄▀  █▄ ▄█  █           █  █  ▄▀▀▄  █▀▀▄  ▄▀▀■       These variables will be stored 
████████         █    █▀▄▀█  █           █ █   █■■█  █▀▀▄  ▀■■▄       in an xml file (see ini_filename, default is /data/ini.xml ) 
████████       ▄▀ ▀▄  █ █ █  █▄▄▄         █    █  █  █  █  ■▄▄▀       to be called again on start of the programm
*/


// THE INPUT
String glb_image_file = "default.png";
String input_path = "";

// THE OUTPUT
float drill_diameter = 3.0f; //diameter of the drill used
int drill_type = 5; //type of the drill tip (refers to an array drill of mainly drill angles 180°=flat or smaller)

int pattern=0;  //pattern to be used (dots or lines etx...) refers to an array 
int steps_per_line =30; //raster of image in x, y will be calculated from that and the height/width ratio of the image
float step_dist = 3.0f; // distance of the points, redundant: step_dist = line_width / steps_per_line not used at the moment, but could be instead of one of the others
float line_width = 100; //width of the image at the output(in the real world) in mm 
float max_depth=0.5f; //in mm - minimum depth to be drilled (or preasure when scratched) when the pixel is white
float min_depth=0.0f; //in mm - maximum depth to be drilled (or preasure when scratched) when the pixel is black
float edge_threshold= 50;//in % determines the brightness value where to find edges of a blob
float line_min_length=10;//minimum length of lines to be drawn (smaller will be added up)
float noise_factor=0; //loss of points or lines via noise

float precision = 0.00f; //how close should the drill drive to a point of coordinates given (closer means it has to do more breaking and gets slower, less close will make more rounded edges but drill faster)
int milling_speed = 2000; // the maximum speed that the cnc mill should drive when the drill is inside the material

// THE VISUALISATION
float zoom =5.0f; //optical zoom Factor on screen
boolean inverter = false; //will invert black and white in te image and on screen, for materials that get brighter when drilled/scratched etc
int view_mode = 0; //0 is "what u see is what u get", 1 is without the patterns added before, 2 is with some analytics and the actual image in comparison to see what will be drilled




//████████       █▀▀▀  ▀█▀  █     █▀▀▀        █  █  ▄▀▀▄  █▄ █  █▀▀▄  █     ▀█▀  █▄ █  ▄▀▀▄  ▄▀▀■       ████████████████████████████████████████████████████████████████████████████████████████
//████████       █■■    █   █     █■■         █■■█  █■■█  █▀▄█  █  █  █      █   █▀▄█  █ ▄▄  ▀■■▄       ████████████████████████████████████████████████████████████████████████████████████████
//████████       █     ▄█▄  █▄▄▄  █▄▄▄        █  █  █  █  █ ▀█  █▄▄▀  █▄▄▄  ▄█▄  █ ▀█  ▀▄▄▀  ■▄▄▀       ████████████████████████████████████████████████████████████████████████████████████████

void read_image_file(String thePath){
  try{
    pic_loaded = loadImage(thePath);
    pic_resized = new PImage(0,0);
    glb_image_file=thePath;
    println(thePath+" image successfully loaded");
  }
  catch (Exception e) {
   println("ERROR loading "+thePath);
  }
}

void resize_image(int theValue){
  if(pic_resized.width!=theValue && !build_sim){
    //println("resizing image to: "+theValue);    
    //pic_resized =loadImage(glb_image_file);
    pic_resized = new PImage(theValue,pic_loaded.height*theValue/pic_loaded.width);
    pic_resized.copy(pic_loaded, 0, 0, pic_loaded.width, pic_loaded.height, 0, 0, pic_resized.width, pic_resized.height);
  }
}

String output_path(String file_name){
  return sketchPath("output\\"+file_name);
}

String input_path(String file_name){
  if(input_path!=null && input_path!="") return input_path+file_name;
  return sketchPath("input\\"+file_name);
}


/*
██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████                                                                  ████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████        ▀█▀  █▄ █  ▀▀█▀▀  █▀▀▀  █▀▀▄  █▀▀▀  ▄▀▀▄  ▄▀▀▄  █▀▀▀      ████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████         █   █▀▄█    █    █■■   █▀▀▄  █■■   █■■█  █     █■■       ████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████        ▄█▄  █ ▀█    █    █▄▄▄  █  █  █     █  █  ▀▄▄▀  █▄▄▄      ████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████
████████       █  █  ▄▀▀▄  █▀▀▄  ▀█▀  ▄▀▀▄  █▀▀▄  █     █▀▀▀  ▄▀▀■ 
████████       █ █   █■■█  █▀▀▄   █   █■■█  █▀▀▄  █     █■■   ▀■■▄ 
████████        █    █  █  █  █  ▄█▄  █  █  █▄▄▀  █▄▄▄  █▄▄▄  ■▄▄▀ 
*/
//THE INTERFACE / DESIGN
int menue_width=220;
int menue_row_height;
int wheelticks=0;

PVector grid_offset=new PVector(10,10); //mm

PFont fonts_main_S;
PFont fonts_main_M;
PFont fonts_main_L;

color c_background =  #EEE9E3; // main background
color c_foreground =  #26242D; // main foreground

color c_f_attention=  #EC803E; // foreground bright colors for warnings etc
color c_b_attention=  #4A3026; // background bright colors for warnings etc

color c_fonts=        #113736; // foreground most fonts

color c_f_objects=    #3E3220; // foreground objects to be drawn
color c_b_objects=    #BFB0A6; // background objects to be drawn

color c_debug =       #FF00FF; // bright pink for debugging



//████████       ▀█▀  █▄ █  ▀▀█▀▀  █▀▀▀  █▀▀▄  █▀▀▀           ▄▀▀■  █▀▀▀  ▀▀█▀▀  █  █  █▀▀▄ 
//████████        █   █▀▄█    █    █■■   █▀▀▄  █■■   ▄        ▀■■▄  █■■     █    █  █  █▀▀  
//████████       ▄█▄  █ ▀█    █    █▄▄▄  █  █  █    ▀▄▀       ■▄▄▀  █▄▄▄    █    ▀▄▄▀  █    


void setup_interface(int xx,int yy){ // setup interface
 
  
  menue_row_height=20;
  int row=0; // one row is menue_row_height pixels high, increasing the rows is like pressing enter
  int i=0; // workaround to talk to the reglers later, regler[i] is an array of benjaSlider, which is a subclass of controlp5 slider
  

  
}

/*
████████       ▄▀▀■  ▄▀▀▄  █▀▀▄  ▄▀▀▄  █     █    
████████       ▀■■▄  █     █▀▀▄  █  █  █     █    
████████       ■▄▄▀  ▀▄▄▀  █  █  ▀▄▄▀  █▄▄▄  █▄▄▄ 
*/

void scrollfunction(int ticks){
  if (grid_draggable){
    //zooming=true; doesn't work
  }
}

/*
████████       █▄ ▄█  ▄▀▀▄  █  █  ▄▀▀■  █▀▀▀        █▀▀▄  █▀▀▄  █▀▀▀  ▄▀▀■  ▄▀▀■ 
████████       █▀▄▀█  █  █  █  █  ▀■■▄  █■■         █▀▀   █▀▀▄  █■■   ▀■■▄  ▀■■▄ 
████████       █ █ █  ▀▄▄▀  ▀▄▄▀  ■▄▄▀  █▄▄▄        █     █  █  █▄▄▄  ■▄▄▀  ■▄▄▀ 
*/

void mousePressed(){
  if(grid_draggable){
    grid_dragging=true;
    //println("dragging");
  }
}

void mouseReleased(){
    grid_dragging=false;
    zooming=false;
    build_sim=true;
}

//████████        █▀▀▄  █  █  ▀▀█▀▀  ▀▀█▀▀  ▄▀▀▄  █▄ █  ▄▀▀■      
//████████        █▀▀▄  █  █    █      █    █  █  █▀▄█  ▀■■▄      
//████████        █▄▄▀  ▀▄▄▀    █      █    ▀▄▄▀  █ ▀█  ■▄▄▀      


void switch_drill(int theValue){
  drill_type--;
  if(drill_type<0) drill_type=drill_angle.length-1;
}

 void inverter(int theValue) {
  inverter=!inverter;
}

 void switch_view(int theValue){
  if(view_mode++==2)
  view_mode=0;
}

void save_cnc_file(int theValue) {
  add_code=true;
  save_code=true;
}

void add_new_pattern(){
  add_code=true;
}

void load_image(){
  noLoop();
  String thePath = benja_commander("Choose an image.",input_path(""),"Images only ( *.JPG *.PNG *.TGA *.TIF )", new String[] { "JPG", "JPEG", "PNG", "TIF", "TIFF", "TGA" });
  //println("thePath: "+thePath);
  String folder = get_folder(thePath);
  if(folder!= null) input_path=folder;
  read_image_file(thePath);
  loop();
}




/*
████████       █▄ ▄█  █▀▀▀  ▄▀▀■  ▄▀▀■  ▄▀▀▄  ▄▀▀▄  █▀▀▀        ▀█▀  █▄ █        █▄ ▄█  █▀▀▀  █▄ █  █  █  █▀▀▀ 
████████       █▀▄▀█  █■■   ▀■■▄  ▀■■▄  █■■█  █ ▄▄  █■■          █   █▀▄█        █▀▄▀█  █■■   █▀▄█  █  █  █■■  
████████       █ █ █  █▄▄▄  ■▄▄▀  ■▄▄▀  █  █  ▀▄▄▀  █▄▄▄        ▄█▄  █ ▀█        █ █ █  █▄▄▄  █ ▀█  ▀▄▄▀  █▄▄▄ 
*/

String[] menue_message_string = new String[8];
int menue_message_line =0;
boolean menue_message_printed =false;

void add_menue_message(String[] theString){
  if (menue_message_printed){
    menue_message_string = new String[8];
    menue_message_printed =false;
    menue_message_line=0;
  }
  for (int i=0; i<theString.length&& menue_message_line<menue_message_string.length; i++){
    menue_message_string[menue_message_line++]=theString[i];
  }
}

void menue_message(){
  if (menue_message_line>0){
    message(210,150,menue_width-230,c_f_attention,c_b_attention,180, menue_message_string);
    menue_message_printed =true;
  }
}

/*
████████       █▀▀▄  █     ▄▀▀▄  █  █  ▄▀▀▄  █▀▀▄  ▄▀▀▄  █  █  █▄ █  █▀▀▄       ████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █▀▀   █     █■■█  █▄▀   █ ▄▄  █▀▀▄  █  █  █  █  █▀▄█  █  █       ████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █     █▄▄▄  █  █  █     ▀▄▄▀  █  █  ▀▄▄▀  ▀▄▄▀  █ ▀█  █▄▄▀       ████████████████████████████████████████████████████████████████████████████████████████████████████
*/
/*
████████       ▄▀▀▄  █▀▀▄  ▀█▀  █▀▀▄ 
████████       █ ▄▄  █▀▀▄   █   █  █ 
████████       ▀▄▄▀  █  █  ▄█▄  █▄▄▀ 
*/

void draw_grid(){
  int maxwidth  =0;
  int maxheight =0;


  maxwidth=width-menue_width;
  maxheight=height;



  //lines
  //finding first line
  int x0=0;
  strokeWeight(1);
  for(int xx=-100; xx<max_size+100;xx+=10){
    if (x_on_screen(xx)>0){
      x0=xx;
      xx=max_size+100;
    }
  }
  //drawing lines
  for(int xx=x0;x_on_screen(xx)<maxwidth;xx+=10){
    if(is_multiple(xx,100)){
      stroke(c_f_objects);
      fill(c_f_objects);
    }
    else {
      stroke(c_f_objects,min(25*zoom,150));
      fill(c_f_objects,min(25*zoom,150));
    }
    line(x_on_screen(xx), 0, x_on_screen(xx), maxheight);
    text(round(xx)+" mm",x_on_screen(xx)+5,20);
  }

  //lines
  //finding first line
  int y0=0;
  for(int yy=-100; yy<max_size+100;yy+=10){
    if (y_on_screen(yy)>0){
      y0=yy;
      yy=max_size+100;
    }
  }
  //drawing lines
  for(int yy=y0;y_on_screen(yy)<maxheight;yy+=10){
    if(is_multiple(yy,100)){
      stroke(c_f_objects);
      fill (c_f_objects);
    }
    else {
      stroke(c_f_objects,min(25*zoom,150));
      fill(c_f_objects,min(25*zoom,150));
    }
    text(round(yy)+" mm",5,20+y_on_screen(yy));
    line(0,y_on_screen(yy), maxwidth, y_on_screen(yy));
  }
  stroke(c_f_objects);
  line(0,0,0,height);
}





//████████       █▀▀▄  █▀▀▄  ▀█▀  █     █          
//████████       █  █  █▀▀▄   █   █     █          
//████████       █▄▄▀  █  █  ▄█▄  █▄▄▄  █▄▄▄       

float bohr_spitze;

float[] drill_angle = new float[]{15
                                  ,30
                                  ,45
                                  ,60
                                  ,90
                                  ,118
                                  ,135
                                  ,150
                                  ,165
                                  ,180}; //winkel der Bohrerspitze, 90° ist ein flacher Bohrer, 0° ist parallel zum Bohrer und erzeugt eine Singularität, die die Erde verschluckt
String[] drill_names = new String[]{"15°"
                                    ,"30°  engraving cutter"
                                    ,"45°"
                                    ,"60°"
                                    ,"90°  conical cutter"
                                    ,"118° std. HSS drill"
                                    ,"135° std. hard metal drill"
                                    ,"150°"
                                    ,"175°"
                                    ,"180° plain milling cutter"};

void draw_a_drill(float xx, float yy,float scaling,float drill_length, String theString){
  translate(xx, scaling*yy);
  fill(c_background,255);
  beginShape(); // sketch outline of drill
  vertex(-scaling*drill_diameter/2, -drill_length*scaling);
  vertex(-scaling*drill_diameter/2, - bohr_spitze*scaling);
  vertex(0, 0);
  vertex(scaling*drill_diameter/2,  - bohr_spitze*scaling);
  vertex(scaling*drill_diameter/2, - drill_length*scaling);
  endShape();
  fill(c_fonts,255);
  display_text(theString,5,0,c_fonts,fonts_main_M);

}

void show_drill(int xx, int yy, float scaling) {
  float drill_length=0.20*scaling; // length of drill in mm
  pushMatrix();
  translate(xx, yy+110);
  strokeWeight(1);
  stroke(c_f_objects);
  int yi;
  line(0,0,scaling,0);
  for(yi =1;yi<=max(min_depth,max_depth)+1;yi++){
    line(0,yi*0.04*scaling,scaling,yi*0.04*scaling);
  }
  fill(c_fonts,255);
  display_text("material: "+(max(0.5,float(ceil(max_depth*2))/2))+"mm",0,(yi+1)*0.04*scaling,c_fonts,fonts_main_S);

  
  draw_a_drill(45,min_depth,0.04*scaling,drill_length,"Min");
  draw_a_drill(90,max_depth-min_depth,0.04*scaling,drill_length,"Max");
  popMatrix();

  fill(c_background);
  noStroke();
  rect(xx, 0,scaling, yy+60); //hide upper part of drills
  
  display_text("drill type:\n"+drill_diameter+" mm\n"+drill_names[drill_type],xx,yy,c_fonts,fonts_main_S);
  
    if(min_depth>max_depth){
    message(xx,yy,int(scaling),c_f_attention,c_b_attention,200, new String[]{
      "WARNING: Minimal depth is deeper than maximal depth! The image would be inverted. Min-depth will be readjusted.",
      "Please try the 'inverter' button!"
    });
  }

}

/*
████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████                                                            ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       ▄▀▀▄        ▄▀▀▄  ▄▀▀▄  █▀▀▄  █▀▀▀  ▄▀▀■             ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █ ▄▄  ▀▀▀▀  █     █  █  █  █  █■■   ▀■■▄             ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       ▀▄▄▀        ▀▄▄▀  ▀▄▄▀  █▄▄▀  █▄▄▄  ■▄▄▀             ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
*/

String last_added_g_code="";
boolean drill_is_up=true;

void add_g_code(String theString){
  // prevent to rewrite g-code lines with the same content, it yust slows down
  if(theString!=last_added_g_code){
    last_added_g_code=theString;
    move_counter++;
    g_code+="\n"+theString;
  }
}

void g_up(){
  drill_is_up=true;
  add_g_code("G0 Z2 F2000");//genauigkeit 0.4mm abweichung
//  fill(random(255));
//  rect(0,0,20,20);
}

void g_save_up(){
  drill_is_up=true;
  add_g_code("G0 Z10 F2000");//genauigkeit 0.4mm abweichung
}

void g_goto(float xx, float yy, float zz){
  if(zz<0){// will go down, so G1 & milling speed
    drill_is_up=false;
    //the y coordinate is zero at the bottom line of the cnc mill which results in a mirrored image, so i re-mirror the image by simply exchanging x and y
    add_g_code("G1 X"+round_decimals(yy,2)+" Y"+round_decimals(xx,2)+" Z"+round_decimals(zz,2)+" F"+milling_speed);
  }
  else if(!drill_is_up){ // is still down, so G1 & milling speed
    drill_is_up=true;  
    //the y coordinate is zero at the bottom line of the cnc mill which results in a mirrored image, so i re-mirror the image by simply exchanging x and y
    add_g_code("G1 X"+round_decimals(yy,2)+" Y"+round_decimals(xx,2)+" Z"+round_decimals(zz,2)+" F"+milling_speed);
  }
  else{ // is uo, stays up, make it fast G0 and max speed
    //the y coordinate is zero at the bottom line of the cnc mill which results in a mirrored image, so i re-mirror the image by simply exchanging x and y
    add_g_code("G0 X"+round_decimals(yy,2)+" Y"+round_decimals(xx,2)+" F2000");// drill is "airborne" -> maximum speed
  }
}

void g_set_precision(){
  if (precision>0){
    add_g_code("G64 P"+round_decimals(min(0.5,max(0.01,precision)),2));// conture mode, sacrifices exact corners for speed, so corners get rounded too
  }
  else {
    add_g_code("G64 P 0.01");//kills the g64 command
  }
}

void g_goto(float xx, float yy){
//the y coordinate is zero at the bottom line of the cnc mill which results in a mirrored image, so i re-mirror the image by simply exchanging x and y
  if( drill_is_up){
    add_g_code("G0 X"+round_decimals(yy,2)+" Y"+round_decimals(xx,2)+" F2000");// drill is "airborne" -> maximum speed
  } else {
    add_g_code("G1 X"+round_decimals(yy,2)+" Y"+round_decimals(xx,2)+" F"+milling_speed);//be precise and slow
  }
}

void g_goto(float zz){
  drill_is_up=false;
  add_g_code("G1 Z "+round_decimals(zz,2)+" F"+milling_speed);//be precise and slow
}

void g_proloque(){ //at the beginning of each file
    move_counter =0;
    last_added_g_code="";
    g_code = "";
    add_g_code("%");
    add_g_code("( made with cnc_rasterfahrer )");  
    add_g_code("( author benjamin w kiesewetter )");
    add_g_code("( Digital Analog Surfaces, 2012 institute of industrial design, magdeburg )");
    add_g_code("( Steffi Husslein Robert Laux Michael Bertuleit  )");
    add_g_code("( http://interaction-design-group.de/toolbox/ )");  
    add_g_code("G 54");
    g_save_up();
}

void g_init_raster() {//before adding a new raster
    g_save_up();
    add_g_code("(<<<<<<<< NEXT PATTERN "+pattern_list[pattern]+" >>>>>>>>)");  
    add_g_code("( image: "+get_filename(glb_image_file)+" )");
    g_set_precision();
    switch (pattern){
      
    }
}

String g_epiloque(String file_name){//at the end of each file
  g_save_up();
  add_g_code("M05"); //stop spinning
  g_goto(0,0);
  add_g_code("M02"); //end of programm
  add_g_code("%");
  return string_to_file(g_code,file_name);
}


/*
████████       █▀▀▄  ▄▀▀▄  ▀▀█▀▀  ▀▀█▀▀  █▀▀▀  █▀▀▄  █▄ █  ▄▀▀■       ████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █▀▀   █■■█    █      █    █■■   █▀▀▄  █▀▄█  ▀■■▄       ████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █     █  █    █      █    █▄▄▄  █  █  █ ▀█  ■▄▄▀       ████████████████████████████████████████████████████████████████████████████████████████████████████████████
*/

//████████       █▀▀▄  ▄▀▀▄  ▀▀█▀▀  ▀▀▀█             ████████      ████      ████      ████      ████
//████████       █  █  █  █    █     ▄▀              ████████      ████      ████      ████      ████
//████████       █▄▄▀  ▀▄▄▀    █    █▄▄▄             ████████      ████      ████      ████      ████


//    ••••••
//  ••••••••••
//  ••••••••••
//    ••••••



void make_g_dots(){

  PVector current_step=new PVector(0,0);
  boolean even = true;
  fill(get_mill_color());
  for (int yi=0;yi<pic_resized.height;yi++) {
    if (even) { //put dots in a forward line
      for (int xi=0; xi<pic_resized.width; xi++) {
        current_step=make_g_dot(xi, yi, current_step);
      }
    }
    else { // put dots in a backward line
      for (int xi=pic_resized.width;xi>0;xi--) {
        current_step=make_g_dot(xi-1, yi, current_step);
      }
    }
    even=!even;
  }
}



PVector make_g_dot(float xx, float yy, PVector current_step){
  float depth= get_tiefe_at(int(xx),int(yy));
  xx+=noise_factor*2*(0.5-noise(xx,yy,xx));
  yy+=noise_factor*2*(0.5-noise(xx,yy,yy));
  if(depth<0){
    if (add_code) { // write g-code
        g_goto(xx*step_dist,yy*step_dist);
        g_goto(depth);
        g_up();
        archive_dots.add(new PVector(xx*step_dist,yy*step_dist,drilled_diameter(depth))); // archive the dots for redrawing
    }
    line_or_point_counter++;
  
    float d=max(zoom*drilled_diameter(depth),1); //calculate dot diameter, make it at least 1 pixel to be seen
    ellipse(x_on_screen(xx*step_dist), y_on_screen(yy*step_dist),d,d); // draw a dot
    
    //draw the x/y path of the drill
    if(view_mode==2){
      strokeWeight(2);
      stroke(c_f_attention,150);
      line(x_on_screen(current_step.x*step_dist), y_on_screen(current_step.y*step_dist), x_on_screen(xx*step_dist), y_on_screen(yy*step_dist));
      stroke(get_mill_color(),150);//set back vor next point
    }
    return new PVector(xx,yy);
  }
  return current_step;
}


//████████       █     ▀█▀  █▄ █  █▀▀▀  ▀▀▀█       ████████      ████      ████      ████      ████      ████
//████████       █      █   █▀▄█  █■■    ▄▀        ████████      ████      ████      ████      ████      ████
//████████       █▄▄▄  ▄█▄  █ ▀█  █▄▄▄  █▄▄▄       ████████      ████      ████      ████      ████      ████

//____▄▄▄▄▄▄▄____
//__▄▄▄▄███▄▄▄▄__
//__▄▄▄▄███▄▄▄▄__
//____▄▄▄▄▄▄▄____


/*
████████       █     ▀█▀  █▄ █  █▀▀▀        ▀▄ ▄▀  █  █ 
████████       █      █   █▀▄█  █■■           █    █▄▀  
████████       █▄▄▄  ▄█▄  █ ▀█  █▄▄▄        ▄▀ ▀▄  █    
*/

PVector make_g_line(float xx, float yy, PVector current_step) {
 
  xx+=noise_factor*2*(0.5-noise(xx,yy,xx));
  yy+=noise_factor*2*(0.5-noise(xx,yy,yy));
  float depth= get_tiefe_at(round(xx),round(yy));
  if (add_code) {
    //g-code the line
    if(current_step.z<0){// we are down
      if(depth<0){// we stay down
      /* 3d movement - faster lines */
      g_goto(xx*step_dist,yy*step_dist,depth);
      /**/
      //archive the line
      archive_lines.add(new float[] {drilled_diameter(current_step.z),
                                      current_step.x*step_dist, 
                                      current_step.y*step_dist, 
                                      xx*step_dist, 
                                      yy*step_dist});
      }
      else{// we move up
      g_up();
      }
    } 
    else if(depth<0){// we are up, but go down
      // write g-code stepped movement - lines parallel to plane
       g_goto(xx*step_dist,yy*step_dist);
       g_goto(depth);
    }
  }

  // draw the line
  if(depth<0 && current_step.z<0){//only if both ends are down
    strokeWeight(zoom*drilled_diameter(current_step.z));
    line(x_on_screen(current_step.x*step_dist), y_on_screen(current_step.y*step_dist), x_on_screen(xx*step_dist), y_on_screen(yy*step_dist));
    line_or_point_counter++;
    // make some strange markings
    if(view_mode==2 && current_step.z<0){
      strokeWeight(1);
      stroke(c_f_attention,150);
      line(x_on_screen(xx*step_dist)-step_dist*zoom*0.4, y_on_screen(yy*step_dist)-step_dist*zoom*0.4,x_on_screen(xx*step_dist)+step_dist*zoom*0.4, y_on_screen(yy*step_dist)+step_dist*zoom*0.4);
      line(x_on_screen(xx*step_dist)-step_dist*zoom*0.4, y_on_screen(yy*step_dist)+step_dist*zoom*0.4,x_on_screen(xx*step_dist)+step_dist*zoom*0.4, y_on_screen(yy*step_dist)-step_dist*zoom*0.4);
      stroke(get_mill_color(),150);
      fill(c_f_objects,255);
      //text(""+position_counter++,x_on_screen(xx*step_dist),y_on_screen(yy*step_dist),0);
    }
  }
  return new PVector(xx,yy,depth);
}



/*
████████       █     ▀█▀  █▄ █  █▀▀▀        ▀▄ ▄▀  █  █  ▀▀▀█ 
████████       █      █   █▀▄█  █■■           █    █▄▀    ▄▀  
████████       █▄▄▄  ▄█▄  █ ▀█  █▄▄▄        ▄▀ ▀▄  █     █▄▄▄ 
*/

PVector make_g_line_2d(float xx, float yy, float depth, PVector current_step) {
    // used if i want to provoke a specifik depth like max depth for edges

  if (add_code) {
    //g-code the line
    if (depth<0||current_step.z<0) {
    archive_lines.add(new float[] {drilled_diameter(current_step.z),
                                        current_step.x*step_dist, 
                                        current_step.y*step_dist, 
                                        xx*step_dist, 
                                        yy*step_dist});

    }      /* 3d movement - faster lines */
    g_goto(xx*step_dist,yy*step_dist,depth);
  }

  // draw the line
  if(depth<0||current_step.z<0){
    strokeWeight(zoom*drilled_diameter(current_step.z));
    line(x_on_screen(current_step.x*step_dist), y_on_screen(current_step.y*step_dist), x_on_screen(xx*step_dist), y_on_screen(yy*step_dist));
    line_or_point_counter++;

  // make some strange markings
  if(view_mode==2 ){
      strokeWeight(1);
      stroke(c_f_attention,150);
      line(x_on_screen(xx*step_dist)-step_dist*zoom*0.4, y_on_screen(yy*step_dist)-step_dist*zoom*0.4,x_on_screen(xx*step_dist)+step_dist*zoom*0.4, y_on_screen(yy*step_dist)+step_dist*zoom*0.4);
      line(x_on_screen(xx*step_dist)-step_dist*zoom*0.4, y_on_screen(yy*step_dist)+step_dist*zoom*0.4,x_on_screen(xx*step_dist)+step_dist*zoom*0.4, y_on_screen(yy*step_dist)-step_dist*zoom*0.4);
      stroke(get_mill_color(),150);
      fill(c_f_objects,255);
      text(""+position_counter++,x_on_screen(xx*step_dist),y_on_screen(yy*step_dist),0);
    }
  }
  return new PVector(xx,yy,depth);
}


/*
████████       █  █  █▀▀▀  █▀▀▄  ▀▀█▀▀  ▀█▀  ▄▀▀▄  ▄▀▀▄  █          █  █  █
████████       █ █   █■■   █▀▀▄    █     █   █     █■■█  █          █  █  █
████████        █    █▄▄▄  █  █    █    ▄█▄  ▀▄▄▀  █  █  █▄▄▄       █  █  █
*/




void make_g_lines_vertical(){
  PVector current_step=new PVector(zoom*grid_offset.x,zoom*grid_offset.y,0);//a 3d vector with X,Y and Z=depth 
  stroke(get_mill_color());
  boolean even = true;
  for (int yi=0;yi<pic_resized.height;yi++) {
    if(add_code){ g_up();}
    if (even) { //put dots in a forward line
      current_step=new PVector(0,yi,0);
      for (int xi=0; xi<pic_resized.width; xi++) {
        current_step=make_g_line(xi, yi, current_step);
 
      }
    }
    else { // put dots in a backward line
      current_step=new PVector(pic_resized.width-1,yi,0);
      for (int xi=pic_resized.width;xi>0;xi--) {
        current_step=make_g_line(xi-1, yi, current_step);       
      }
    }
  even=!even;
  }
}

/*
████████       █  █  ▄▀▀▄  █▀▀▄  █▀▀▄  ▀█▀  ▀▀▀█  ▄▀▀▄  █▄ █  ▀▀█▀▀  ▄▀▀▄  █        ▀▀▀▀▀▀  
████████       █■■█  █  █  █▀▀▄  █▀▀▄   █    ▄▀   █  █  █▀▄█    █    █■■█  █        ■■■■■■
████████       █  █  ▀▄▄▀  █  █  █  █  ▄█▄  █▄▄▄  ▀▄▄▀  █ ▀█    █    █  █  █▄▄▄     ▄▄▄▄▄▄  
*/




void make_g_lines_horrizontal(){
  PVector current_step=new PVector(zoom*grid_offset.x,zoom*grid_offset.y,0);
  stroke(get_mill_color());
  boolean even = true;
  for (int xi=0;xi<pic_resized.width;xi++) {
    if(add_code){ g_up();}
    if (even) { //put dots in a forward line
      current_step=new PVector(xi,0,0);
      for (int yi=0; yi<pic_resized.height; yi++) {
        current_step=make_g_line( xi, yi, current_step);          
      }
    }
    else { // put dots in a backward line
      current_step=new PVector(xi, pic_resized.height-1,0);
      for (int yi=pic_resized.height;yi>0;yi--) {
        current_step=make_g_line( xi,yi-1, current_step);       
      }
    }
  even=!even;
  }
}

/*
████████       █▀▀▄  ▀█▀  ▄▀▀▄  ▄▀▀▄  ▄▀▀▄  █▄ █  ▄▀▀▄  █           █  █  █▀▀▄       ▄▀  ▄▀  ▄▀
████████       █  █   █   █■■█  █ ▄▄  █  █  █▀▄█  █■■█  █           █  █  █▀▀      ▄▀  ▄▀  ▄▀
████████       █▄▄▀  ▄█▄  █  █  ▀▄▄▀  ▀▄▄▀  █ ▀█  █  █  █▄▄▄        ▀▄▄▀  █      ▄▀  ▄▀  ▄▀
*/




void make_g_lines_up(){
  PVector current_step=new PVector(zoom*grid_offset.x,zoom*grid_offset.y,0);
  stroke(get_mill_color());
  boolean even = true;
  int xi=0;
  int yi=0;
  int maxx=pic_resized.width-1;
  int maxY=pic_resized.height-1;

  //First part: upper left corner to upper right corner 45° down left
  //  ////
  //  ///.
  //  //..
  //  /...

  for (xi=0;xi<pic_resized.width;xi++) {
    if(add_code){ g_up();}
    if (even) { //put dots in a forward line
      current_step=new PVector(xi,0,0);
      for (yi=0; yi<pic_resized.height && xi-yi>=0; yi++) {
        current_step=make_g_line( xi-yi, yi, current_step);          
      }
    }
    else { // put dots in a backward line
      //use the parameter from the last loop but check if it's too big (if it's at the bottom line)
      yi=min(xi,maxY);//after reaching the lower left corner
      current_step=new PVector(xi-yi, yi,0);
      for (yi=yi;yi>=0;yi--) {
        current_step=make_g_line( xi-yi,yi, current_step);       
      }
    }
    even=!even;
  }

  //Second part: from upper right -1 one line to to lower right corner 45° up right
  //  ....
  //  .../
  //  ..//
  //  .///

  even=true;
  for (yi=1;yi<pic_resized.height;yi++) {
    if(add_code){ g_up();}
    if (even) { //put dots in a forward line
        current_step=new PVector(pic_resized.width-1,yi,0);
      for (xi=maxx; xi>=0 && yi+maxx-xi<pic_resized.height; xi--) {
        current_step=make_g_line( xi, yi+maxx-xi, current_step);          
      }
    }
    else { // put dots in a backward line
      //use the parameter from the last loop but check if it's too big (if it's at the bottom line)
      xi=max(0,yi+maxx-maxY);
      current_step=new PVector(xi,yi+maxx-xi,0);
      for (xi=xi;xi<pic_resized.width;xi++) {
        current_step=make_g_line( xi,yi+maxx-xi, current_step);       
      }
    }
  even=!even;
  }
}

/*
████████       █▀▀▄  ▀█▀  ▄▀▀▄  ▄▀▀▄  ▄▀▀▄  █▄ █  ▄▀▀▄  █           █▀▀▄  ▄▀▀▄  █   █  █▄ █   ▀▄  ▀▄  ▀▄
████████       █  █   █   █■■█  █ ▄▄  █  █  █▀▄█  █■■█  █           █  █  █  █  █ █ █  █▀▄█     ▀▄  ▀▄  ▀▄
████████       █▄▄▀  ▄█▄  █  █  ▀▄▄▀  ▀▄▄▀  █ ▀█  █  █  █▄▄▄        █▄▄▀  ▀▄▄▀   █ █   █ ▀█       ▀▄  ▀▄  ▀▄
*/

void make_g_lines_down(){
  //println("g-lines-down");
  PVector current_step=new PVector(zoom*grid_offset.x,zoom*grid_offset.y,0);
  stroke(get_mill_color());
  boolean even = true;
  int xi=0;
  int yi=0;
  int maxx=pic_resized.width-1;
  int maxY=pic_resized.height-1;

  for (xi=0;xi<pic_resized.width;xi++) {
    if(add_code){ 
      g_up();
    }
    if (even) { //make in a forward line
      current_step=new PVector(xi,0,0);
      for (yi=0; yi<pic_resized.height && xi+yi<pic_resized.width; yi++) {
        current_step=make_g_line( xi+yi, yi, current_step);          
      }
    }
    else { // make in a backward line
      yi=min(maxx-xi,maxY);
      current_step=new PVector(xi+yi, yi,0);
      for (yi=yi;yi>=0 ;yi--) {
        current_step=make_g_line( xi+yi,yi, current_step);       
      }
    }
  even=!even;
  }

  
  even=true;
  for (yi=1;yi<pic_resized.height;yi++) {
    if(add_code){ g_up();}
    if (even) { //make in a forward line
      current_step=new PVector(0,yi,0);
      for (xi=0; xi<pic_resized.width && yi+xi<pic_resized.height; xi++) {
        current_step=make_g_line( xi, yi+xi, current_step);          
      }
    }
    else { // make in a backward line
      xi=min(maxY-yi,maxx);
      current_step=new PVector(xi, xi+yi,0);
      for (xi=xi;xi>=0;xi--) {
        current_step=make_g_line( xi,xi+yi, current_step);       
      }
    }
  even=!even;
  }
  
}



/*
████████       █▀▀▄  ▄▀▀▄  ▀▀█▀▀  █  █  ▄▀▀■ 
████████       █▀▀   █■■█    █    █■■█  ▀■■▄ 
████████       █     █  █    █    █  █  ■▄▄▀ 
*/




void make_g_contour(PImage pic_resized){ 
  //println("detecting edges with threshold "+(max_depth-min_depth)/(max_depth+1));

  stroke(get_mill_color());
  strokeWeight(zoom*drilled_diameter(max_depth));

  BlobDetection theEdges = new BlobDetection(pic_resized.width, pic_resized.height);
  theEdges.setPosDiscrimination(inverter);
  theEdges.setThreshold(edge_threshold/100);
  theEdges.computeBlobs(pic_resized.pixels);// theEdges now containes several edges
  //println(theEdges.getBlobNb()+" edges detected");
  Blob singleEdge; // tis will cointain a single edge

  EdgeVertex point_b;
  EdgeVertex point_a;
  int path_smoothing = 1;
  //path_smoothing=round(line_min_length);
  PVector current_step=new PVector (-10-path_smoothing,-10-path_smoothing,10); //let's pretend we are complete off the grid
  
  
  for (int n=0 ; n<theEdges.getBlobNb() ; n++){ //go through all the edges
    singleEdge=theEdges.getBlob(n);//
    if (singleEdge!=null){// Edges
      //println("edge "+n+" contains "+singleEdge.getEdgeNb()+" lines");
      
      if(add_code){ g_up();}
      current_step.z=1;
      //println("starting new outline "+n);
      for (int i=0;i<singleEdge.getEdgeNb();i+=path_smoothing){//leave out every second step
        point_a = singleEdge.getEdgeVertexB(i);
        point_b = singleEdge.getEdgeVertexB(i);
        if (point_a !=null && point_b !=null){ //this is a OK line, lets do it          
          if(dist(current_step.x, current_step.y, point_b.x*pic_resized.width, point_b.y*pic_resized.height)>path_smoothing+2+2*line_min_length){// in pixels
            //something is wrong, we are too far away
            if(add_code){ g_up();}
            current_step.z=1;//head lifted
            current_step=make_g_line_2d(point_a.x*pic_resized.width, point_a.y*pic_resized.height,1,current_step);//move into position            
          }
          if(current_step.z>=0){// we are in position, but up, so let's move down
            current_step=make_g_line_2d(current_step.x,current_step.y,-max_depth,current_step);            
          }
          if(dist(current_step.x, current_step.y,point_b.x*pic_resized.width, point_b.y*pic_resized.height)>line_min_length){
            current_step=make_g_line_2d(point_b.x*pic_resized.width, point_b.y*pic_resized.height,-max_depth,current_step);//make the line          
          }

        }
      }
    }
  }
}

CannyEdgeDetector detector = new CannyEdgeDetector();

/*
████████       █▀▀▀  ▄▀▀▄  ▄▀▀■  ▀▀█▀▀        █▀▀▄  ▄▀▀▄  ▀▀█▀▀  ▀▀█▀▀  █▀▀▀  █▀▀▄  █▄ █       ████      ████      ████      ████
████████       █■■   █■■█  ▀■■▄    █          █▀▀   █■■█    █      █    █■■   █▀▀▄  █▀▄█       ████      ████      ████      ████
████████       █     █  █  ■▄▄▀    █          █     █  █    █      █    █▄▄▄  █  █  █ ▀█       ████      ████      ████      ████
*/


void make_fast_pattern2(){
// calculating the patterns may take a while
// this is a fast pattern yust to show whats going on
// it cannot produce g-code

  float depth=0;
  stroke(get_mill_color());
  strokeWeight(zoom*drilled_diameter(-max_depth));
  for (int yi=0;yi<pic_resized.height;yi++) {
    for (int xi=0; xi<pic_resized.width; xi++) {
      // only shows dots where the brightness is below 50 percent:
      if(brightness(pic_resized.pixels[xi + yi*pic_resized.width])<127){
        point(x_on_screen(xi*step_dist), y_on_screen(yi*step_dist));
      }
    }
  }
}

void make_fast_pattern(){



// calculating the patterns may take a while
// this is a fast pattern yust to show whats going on
// it cannot produce g-code

  fill(get_mill_color());
  noStroke();
  float r = zoom*drilled_diameter(-max_depth);
  for (int yi=0;yi<pic_resized.height;yi++) {
    for (int xi=0; xi<pic_resized.width; xi++) {
      // only shows dots where the brightness is below 50 percent:
      if(brightness(pic_resized.pixels[xi + yi*pic_resized.width])<127){
        ellipse(x_on_screen(xi*step_dist), y_on_screen(yi*step_dist),r,r);
      }
    }



  }
}


float get_tiefe_at(int xx, int yy){
  int location= xx + yy*pic_resized.width; //pixels will be found in a 1d array, location
  if(location<0 || location>pic_resized.pixels.length-1){
    //println("ERROR off the grid at xy "+xx+" "+yy);
    return(-10); // off the grid so better pull up, should be ignored by calling function but easyier to programm.
  }
  float theValue=brightness(pic_resized.pixels[location]);
  //println("depth "+);
  if(inverter) return map(theValue, 0, 255, -min_depth,-max_depth); //inverted output
  return map(theValue, 255, 0, -min_depth,-max_depth);               //uninverted output
}

float drilled_diameter(float depth) {//calculate hole size
  if (depth>=0) return 0;
  if (abs(depth)<abs(bohr_spitze)) return abs(2*tan(radians(drill_angle[drill_type]/2))*depth);
  return drill_diameter;
}

float x_on_screen(float xy){
  return zoom*(xy + grid_offset.x);
}

float y_on_screen(float xy){
  return zoom*(xy + grid_offset.y);
}

color get_mill_color(){
  if(inverter && !save_code) return c_background;
  return c_foreground;
}

















/*
████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████                                                ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █▀▀▀  █▄ █  ▄▀▀▄  ▀█▀  █▄ █  █▀▀▀        ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █■■   █▀▄█  █ ▄▄   █   █▀▄█  █■■         ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █▄▄▄  █ ▀█  ▀▄▄▀  ▄█▄  █ ▀█  █▄▄▄        ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
*/




void draw_archive(){
  //println("drawing archive");
  stroke(get_mill_color(),180);
  for(int i=0; i<archive_dots.size(); i++){
    PVector archive_dot = (PVector) archive_dots.get(i);
    strokeWeight(zoom*archive_dot.z);
    point(x_on_screen(archive_dot.x), y_on_screen(archive_dot.y));
  }
  for(int i=0; i<archive_lines.size(); i++){
    float[] archive_line=(float[]) archive_lines.get(i);
    strokeWeight(zoom*archive_line[0]);
    line(x_on_screen(archive_line[1]), y_on_screen(archive_line[2]),x_on_screen(archive_line[3]),y_on_screen(archive_line[4]));
  }
  noStroke();
}

void reset_all(){
  archive_dots.clear();
  archive_lines.clear();
  move_counter=0;
  material_thickness=0;
  pattern_counter=0;
  //println("system reset");
}



String[] pattern_list = new String[]{"dots",
                                    "horrizontal Lines",
                                    "vertical lines",
                                    "diagonal Lines up",
                                    "diagonal Lines down",
                                    "edges",
                                    "levels"};
//available patterns, used for naming in drop down menue

/*
████████       █▀▀▄  █▀▀▄  ▄▀▀▄  ▄▀▀▄  █▀▀▀  ▄▀▀■  ▄▀▀■  ▄▀▀▄  █▀▀▄       ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █▀▀   █▀▀▄  █  █  █     █■■   ▀■■▄  ▀■■▄  █  █  █▀▀▄       ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
████████       █     █  █  ▀▄▄▀  ▀▄▄▀  █▄▄▄  ■▄▄▀  ■▄▄▀  ▀▄▄▀  █  █       ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
*/

String assembly_folder="";

void process_image(int xx, int yy) {
   
  if (add_code) {// Add code to g-code variable
    

    if(pattern_counter<1){ 
      assembly_folder="rfahrer_assembly_"+get_timestamp()+"\\"+"_"; //prepare new folder to save all files in
     /*add_menue_message(new String[]{"You added a pattern to the assembly."
                        ,"To save the assembly click on save_cnc_file."
                        ,"Until then you will not be able to change the drill, because all patterns will be added to one cnc file"
                        ,"To change the drill between patterns, please create several cnc files"});*/
     //println("drill menue deactivated");
    }

    pattern_counter++;
    g_init_raster();//write the g-code to begin a new raster
    material_thickness=max(material_thickness,ceil(max_depth));
    archive_texts+=("\n\nPATTERN "+pattern_counter+" - "+pattern_list[pattern]
                    +"\nimage: "+get_filename(glb_image_file)
                    +"\nsteps per line: "+steps_per_line
                    +"\nwidth: "+line_width+" mm"
                    +"\nheight: "+line_width*pic_resized.height/pic_resized.width+" mm"
                    +"\ndepth: "+max_depth+" mm");
  }

  if (save_code) {
  }
  
  steps_per_line=max(2,steps_per_line);//safety first: no zero divison
  step_dist=line_width/float(steps_per_line-1);
  bohr_spitze=0.5*drill_diameter/tan(radians(drill_angle[drill_type]/2)); //length of pointy part of drill
  
  pushMatrix();
  translate(xx, yy);
  fill(int(inverter)*c_foreground+int(!inverter)*c_background);
  rect(0, 0, width-menue_width, height);
  
  if(grid_dragging || zooming ){//safety first: no null pointer exception
    resize_image(steps_per_line);
    make_fast_pattern();
    draw_grid();

  } else { 

    position_counter=0;
    line_or_point_counter=0;

    if(view_mode==0) draw_archive();

    //println("pattern: "+pattern);
    switch (pattern){ // ██ LET'S DO THE MAGIC
      case 0 :
        resize_image(steps_per_line);
        precision=drilled_diameter(max_depth)/5;
        make_g_dots();
      break;
      case 1 :

        resize_image(steps_per_line);

        precision=drilled_diameter(max_depth)/5;

        make_g_lines_vertical();
    
      break;
      case 2 :
        resize_image(steps_per_line);
        precision=drilled_diameter(max_depth)/5;
        make_g_lines_horrizontal();        
      break;
      case 3 :
        resize_image(steps_per_line);
        precision=drilled_diameter(max_depth)/5;
        make_g_lines_up();
      break;    
      case 4 :
        resize_image(steps_per_line);
        precision=drilled_diameter(max_depth)/5;
        make_g_lines_down();
      break;    
      case 5 :
        resize_image(steps_per_line);
        precision=drilled_diameter(max_depth)/5;
        make_g_contour(pic_resized);
      break;
      case 6 :
        resize_image(steps_per_line);
        precision=drilled_diameter(max_depth)*2;
        make_g_contour(detect_edges(pic_resized, edge_threshold, 1.0));
      break;
    }

    if(view_mode==2 || add_code){
      image(pic_resized, (grid_offset.x+step_dist/2+pic_resized.width*step_dist)*zoom, (grid_offset.y-step_dist/2)*zoom, pic_resized.width*zoom*step_dist, pic_resized.height*zoom*step_dist);
    }

    draw_grid();

    if (save_code) {
      archive_texts+="\n\ndrill type: "+drill_diameter+" mm "+drill_names[drill_type]
                    +"\nmaterial: "+material_thickness+" mm"
                    +"\nestimated time: roughly "+round_decimals(move_counter/3600,1)+" hours";
      fill(get_mill_color());
      text(archive_texts, 80,100);
      archive_texts="";
    }

    if(add_code){
      message(50, 50,        400,     c_fonts,     c_b_objects,         220, new String[]{
      "g-code has been generated",
      "",
      "raster no. "+pattern_counter,
      "pattern: "+pattern_list[pattern],
      "",
      "drill type: "+drill_names[drill_type],
      "drill diameter: "+drill_diameter,
      "distance between steps: "+round_decimals(step_dist,2)+" mm",
      "steps per line: "+steps_per_line,
      "width: "+line_width+" mm",
      "height: "+line_width*pic_resized.height/pic_resized.width+" mm",
      "Material thickness: "+material_thickness+" mm!",
      "Roughly estimated time to build :"+round_decimals(move_counter/3600,2)+ "hours!",
      "",
      "[ OK ]"
      });
      if(!save_code){
        message(50, 300,        400,     c_fonts,     c_b_objects,         220, new String[]{
        "",
        "THIS HAS NOT BEEN SAVED YET",
        " press save_cnc_file or add another raster",
        "",
        });
      }
      //println(">>> pattern added to cart <<<");
    }

    if (save_code){
      g_proloque();
      reset_all();
      //println(">>> package delivered <<<");
    }
    
    add_code=false;
    build_sim=false;
    save_code=false;
  }
  popMatrix();

  loop();

}

/*
████████       █▀▀▄  █▀▀▀  ▄▀▀▄  █  █  █     ▄▀▀▄  █▀▀▄        █▀▀▀  ▀▄ ▄▀  █▀▀▄  █▀▀▄  █▀▀▀  ▄▀▀■  ▄▀▀■  ▀█▀  ▄▀▀▄  █▄ █  ▄▀▀■ 
████████       █▀▀▄  █■■   █ ▄▄  █  █  █     █■■█  █▀▀▄        █■■     █    █▀▀   █▀▀▄  █■■   ▀■■▄  ▀■■▄   █   █  █  █▀▄█  ▀■■▄ 
████████       █  █  █▄▄▄  ▀▄▄▀  ▀▄▄▀  █▄▄▄  █  █  █  █        █▄▄▄  ▄▀ ▀▄  █     █  █  █▄▄▄  ■▄▄▀  ■▄▄▀  ▄█▄  ▀▄▄▀  █ ▀█  ■▄▄▀ 

G0 Z2 F2000
G0 X[0-9]{1,3}.[0-9]{2} Y[0-9]{1,3}.[0-9]{2} F2000
G1 Z -[0-9]{1,3}.[0-9]{2} F2000
G0 Z2 F2000
*/
//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
//████████       benjamin w kiesewetter, www.noviquitaeten.de      ████████████████████████████████████████████████████████████████████████████████
//████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████

boolean debug = true;
int debug_number =0;

void debug_line(String line){ 
  if (debug) println(debug_number+++") "+line); 
}


//████████       █▀▀▀  ▀█▀  █     █▀▀▀        █  █  ▄▀▀▄  █▄ █  █▀▀▄  █     ▀█▀  █▄ █  ▄▀▀▄       ████████████████████████████████████
//████████       █■■    █   █     █■■         █■■█  █■■█  █▀▄█  █  █  █      █   █▀▄█  █ ▄▄       ████████████████████████████████████
//████████       █     ▄█▄  █▄▄▄  █▄▄▄        █  █  █  █  █ ▀█  █▄▄▀  █▄▄▄  ▄█▄  █ ▀█  ▀▄▄▀       ████████████████████████████████████

String string_to_file(String content, String filename){
  PrintWriter throw_out = createWriter(filename);
  throw_out.println(content);
  throw_out.flush(); // Writes the remaining data to the file
  throw_out.close();
  return filename;
}

String get_folder(String thePath){
  for (int i=thePath.length(); i>0; i--){
    if (thePath.charAt(i-1)=='\\'){
      return thePath.substring(0,i);
    }
  }
  return null;
}

String get_filename(String thePath){
  for (int i=thePath.length(); i>0; i--){
    if (thePath.charAt(i-1)=='\\'){
      return thePath.substring(i,thePath.length());
    }
  }
  return thePath;
}

//████████       █▀▀▄  █▀▀▀  █▄ █  ▀▀▀█  ▄▀▀▄        ▄▀▀▄  ▄▀▀▄  █▄ ▄█  █▄ ▄█  ▄▀▀▄  █▄ █  █▀▀▄  █▀▀▀  █▀▀▄       
//████████       █▀▀▄  █■■   █▀▄█     █  █■■█        █     █  █  █▀▄▀█  █▀▄▀█  █■■█  █▀▄█  █  █  █■■   █▀▀▄       
//████████       █▄▄▀  █▄▄▄  █ ▀█  ▀▄▄▀  █  █        ▀▄▄▀  ▀▄▄▀  █ █ █  █ █ █  █  █  █ ▀█  █▄▄▀  █▄▄▄  █  █       

/*
import javax.swing.*;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;
import javax.swing.filechooser.FileNameExtensionFilter;
*/

String benja_commander(String title, String opening_path, String filter_comment,String extension_list[]){ 
//Filter comment like "image files" or "txt and pdf files"
// RETURNS a File path if good / "bad" if bad / "" if canceled
  JFileChooser benja_commander = new JFileChooser(opening_path);   // create file chooser 
  benja_commander.setDialogTitle(title);
  boolean extension_match = true;
  if (extension_list.length>0){ //there are extensions to be checked
    benja_commander.setFileFilter(new FileNameExtensionFilter(filter_comment,extension_list));
    extension_match=false; //Must check extensions again later
  }
  int return_val;
  return_val = benja_commander.showOpenDialog(this); // in response to a button click: 

  if (return_val != JFileChooser.APPROVE_OPTION) return ""; //██ RETURN CANCELED
  
  File open_file = benja_commander.getSelectedFile(); 

  if (extension_match) return open_file.getPath(); //██ RETURN GOOD

  String Filename = open_file.getName().toUpperCase();
  for(int i=0; i<extension_list.length; i++)
  {

    if (Filename.endsWith(extension_list[i].toUpperCase())) return open_file.getPath(); //██ RETURN GOOD

  }

  return "bad"; //██ RETURN ERROR

}

//████████       ▀▀█▀▀  █▀▀▀  ▀▄ ▄▀  ▀▀█▀▀  █   █  █▀▀▄  ▄▀▀▄  █▀▀▄ 
//████████         █    █■■     █      █    █ █ █  █▀▀▄  █■■█  █▀▀  
//████████         █    █▄▄▄  ▄▀ ▀▄    █     █ █   █  █  █  █  █    

// Function to return an ArrayList of Strings

float pixelWidth(String theString, float charwidth){
  float current_width = 0;    // Accumulate width of chars
  for(int i=0; i< theString.length(); i++) {
    // Current char
    char c = theString.charAt(i);
    if(charwidth>0){ //did somebody tell us the pixel width of the characters (monowidth only)
      current_width += charwidth;
    }else{ 
      current_width += textWidth(c); // accumulate width
    }
  }
  return current_width;
}

ArrayList wordWrap(String theString, int maxWidth, float charwidth) {
  // Make an empty ArrayList
  ArrayList theOutput = new ArrayList();
  float current_width = 0;    // Accumulate width of chars
  int last_break_position = 0; // Remember where the last space was
  for(int i=0; i< theString.length(); i++) {
    // Current char
    char c = theString.charAt(i);
    if(charwidth>0){ //did somebody tell us the pixel width of the characters (monowidth only)
      current_width += charwidth;
    }else{ 
      current_width += textWidth(c); // accumulate width
    }
    if (c == ' '||c == '/'||c == '\\') last_break_position = i; // could be a good spot for a break
    if (current_width > maxWidth) {  // Have we reached the end of a line?
      if(last_break_position==0){ 
        last_break_position=i;//Oh oh! no spots for a break found yet... lets make one!!!
      }
      String sub = theString.substring(0,last_break_position); // Make a substring
      // Chop off space at beginning
      if (sub.length() > 0 && sub.charAt(0) == ' ') sub = sub.substring(1,sub.length());
      // Add substring to the list
      theOutput.add(sub);
      // Reset everything
      theString = theString.substring(last_break_position,theString.length());
      i = 0; //shortended the string so start over again with the rest
      current_width = 0;
      last_break_position = 0;
    } 
  }
  if (theString.length() > 0 && theString.charAt(0) == ' '){ 
    theString = theString.substring(1,theString.length());   // Take care of the last remaining line
  }
  theOutput.add(theString);
  return theOutput;
}

//████████       █▄ ▄█  █▀▀▀  ▄▀▀■  ▄▀▀■  ▄▀▀▄  ▄▀▀▄  █▀▀▀  ▄▀▀■ 
//████████       █▀▄▀█  █■■   ▀■■▄  ▀■■▄  █■■█  █ ▄▄  █■■   ▀■■▄ 
//████████       █ █ █  █▄▄▄  ■▄▄▀  ■▄▄▀  █  █  ▀▄▄▀  █▄▄▄  ■▄▄▀ ▄▄▄▄▄▄


PFont message_font; //IMPORTANT must at leas exist, change in setup if you like

String randomButton(){
  String[] stupidthings= new String[]{"Coffee","Pizza","Ice Cream","Go swimming","Call Mum","Fix bike","Find glasses","Find keys","Get a free wish","Click here to click here","Don't press","Random Button","Turn Earth Poles","Switch of lights in Uqbar","Whatever","Quit Smoking","Peace"," ... ","OK","very OK","Double OK","Tribble OK","not OK","] Button insideout [","fourtytwo","KO","switch off winter","Uhhh What?"};
  return stupidthings[floor(random(0,stupidthings.length-0.1))];
}


void message(int xx, int yy, color f_color, color b_color, int b_alpha, String message_text[])
{ //self adjusting size


  int fontheight =14;
  int fontwidth =8;
  float wwidth=0;
  for(int i=0; i<message_text.length; i++){
    wwidth = max( wwidth, pixelWidth(message_text[i], 0)  );
  }
  strokeWeight(1);
  stroke(f_color);
  fill(b_color,b_alpha);
  rect(xx,yy,wwidth,(message_text.length+2)*fontheight);
  fill(f_color);
  for(int i=0; i<message_text.length; i++){
    text(" "+message_text[i] ,xx,yy+fontheight*(i+2));
  }
}

//▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄

void message(int xx, int yy, int wwidth, color f_color, color b_color, int b_alpha, String message_text[])
{ //defined width -> self adjusting height automatical wordwrapping
  

  int fontheight =14;
  int fontwidth =8;
  int steg=10;

  ArrayList all_lines = new ArrayList();
  all_lines.add("");
  all_lines.add("");
  for(int i=0; i<message_text.length; i++){ //check how many lines ther will be
    ArrayList some_lines =wordWrap(message_text[i],wwidth-2*steg,fontwidth);
    for(int j=0; j<some_lines.size(); j++){
      all_lines.add(some_lines.get(j));
    }
  }
  strokeWeight(1);
  stroke(f_color);
  fill(b_color,b_alpha);
  rect(xx,yy,wwidth,all_lines.size()*fontheight);

  fill(f_color);
  int current_line=2;
  for(int i=0; i<all_lines.size(); i++){
    text(""+all_lines.get(i) ,steg+xx,yy+fontheight*i);
  }
}

void display_text(String theString, float xx,float yy, color cc, PFont theFont){
    fill(cc);

    text(theString,xx,yy);
}

/*
████████       █▄ ▄█  ▄▀▀▄  ▀▀█▀▀  █  █ 
████████       █▀▄▀█  █■■█    █    █■■█ 
████████       █ █ █  █  █    █    █  █ 
*/

boolean is_multiple(float theValue, float theFloat){
  theValue/=theFloat;
  if(round(theValue)==theValue){
    return true;
  }
  return false;
}

float round_decimals(float value, int decimals)
{
  float faktor = pow(10, decimals);
  return round(value*faktor)/faktor;
}


/*
████████       ▀▀█▀▀  ▀█▀  █▄ ▄█  █▀▀▀  ▄▀▀■  ▀▀█▀▀  ▄▀▀▄  █▄ ▄█  █▀▀▄ 
████████         █     █   █▀▄▀█  █■■   ▀■■▄    █    █■■█  █▀▄▀█  █▀▀  
████████         █    ▄█▄  █ █ █  █▄▄▄  ■▄▄▀    █    █  █  █ █ █  █    
*/

String get_timestamp() {
  return String.format("%1$ty.%1$tm.%1$td-%1$tH.%1$tM.%1$tS", Calendar.getInstance());
}

String get_short_timestamp() {
  return Calendar.getInstance().hashCode()+"";
}

PImage detect_edges(PImage theValue, float min, float max) {
  CannyEdgeDetector detector = new CannyEdgeDetector();

  detector.setLowThreshold(min);
  detector.setHighThreshold(max);

   detector.setSourceImage((java.awt.image.BufferedImage)theValue.getImage());
   detector.process();
   BufferedImage edges = detector.getEdgesImage();
   return new PImage(edges);
}

public class CannyEdgeDetector {

    // statics

    private final static float GAUSSIAN_CUT_OFF = 0.005f;
    private final static float MAGNITUDE_SCALE = 100F;
    private final static float MAGNITUDE_LIMIT = 1000F;
    private final static int MAGNITUDE_MAX = (int) (MAGNITUDE_SCALE * MAGNITUDE_LIMIT);

    // fields

    private int height;
    private int width;
    private int picsize;
    private int[] data;
    private int[] magnitude;
    private BufferedImage sourceImage;
    private BufferedImage edgesImage;

    private float gaussianKernelRadius;
    private float lowThreshold;
    private float highThreshold;
    private int gaussianKernelWidth;
    private boolean contrastNormalized;

    private float[] xConv;
    private float[] yConv;
    private float[] xGradient;
    private float[] yGradient;

    // constructors

    /**
     * Constructs a new detector with default parameters.
     */

    public CannyEdgeDetector() {
        lowThreshold = 2.5f;
        highThreshold = 7.5f;
        gaussianKernelRadius = 2f;
        gaussianKernelWidth = 16;
        contrastNormalized = false;
    }



    public BufferedImage getSourceImage() {
        return sourceImage;
    }


    public void setSourceImage(BufferedImage image) {
        sourceImage = image;
    }


    public BufferedImage getEdgesImage() {
        return edgesImage;
    }


    public void setEdgesImage(BufferedImage edgesImage) {
        this.edgesImage = edgesImage;
    }


    public float getLowThreshold() {
        return lowThreshold;
    }


    public void setLowThreshold(float threshold) {
        if (threshold < 0) throw new IllegalArgumentException();
        lowThreshold = threshold;
    }

    public float getHighThreshold() {
        return highThreshold;
    }


    public void setHighThreshold(float threshold) {
        if (threshold < 0) throw new IllegalArgumentException();
        highThreshold = threshold;
    }

    public int getGaussianKernelWidth() {
        return gaussianKernelWidth;
    }

    public void setGaussianKernelWidth(int gaussianKernelWidth) {
        if (gaussianKernelWidth < 2) throw new IllegalArgumentException();
        this.gaussianKernelWidth = gaussianKernelWidth;
    }

    public float getGaussianKernelRadius() {
        return gaussianKernelRadius;
    }

    public void setGaussianKernelRadius(float gaussianKernelRadius) {
        if (gaussianKernelRadius < 0.1f) throw new IllegalArgumentException();
        this.gaussianKernelRadius = gaussianKernelRadius;
    }

    public boolean isContrastNormalized() {
        return contrastNormalized;
    }

    public void setContrastNormalized(boolean contrastNormalized) {
        this.contrastNormalized = contrastNormalized;
    }

    // methods

    public void process() {
        width = sourceImage.getWidth();
        height = sourceImage.getHeight();
        picsize = width * height;
        initArrays();
        readLuminance();
        if (contrastNormalized) normalizeContrast();
        computeGradients(gaussianKernelRadius, gaussianKernelWidth);
        int low = Math.round(lowThreshold * MAGNITUDE_SCALE);
        int high = Math.round( highThreshold * MAGNITUDE_SCALE);
        performHysteresis(low, high);
        thresholdEdges();
        writeEdges(data);
    }

    // private utility methods

    private void initArrays() {
        if (data == null || picsize != data.length) {
            data = new int[picsize];
            magnitude = new int[picsize];

            xConv = new float[picsize];
            yConv = new float[picsize];
            xGradient = new float[picsize];
            yGradient = new float[picsize];
        }
    }
    private void computeGradients(float kernelRadius, int kernelWidth) {

        //generate the gaussian convolution masks
        float kernel[] = new float[kernelWidth];
        float diffKernel[] = new float[kernelWidth];
        int kwidth;
        for (kwidth = 0; kwidth < kernelWidth; kwidth++) {
            float g1 = gaussian(kwidth, kernelRadius);
            if (g1 <= GAUSSIAN_CUT_OFF && kwidth >= 2) break;
            float g2 = gaussian(kwidth - 0.5f, kernelRadius);
            float g3 = gaussian(kwidth + 0.5f, kernelRadius);
            kernel[kwidth] = (g1 + g2 + g3) / 3f / (2f * (float) Math.PI * kernelRadius * kernelRadius);
            diffKernel[kwidth] = g3 - g2;
        }

        int initX = kwidth - 1;
        int maxX = width - (kwidth - 1);
        int initY = width * (kwidth - 1);
        int maxY = width * (height - (kwidth - 1));

        //perform convolution in x and y directions
        for (int x = initX; x < maxX; x++) {
            for (int y = initY; y < maxY; y += width) {
                int index = x + y;
                float sumX = data[index] * kernel[0];
                float sumY = sumX;
                int xOffset = 1;
                int yOffset = width;
                for(; xOffset < kwidth ;) {
                    sumY += kernel[xOffset] * (data[index - yOffset] + data[index + yOffset]);
                    sumX += kernel[xOffset] * (data[index - xOffset] + data[index + xOffset]);
                    yOffset += width;
                    xOffset++;
                }

                yConv[index] = sumY;
                xConv[index] = sumX;
            }

        }

        for (int x = initX; x < maxX; x++) {
            for (int y = initY; y < maxY; y += width) {
                float sum = 0f;
                int index = x + y;
                for (int i = 1; i < kwidth; i++)
                    sum += diffKernel[i] * (yConv[index - i] - yConv[index + i]);

                xGradient[index] = sum;
            }

        }

        for (int x = kwidth; x < width - kwidth; x++) {
            for (int y = initY; y < maxY; y += width) {
                float sum = 0.0f;
                int index = x + y;
                int yOffset = width;
                for (int i = 1; i < kwidth; i++) {
                    sum += diffKernel[i] * (xConv[index - yOffset] - xConv[index + yOffset]);
                    yOffset += width;
                }

                yGradient[index] = sum;
            }

        }

        initX = kwidth;
        maxX = width - kwidth;
        initY = width * kwidth;
        maxY = width * (height - kwidth);
        for (int x = initX; x < maxX; x++) {
            for (int y = initY; y < maxY; y += width) {
                int index = x + y;
                int indexN = index - width;
                int indexS = index + width;
                int indexW = index - 1;
                int indexE = index + 1;
                int indexNW = indexN - 1;
                int indexNE = indexN + 1;
                int indexSW = indexS - 1;
                int indexSE = indexS + 1;

                float xGrad = xGradient[index];
                float yGrad = yGradient[index];
                float gradMag = hypot(xGrad, yGrad);

                //perform non-maximal supression
                float nMag = hypot(xGradient[indexN], yGradient[indexN]);
                float sMag = hypot(xGradient[indexS], yGradient[indexS]);
                float wMag = hypot(xGradient[indexW], yGradient[indexW]);
                float eMag = hypot(xGradient[indexE], yGradient[indexE]);
                float neMag = hypot(xGradient[indexNE], yGradient[indexNE]);
                float seMag = hypot(xGradient[indexSE], yGradient[indexSE]);
                float swMag = hypot(xGradient[indexSW], yGradient[indexSW]);
                float nwMag = hypot(xGradient[indexNW], yGradient[indexNW]);
                float tmp;

                if (xGrad * yGrad <= (float) 0 /*(1)*/
                    ? Math.abs(xGrad) >= Math.abs(yGrad) /*(2)*/
                        ? (tmp = Math.abs(xGrad * gradMag)) >= Math.abs(yGrad * neMag - (xGrad + yGrad) * eMag) /*(3)*/
                            && tmp > Math.abs(yGrad * swMag - (xGrad + yGrad) * wMag) /*(4)*/
                        : (tmp = Math.abs(yGrad * gradMag)) >= Math.abs(xGrad * neMag - (yGrad + xGrad) * nMag) /*(3)*/
                            && tmp > Math.abs(xGrad * swMag - (yGrad + xGrad) * sMag) /*(4)*/
                    : Math.abs(xGrad) >= Math.abs(yGrad) /*(2)*/
                        ? (tmp = Math.abs(xGrad * gradMag)) >= Math.abs(yGrad * seMag + (xGrad - yGrad) * eMag) /*(3)*/
                            && tmp > Math.abs(yGrad * nwMag + (xGrad - yGrad) * wMag) /*(4)*/
                        : (tmp = Math.abs(yGrad * gradMag)) >= Math.abs(xGrad * seMag + (yGrad - xGrad) * sMag) /*(3)*/
                            && tmp > Math.abs(xGrad * nwMag + (yGrad - xGrad) * nMag) /*(4)*/
                    ) {
                    magnitude[index] = gradMag >= MAGNITUDE_LIMIT ? MAGNITUDE_MAX : (int) (MAGNITUDE_SCALE * gradMag);
                    //NOTE: The orientation of the edge is not employed by this
                    //implementation. It is a simple matter to compute it at
                    //this point as: Math.atan2(yGrad, xGrad);
                } else {
                    magnitude[index] = 0;
                }
            }
        }
    }

    private float hypot(float x, float y) {
        return (float) Math.hypot(x, y);
    }

    private float gaussian(float x, float sigma) {
        return (float) Math.exp(-(x * x) / (2f * sigma * sigma));
    }

    private void performHysteresis(int low, int high) {

        Arrays.fill(data, 0);

        int offset = 0;
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                if (data[offset] == 0 && magnitude[offset] >= high) {
                    follow(x, y, offset, low);
                }
                offset++;
            }
        }
    }

    private void follow(int x1, int y1, int i1, int threshold) {
        int x0 = x1 == 0 ? x1 : x1 - 1;
        int x2 = x1 == width - 1 ? x1 : x1 + 1;
        int y0 = y1 == 0 ? y1 : y1 - 1;
        int y2 = y1 == height -1 ? y1 : y1 + 1;

        data[i1] = magnitude[i1];
        for (int x = x0; x <= x2; x++) {
            for (int y = y0; y <= y2; y++) {
                int i2 = x + y * width;
                if ((y != y1 || x != x1)
                    && data[i2] == 0 
                    && magnitude[i2] >= threshold) {
                    follow(x, y, i2, threshold);
                    return;
                }
            }
        }
    }

    private void thresholdEdges() {
        for (int i = 0; i < picsize; i++) {
            data[i] = data[i] > 0 ? -1 : 0xff000000;
        }
    }

    private int luminance(float r, float g, float b) {
        return Math.round(0.299f * r + 0.587f * g + 0.114f * b);
    }

    private void readLuminance() {
        int type = sourceImage.getType();
        if (type == BufferedImage.TYPE_INT_RGB || type == BufferedImage.TYPE_INT_ARGB) {
            int[] pixels = (int[]) sourceImage.getData().getDataElements(0, 0, width, height, null);
            for (int i = 0; i < picsize; i++) {
                int p = pixels[i];
                int r = (p & 0xff0000) >> 16;
                int g = (p & 0xff00) >> 8;
                int b = p & 0xff;
                data[i] = luminance(r, g, b);
            }
        } else if (type == BufferedImage.TYPE_BYTE_GRAY) {
            byte[] pixels = (byte[]) sourceImage.getData().getDataElements(0, 0, width, height, null);
            for (int i = 0; i < picsize; i++) {
                data[i] = (pixels[i] & 0xff);
            }
        } else if (type == BufferedImage.TYPE_USHORT_GRAY) {
            short[] pixels = (short[]) sourceImage.getData().getDataElements(0, 0, width, height, null);
            for (int i = 0; i < picsize; i++) {
                data[i] = (pixels[i] & 0xffff) / 256;
            }
        } else if (type == BufferedImage.TYPE_3BYTE_BGR) {
            byte[] pixels = (byte[]) sourceImage.getData().getDataElements(0, 0, width, height, null);
            int offset = 0;
            for (int i = 0; i < picsize; i++) {
                int b = pixels[offset++] & 0xff;
                int g = pixels[offset++] & 0xff;
                int r = pixels[offset++] & 0xff;
                data[i] = luminance(r, g, b);
            }
        } else {
            throw new IllegalArgumentException("Unsupported image type: " + type);
        }
    }

    private void normalizeContrast() {
        int[] histogram = new int[256];
        for (int i = 0; i < data.length; i++) {
            histogram[data[i]]++;
        }
        int[] remap = new int[256];
        int sum = 0;
        int j = 0;
        for (int i = 0; i < histogram.length; i++) {
            sum += histogram[i];
            int target = sum*255/picsize;
            for (int k = j+1; k <=target; k++) {
                remap[k] = i;
            }
            j = target;
        }

        for (int i = 0; i < data.length; i++) {
            data[i] = remap[data[i]];
        }
    }

    private void writeEdges(int pixels[]) {
        if (edgesImage == null) {
            edgesImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        }
        edgesImage.getWritableTile(0, 0).setDataElements(0, 0, width, height, pixels);
    }

}


