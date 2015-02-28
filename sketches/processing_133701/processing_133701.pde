
//declare Line array variable
Line[] myLines;

void setup(){
  size(600,400);
 //declare the length of the Line array
  myLines= new Line[50];
  for( int i=0; i<myLines.length; i=i+1){
      float newX = map(i,0,myLines.length,0,width);
      float newRed = map (i,0, myLines.length,0,255);
      color newColor = color (newRed,0,255);
      myLines[i] = new Line(newX, newColor);
    //myLine = new Line();

  }      
}
void draw(){
  fill(50,10);
  rect(0,0,width,height);
  background(0,0,0);
  
  for( int i=0; i<50; i=i+1){
  //calculate
  myLines[i].update();
  
  // display
  myLines[i].display();
  }
  
}

//class Hair {
class Line {  
  float x;
  float y;
  color fillColor;
  float r,g,b;


  //contructor
  Line(float theX, color theColor){
  
    x=width* 0.2;
    y=height * 0.2;
    fillColor = theColor;
    
  
  }
  
  void update(){
    x=x+ random(-40,40);
    y=y+ random(-40,40);
  }
  void display(){
    stroke(1);
    r = random(255); b = random(255); g = random(255); 
    stroke(r,g,b);
    //fill(fillColor);
    line(x,y, 300,300);   
  }

}




