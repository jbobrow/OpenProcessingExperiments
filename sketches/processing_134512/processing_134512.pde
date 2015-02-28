
// Create bubbles
Bubble bubble1;
Bubble bubble2;
Bubble bubble3;
Bubble bubble4;
Bubble bubble5;
Bubble bubble6;
Bubble bubble7;
Bubble bubble8;
Bubble bubble9;
Bubble bubble10;
Bubble bubble11;
Bubble bubble12;
Bubble bubble13;
Bubble bubble14;


Bubble[] bubbles;


void setup () {
  size(500,500);  
  
  // Create bubbles
  bubble1 = new Bubble("16-19.csv");
  bubble2 = new Bubble("16andover.csv");
  bubble3 = new Bubble("20-24.csv");
  bubble4 = new Bubble("25-29.csv");
  bubble5 = new Bubble("30-34.csv");
  bubble6 = new Bubble("35-39.csv");
  bubble7 = new Bubble("40-44.csv");
  bubble8 = new Bubble("45-49.csv");
  bubble9 = new Bubble("50-54.csv");
  bubble10 = new Bubble("55-59.csv");
  bubble11 = new Bubble("60-64.csv");
  bubble12 = new Bubble("65-69.csv");
  bubble13 = new Bubble("70-74.csv");
  bubble14 = new Bubble("75andover.csv");
  
}
int cnt=0;
void keyPressed(){
  if (key==CODED){
    if(keyCode==RIGHT){
      cnt=cnt+1;
    }
    else if(keyCode==LEFT){
      cnt=cnt-1;
    }
  }
}
void draw () {
  background(255);
  
  // Compute the year we want to draw
  // Increase the year every 80 frames
  // If the year gets bigger than 2012 stay 
  // at 2012 and don't increase
  if(cnt==65){
    cnt=64;
  }
  if(cnt==-1){
    cnt=0;
  }
  String year = min(1948 + cnt, 2012) + "";

  // Draw these bubbles
  bubble1.draw(year);
  bubble2.draw(year);
  bubble3.draw(year);
  bubble4.draw(year);
  bubble5.draw(year);
  bubble6.draw(year);
  bubble7.draw(year);
  bubble8.draw(year);
  bubble9.draw(year);
  bubble10.draw(year);
  bubble11.draw(year);
  bubble12.draw(year);
  bubble13.draw(year);
  bubble14.draw(year);

  // Draw the year on the screen
  fill(0);
  textSize(25);
  text(year,350,25);
  textSize(12);
  text("unemployment percentage",200,490);
  text("employment percentage",20,20);
  
}

class Bubble {
  String[] years;
  float[] unemploy;
  float[] employed;
  float[] participation;
  String label;
  
  /**
  * Constructor function which parses the data file into 
  * the arrays.
  **/  
  Bubble(String filename){
    label = filename.substring(0,filename.length()-4);
    
    // load in the file
    String[] lines = loadStrings(filename);
    String[] emp_lines = loadStrings(filename.substring(0,filename.length()-4)+"_employed.csv");
    String[] part_lines = loadStrings(filename.substring(0,filename.length()-4)+"_participation.csv");
    
    //Create the the arrays
    years = new String[lines.length];
    unemploy = new float[lines.length];
    employed = new float[lines.length];
    participation = new float[lines.length];
    
    // Create a variable for employed
    int emp_lines_count = 0;
    int part_lines_count = 0;
    
    // Populate the arrays from the file
    for(int i=0; i<lines.length; i=i+1){
      String[] pieces = split(lines[i],',');
      String[] emp_pieces = split(emp_lines[emp_lines_count],',');
      String[] part_pieces = split(part_lines[part_lines_count],',');
     
      if(pieces.length == 14){ 
        years[i] = pieces[0];
        unemploy[i] = float(pieces[13]);
        
        // if the dates match
        if(pieces[0].compareTo(emp_pieces[0])==0){
          employed[i] = float(emp_pieces[13]);
          emp_lines_count++;  
        }
        
        // if the dates match
        if(pieces[0].compareTo(part_pieces[0])==0){
          participation[i] = float(part_pieces[13]);
          part_lines_count++;  
        }
      }
    }
  }
  float x1=0;
  float y1=0;
  void draw (String year){
    
    for(int i=0; i<years.length; i=i+1){
      if(year.compareTo(years[i]) == 0){
        float x = unemploy[i];
        float y = employed[i];
        float r=10;
        float h=height-(y*4);
        if (dist(mouseX,mouseY,x*15,h)<r){
          textSize(25);
          fill(33,255,0);
          text(label,340,50);
          text(x+" percent",340,75);
          text(y+" percent",340,100);
          
          r=r*3;
        }
        else{
          fill(255);
        }
        x=x*15;
        float dx=x+x1;
        x=dx/2;
        float dh=h+y1;
        y=dh/2;
        
        
        ellipse(x,y,r,r);
        x1=x;
        y1=y;
        fill(0);
        
      }  
    }
  }  
}


