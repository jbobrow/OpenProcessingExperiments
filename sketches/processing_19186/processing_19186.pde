

  
float colorValue;

void setup() {
 
  size(600,600);  
  colorValue = 10;
}

void draw(){
  
  
  colorValue = map(mouseX,0,width,0,255);
  
  background(colorValue); //Set the background
  stroke(255);//Set line value to white
  strokeWeight(5);//Set line width to 5 pixels

smooth();

fill(100,100,100);

ellipse(300,300,300,300);

rect(600,600,600,600);

fill(101,44,90);

quad(30, 50, 300, 80, 300, 200, 100, 300);

  
  colorValue +=3 ;
  println("color value: "+colorValue);
 fill(54,10,10);
 ellipse(colorValue,100,20,20);


  
  if (colorValue > width)
  colorValue = 0;
  ellipse(90,90,90,90);


fill(255, 70, 0, 100);
    ellipse(mouseX, mouseY, 30, 30);


    fill(101, 144, 90);
    ellipse(mouseX + random(-50, 50), mouseY + random (-50, 50), 10, 10);
 }

    

 

 

