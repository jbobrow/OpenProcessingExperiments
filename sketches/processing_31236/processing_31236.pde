
int patternSeperationX = 25;
int patternSeperationY = 25;
int widthEllipse =0;
int heightEllipse =0;
int reset = 0;
int x1= 15;
int x2= 30;
int x3= 15;
int y1= 30;
int y2= 15;
int y3= 15;
int flip = 0;

 
 void setup(){
  size(750,750);
   
  
  background(255);
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
        widthEllipse=widthEllipse + 5;
        heightEllipse=heightEllipse + 5;
        reset = reset +1;
        flip = flip +1;
        
        if(reset==10){
        widthEllipse =0;
        heightEllipse =0;
reset = 0;
        }
      }
    }
  }
  
    void draw(){
}
 
 
void yourFunction(){
   

fill(255, 0, 0, 191);
ellipse (15, 15, widthEllipse, heightEllipse );
fill(0);
triangle (x1,y1,x2,y2,x3,y3);


   
}


 
void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}
