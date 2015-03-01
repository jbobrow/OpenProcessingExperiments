

PFont font_wind;
void setup()
{
  size (500, 500);
  background (162, 208, 255);
    font_wind = createFont("Maxima-Kz-T20Normal-48.vlw",100,true);
    smooth();
}

void draw()
{
  background (162, 208, 255);
  
  
  pushMatrix();
  translate(0,0);
  fill(255);
  textSize(15);
  text("Wolke",mouseX,50);
  fill(255);
text("Wolke",100+mouseX,50);
fill(255);
text("Wolke",25+mouseX,25);
fill(255);
text("Wolke",25+mouseX,75);
fill(255);
text("Wolke",75+mouseX,25);
fill(255);
text("Wolke",75+mouseX,75);
fill (255);
text ("Wolke",50+mouseX,50);
  popMatrix();
    
  
  for (int i=0; i<width; i+=50)
  {
    
    pushMatrix();
fill(226,255,173);

float ver = sin(millis()/1000.0+i)*5;
text ("Wiese",i+ver,500);
text ("Wiese",i+ver,485);
  popMatrix();
  
  
}
  
  
  

    
    /*pushMatrix();
        translate (width/2, 200);

        stroke(255,214,236);
    strokeWeight(5);
    line(0,0,0,height);
    popMatrix(); */
    
    

  for (int i=0; i<360; i+=51.42857143) {
    pushMatrix();
    translate (width/2, 250);
    rotate(radians(i)); 
    fill(252, 248, 168);
    noStroke();
   text("Windrad",50, -75);
 

    popMatrix();


if (mousePressed==true)
{
      pushMatrix();
      translate(25,height/2);
      textFont(font_wind);
      textSize(30);
      fill(255);
      text("Wind",0,0);
        popMatrix();
        
        pushMatrix();
        for (int j=0; j<360; j+=90)
      {
    pushMatrix();
    translate (width/2, 250);
    rotate (radians (millis()/10));
        fill(252, 248, 168);
    noStroke();
     rotate(radians(i));
     textSize(15);
   text("Windrad",50, -75);
 
    popMatrix();
      }
        popMatrix();
        
}
  /*else
  {
      for (int j=0; j<360; j+=90)
      { // 360 Grad in 20° Schritten
    pushMatrix();
    translate (width/2, 200);
    rotate(radians(i)); // Um i rotieren
    fill(252, 248, 168);
    noStroke();
    triangle(0, 0, 0, -100, 75, -100);
    popMatrix();
      }     
      */
}}
      
      
