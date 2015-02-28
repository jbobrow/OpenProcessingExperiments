



// snowflake() function. [flashing lights, scale, translate] & [integrating media graphics] mouse X minimum


//declaring--------------------------------

int x = 10;
int y = 10;
int h = 10;

//--------------------------------

void setup() {
size(600,120);
noStroke();
}

//--------------------------------
void draw(){
  background(255); //white
  
   if (mouseX < 100) { //  mouse bottom left, to reveal the title.
   

//Typography 1
smooth(); 
PFont font1;
font1 = loadFont("Baskerville-Italic-15.vlw");
fill(0);
textFont(font1);
textSize(20);
text(" christmas snowflakes", 5, 110);
     
  }
        
//for loop, scale & translate
  
  for (int i = 0; i < 300; i+=40) {
    int gray = int (random(0,200));       // fluctuating bright & faint light / gesalt
    float scale = random (0.45, 3);
    snowflake(i, 5, gray, scale);
  }
}

//--------------------------------
void snowflake (int x, int y, int g, float s) {
  pushMatrix();
  translate(x, y);

  
  
    
fill(100-g);   // set the gray value to form a gradient
scale(0.89);   //set the size

  
triangle(x+30, y+80, x+40, y+70, x+50, y+80);    
triangle(x+30, y, x+50, y, x+40, y+10);          
triangle(x, y+30, x+10, y+40, x, y+50);      
triangle(x+80, y+30, x+70, y+40, x+80, y+50);    
  
rect(x, y, h, h);        
rect(x+70, y, h, h);    
rect(x, y+70, h, h);    
rect(x+70, y+70, h, h);  

println("mouseX:" + "mouseX" + "remappedColor:" + x);
fill(mouseX,mouseY,10);                                       
quad(x+10, y+30, x+30, y+30, x+40, y+40, x+20, y+40);    
quad(x+30, y+10, x+40, y+20, x+40, y+40, x+30, y+30);    
quad(x, y+20, x+20, y+20, x+30, y+30, x+10, y+30);       
quad(x+20, y, x+30, y+10, x+30, y+30, x+20, y+20);       
quad(x+20, y+40, x+40, y+40, x+30, y+50, x+10, y+50);    
quad(x+40, y+40, x+40, y+60, x+30, y+70, x+30, y+50);    
quad(x+10, y+50, x+30, y+50, x+20, y+60, x, y+60);      
quad(x+30, y+50, x+30, y+70, x+20, y+80, x+20, y+60);    
quad(x+40, y+20, x+50, y+10, x+50, y+30, x+40, y+40);     
quad(x+50, y+30, x+70, y+30, x+60, y+40, x+40, y+40);     
quad(x+50, y+10, x+60, y, x+60, y+20, x+50, y+30);        
quad(x+60, y+20, x+80, y+20, x+70, y+30, x+50, y+30);     
quad(x+40, y+40, x+50, y+50, x+50, y+70, x+40, y+60);    
quad(x+40, y+40, x+60, y+40, x+70, y+50, x+50, y+50);    
quad(x+50, y+50, x+60, y+60, x+60, y+80, x+50, y+70);    
quad(x+50, y+50, x+70, y+50, x+80, y+60, x+60, y+60);     
  
smooth();
stroke(0); //black
strokeWeight(1);
strokeCap(SQUARE);
  
line(x+10, y+10, x+70, y+70);
line(x+70, y+10, x+10, y+70);
line(x+40, y+10, x+40, y+70);
line(x+10, y+40, x+70, y+40);
  
noStroke();
smooth();
fill(0);
quad(x+40, y+30, x+50, y+40, x+40, y+50, x+30, y+40);

  popMatrix();
}



