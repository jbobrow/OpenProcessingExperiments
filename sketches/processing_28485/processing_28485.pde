
int counter;
 
void setup() {  //setup function called initially, only once
  size(600, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}
 
void draw() {  //draw function loops
  ellipse(300, 100, 150,20);
  ellipse(300, 150, 100,15);
  ellipse(300, 300, 300,20);
  line(225,100,150,300,30,10);
  line(375,100,450,300,100,10);
  line(350,150,376,100,10,30);
  line(250,150,224,100,10,10);
  ellipse(mouseX, mouseY, 150,150);
  fill(random(255),10,0,10);
  

 
   
  if(mousePressed == true) { //add some interaction
    fill(255,100,255,random(30));
  ellipse(mouseX, mouseY, 50, 50);
    fill(255,300,255,random(30));

  }
 
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
 

                
                                
