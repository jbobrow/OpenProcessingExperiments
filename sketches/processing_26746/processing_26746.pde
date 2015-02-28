
/*This assignment gives us a lot of options to display our knowledge of 
processing. Therefore after experimenting with a lot of other options such as, 
creating a distorted photograph, raindops and playing with shapes and colours.
I decided to display bouncing balls, because of the gravity function, which 
creates a cool effect with the balls lined up. 
The concept of my design is to portray a rollercoaster ride, the balls act as
a line when together, and as the duration of the code is run, the line becomes 
steeper, creating the effect of going steeply up and down. 
As you move the mouse horizontally across the screen, it changes from blue to green
to purple. The balls are coloured white because it makes it easier to see against
the three background colours. 

I also had a number of difficulties with this assignment. One was that, it was 
difficult to remember all the codes. Another difficulty I faced was with the 
mousePressed() function. Initially i wanted the the bouncing balls to change colour 
with the click of the mouse. Also, i'm not sure why but the eighth ball from the 
right stops bouncing after the fourth bounce. 
*/ 

    
   

// ball objects
Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;
Ball ball6;
Ball ball7;
Ball ball8;
Ball ball9;
Ball ball10;
Ball ball11;
Ball ball12;
Ball ball13;
Ball ball14;
Ball ball15;
Ball ball16;
Ball ball17;
Ball ball18;
Ball ball19;
Ball ball20;
Ball ball21;
Ball ball22;





// Global gravity variable
//float gravity = 0.4;  

void setup() { 
  size(400,1000); 
  smooth();
  
  if (mousePressed) {
    fill(0);
  }else{
    fill(175,0,20);
  }
  
  // Create ball objects
  ball1 = new Ball(10,-280,20);
  ball2 = new Ball(50,-260,50);
  ball3 = new Ball(80,-240,10);
  ball4 = new Ball(120,-220,30);
  ball5 = new Ball(160,-200,30);
  ball6 = new Ball(200,-180,50);
  ball7 = new Ball(240,-160,30);
  ball8 = new Ball(280,-140,40);
  ball9 = new Ball(320,-120,50);
  ball10 = new Ball(360,-100,30);
  ball11 = new Ball(380,-80,40);
  ball12 = new Ball(420,-60,20);
  ball13 = new Ball(460,-40,60);
  ball14 = new Ball(500,-20,30);
  ball15 = new Ball(540,0,20);
  ball16 = new Ball(580,20,50);
  ball17 = new Ball(620,40,40);
  ball18 = new Ball(660,60,60);
  ball19 = new Ball(700,80,40);
  ball20 = new Ball(740,100,60);
  ball21 = new Ball(780,120,30);
  ball22 = new Ball(820,140,10);

  
}


void draw() { 
  background(255); 
      if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  
if (mouseX < width/3){
  background(100,200,250);
}else if (mouseX < 2*width/3){
  background(10,200,80);
}else{
  background(40,0,50);
}

 
  // Display ball objects
  ball1.display();
  ball2.display();
  ball3.display();
  ball4.display();
  ball5.display();
  ball6.display();
  ball7.display();
  ball8.display();
  ball9.display();
  ball10.display();
  ball11.display();
  ball12.display();
  ball13.display();
  ball14.display();
  ball15.display();
  ball16.display();
  ball17.display();
  ball18.display();
  ball19.display();
  ball20.display();
  ball21.display();
  ball22.display();

  

  
  
  // Move ball objects
  ball1.update();
  ball2.update();
  ball3.update();
  ball4.update();
  ball5.update();
  ball6.update();
  ball7.update();
  ball8.update();
  ball9.update();
  ball10.update();
  ball11.update();
  ball12.update();
  ball13.update();
  ball14.update();
  ball15.update();
  ball16.update();
  ball17.update();
  ball18.update();
  ball19.update();
  ball20.update();
  ball21.update();
  ball22.update();

  
  

} 


