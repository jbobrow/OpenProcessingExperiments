
//classes:

interf interf_new = new interf();
interact interact_new = new interact();
data_read data_read_new = new data_read();
data_organise data_organise_new = new data_organise();
draw_circle draw_circle_new = new draw_circle();
draw_letters draw_letters_new = new draw_letters();
lines lines_new = new lines();
count count_new = new count();

//collors

color selected = color(100,255,255);//color(65,126,192);
color on = color(0,255,255);
color alw = color(35,177,230);
color bg = color(0,0,0);//color(255,206,6);
color curs = color(255,0,0);//color(255,206,6);

//variables:

int file_width = 11;
int file_height = 200;
String data[][] = new String [file_height+10][file_width+10];  



float r = 150;

int h_m_l; //how many lessons are there?
String all[][]  = new String [file_height+10][file_width+10];

  //fonts:

PFont v24;

void setup() {
  
  //basics:
  smooth();
  size(900,500);
  frameRate(30);

  //initialisation:
  v24 = loadFont("verdana_24.vlw");
  
  textFont(v24,12);
  
  //run at start: 
  data_read_new.run();
  data_organise_new.run();
  draw_circle_new.initiate();
  draw_letters_new.initiate();
    
}


void draw() {

  background(bg);
  

  
  
  draw_circle_new.run();
  draw_letters_new.run();
  //interact_new.rotation();
  interact_new.closer();
  //interact_new.zoom();
  lines_new.run();
  count_new.run();
  interf_new.run();
  interf_new.info();
  
        
      //  mouse
      
         noCursor();
         fill(curs);
         noStroke();
         ellipse(mouseX,mouseY,3,3);
         fill(curs,100);
         ellipse(mouseX,mouseY,6,6);
         fill(curs,50);
         ellipse(mouseX,mouseY,14,14);
  
}

//interaction:

void mousePressed() {
       if (interact_new.closer_distance < 5) {
        if (mouseButton == LEFT) {
           interact_new.checked[interact_new.closer_l] = 1;

        } 

        if (mouseButton == RIGHT) {
           interact_new.checked[interact_new.closer_l] = 0;
        }
        
        
      }}
      
      
void mouseDragged() 
{
  if (mouseButton == LEFT) {
  if(mouseX>width/2){
    interact_new.deg = interact_new.deg + map(mouseY-pmouseY,0,height/2,0,1);
  }else{
    interact_new.deg = interact_new.deg - map(mouseY-pmouseY,0,height/2,0,1);   
  }
  }
  
  if (mouseButton == RIGHT) {
    r = r + map(mouseY-pmouseY,0,height/2,0,50) + map(mouseX-pmouseX,0,height/2,0,50);
    if(r<50){r=50;}
    if(r>400){r=400;}
  }
  
}




