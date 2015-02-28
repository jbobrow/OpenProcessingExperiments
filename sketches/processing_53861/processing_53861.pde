
float y = 0.0; //y position variable

void setup(){
  size(500,500); //size of canvas
  smooth(); //smooth lines
  
}  

void draw(){
  frameRate(160); //speed of objects moving
  background(0); //background colour
  stroke(random(180),20,80); //random colors of objects
  strokeCap(SQUARE); //stroke cap will be squares
  
  //bottom portion
  strokeWeight(150); //thickness of the lines
  line(-50,y+280,550,y+250);
  
  strokeWeight(150);
  line(-50,y+400,550,y+250);
  
  strokeWeight(50);
  line(100,y+210,400-y,y+180);

  strokeWeight(50);
  line(100,y+200,200,y+160);

  strokeWeight(50);
  line(100,y+200,200,y+80);
  
  strokeWeight(10);
  line(300-y,y+200,200,y+80);
  
  strokeWeight(10);
  line(300,y+200,300-y,y+80);
  
  strokeWeight(10);
  line(300,y*0.9+200,50-y,y+80);
  
  strokeWeight(50);
  line(100,y+200,200-y,y+10);

  strokeWeight(10);
  line(100,y+200,120-y,y+10);
  
  //top portion
  strokeWeight(100); 
  line(-10,180-y*0.3,600-y,230-y*0.3); 
  
  strokeWeight(5); 
  line(0,100-y*0.35,500-y,200-y*0.35);

  strokeWeight(5); 
  line(0,100-y*0.35,350-y,300-y*0.35);
  
  strokeWeight(5); 
  line(0,100-y*0.35,350-y,500-y*0.6);
  
  strokeWeight(100); 
  line(y+100,300-y,700,250-y); //right top
  
  strokeWeight(40); 
  line(y+30,300-y,800,250-y);
  
  strokeWeight(80); 
  line(y+200,500-y,800,450-y*0.6);

  strokeWeight(50);
  line(100,225-y*0.3,400-y,250-y*0.3); 
 
  strokeWeight(50);
  line(150,250-y*0.3,350-y,300-y*0.3); 
 
  strokeWeight(50);
  line(100,250-y*0.3,350-y,400-y*0.3); //bottom to top
 
  strokeWeight(50);
  line(100,100-y*0.3,350-y,400-y*0.3); //bottom to top
  
  y += 1; //add 1 to y
 
 if (y>500){ //if y is greater than 500
  y=0.0; //set it to 0
 } 
}           
                
