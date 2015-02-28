
//Alphabet Strung - Nicholas Mei (not all variables are used, code is still fairly unclean)
Running_word running_word; //running word class

//DECLARATIONS
String message = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z";

PFont font;

float[] pos_x = new float[10];
float[] pos_y = new float[10];
float[] distance_between = new float[9];

int[] line_end_index = new int[10];

int char_count;
int point_count;
int line_count;

boolean show_words;

//SETUP
void setup()
{
  size(800,800);
  background(0);
  smooth();  

  running_word = new Running_word();

  font = loadFont("AngsanaNew-BoldItalic-24.vlw");
  textFont(font,24);
  textAlign(CENTER);

  line_end_index[0] = 0; //the first point of the first line is 0!

  char_count = 0;
  point_count = 0;
  line_count = 0;

  show_words = false;
}

//DRAW FUNCTION
void draw()
{    
  if (mousePressed == true)
  {    
    draw_and_archive();
  }

  running_word.v1_display();
}

//EVENT HANDLERS
void mouseReleased()
{
  background(0);
  //lighter line upon mouse release  
  stroke(#FFFFFF, 40);

  //draw values stored from draw_and_archive function
  draw_memory();

  //only show words after mouse is released
  show_words = true;

  //after releasing the mouse the number of lines has gone up 1!
  line_count++;

  //make sure we don't have more lines than there are index spaces!  
  if (line_count == line_end_index.length)
  {
    line_end_index = expand(line_end_index, line_end_index.length + 1);
  }   

  //record the x_pos,y_pos index for the last point of the line! See draw_and_archive function
  //start counting lines from "one"
  line_end_index[line_count] = point_count;
}  

void mouseClicked()
{
  if (mouseButton == RIGHT)
  {
    background(0);
    
    char_count = 0;
    point_count = 0;
    line_count = 0;
    
    show_words = false;
    
    for (int i = 0; i < pos_x.length; i++)
    {
       pos_x[i] = 0;
       pos_y[i] = 0; 
       
    }
  }
  
 
  redraw();
}


//FUNCTIONS
//function to draw a curve and simultaneously record the points used to make curve
//also calculated distances between points used
void draw_and_archive()
{
  if (point_count == pos_x.length)
  {
    pos_x = expand(pos_x, pos_x.length+2); 
    pos_y = expand(pos_y, pos_y.length+2);
  }   
  stroke(#FFFFFF);
  beginShape();
  curveVertex(pmouseX, pmouseY);
  curveVertex(pmouseX, pmouseY);
  pos_x[point_count] = pmouseX;
  pos_y[point_count] = pmouseY;
  point_count++;
  curveVertex(mouseX, mouseY);
  curveVertex(mouseX, mouseY);     
  pos_x[point_count] = mouseX;
  pos_y[point_count] = mouseY;
  point_count++;     
  endShape(); 
}

//function to draw values stored from draw_and_archive function
void draw_memory()
{
  for (int i = 0; i < pos_x.length;)
  {        
    beginShape();
    curveVertex(pos_x[i],pos_y[i]);
    curveVertex(pos_x[i],pos_y[i]);
    i++;
    curveVertex(pos_x[i],pos_y[i]);
    curveVertex(pos_x[i],pos_y[i]);
    i++;    
    endShape();
  }
}

//CLASSES
//rather unfinished at this point...
class Running_word
{

  Running_word()
  {
  }

  void v1_display ()
  {
    
    if (show_words == true)
    {
      for (int i = 1; i < pos_x.length; i+= 2)
      { 
        if (char_count >= message.length())
        {
          char_count = 0;
        } 
        
        char current_char = message.charAt(char_count);
        float char_width = textWidth(current_char);
        
        float angle = atan2(pos_y[i]-pos_y[i-1],pos_x[i]-pos_x[i-1]);
        
        //if (distance_between[(i-1)/2] >= char_width)
        {
          pushMatrix();
          translate(pos_x[i], pos_y[i]);
          rotate(angle);
          text(current_char,0,0);
          popMatrix();
          char_count++;
        }
      }
      show_words = false;
    }
  }
}


