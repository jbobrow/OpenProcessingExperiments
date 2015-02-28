
float x, y;
String myText =  "Die Gedanken sind frei \nwer kann sie erraten? \nSie fliehen vorbei \nwie nächtliche Schatten. \nKein Mensch kann sie wissen,\nkein Jäger erschießen \nmit Pulver und Blei: \nDie Gedanken sind frei!";
PFont myFont;


void setup() 
{
  myFont = createFont ("Arial",12);
  size(400, 400); 
  smooth();
}

void draw() 
{ 
  background(50);
  cursor(CROSS);
  fill (255); 
  textFont(myFont);
  textAlign(CENTER);
  text(myText,x,y);

  if (mousePressed) {

    float py =  mouseY  ;
    if(abs(py) > 1) {
      y += py * 0.2;
    }
  }  
  else {  

    float px = mouseX - x;
    if(abs(px) > 1) {
      x += px * 0.05;
    }

    float py = mouseY - y  ;
    if(abs(py) > 1) {
      y += py * 0.05;
    }
  }
}












                
