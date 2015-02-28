
//Cyclic Bloom
//Foundation

void setup (){
  size(500,400);
    background(255,255,255);
    mousePressed=false;
    frameRate(5);
    


String BLOOM = "1.Hello, this is Bloom. An attempt at a visual exploration of a flower blooming in digital space.";
println(BLOOM);  
String INSTRUCTIONS = "2.Please use your mouse to click and drag around the white area. The shape of a flower should be visible over time.";
println(INSTRUCTIONS);  
String INSTRUCTIONS2 = "3.Next, press any key to see a burst of colour (I prefer to just press enter because it feels like a trigger)";
println(INSTRUCTIONS2);  
String INSTRUCTIONS3 = "4.The more keys you press, the flower gets progressively obscured, until it becomes a sea of dots";
println(INSTRUCTIONS3);  
String INSTRUCTIONS4 = "5.The resulting image is a stark image of a different flower";
println(INSTRUCTIONS4);  
String INSTRUCTIONS5 = "6.Use your mouse to click on the center of the image again to see the final visual";
println(INSTRUCTIONS5);  
String INSTRUCTIONS6 = "E n d";
println(INSTRUCTIONS6);  
    
    noStroke();
      noFill();
      ellipseMode(CENTER);
}
   

//Second Part of Optical Flower
//DIY-Background (User interacts with the piece by colouring in the blank space)

void draw () {
  if (mousePressed==true){
fill(146,199,213,30);
stroke(165,87,25);
 
     int i; 
     i = 105; //Assigning a Value
     
     int ii;
     ii = 97;

pushMatrix();
  translate(250,200);  // moving the origin to center of object
shapeMode(CENTER);
translate(-250,-200);
  //translate(-250,-200); // moving i
      rect(mouseX, mouseY,202/9,205/9);
      rect(mouseX, mouseY,202/8,205/8);
      rect(mouseX, mouseY,202/7,205/7);
      rect(mouseX, mouseY,202/6,205/6);
      rect(mouseX, mouseY,202/5,205/5);
      rect(mouseX, mouseY,202/4,205/4);
      rect(mouseX, mouseY,202/3,205/3);
      rect(mouseX, mouseY,202/2,205/2);
popMatrix();


//Framework for the flower that could probably have been shortened if I were better at this
        strokeWeight(1);
     noFill();

        //Defining Variables
       int x = 250;
   int y = 200;
   int d = 290;
        ellipse(x,y,d,d);
           ellipse(x,y,d-10,d-10);
            ellipse(x,y,d-20,d-20);
             ellipse(x,y,d-30,d-30);
              ellipse(x,y,d-40,d-40);
               ellipse(x,y,d-50,d-50);
                ellipse(x,y,d-60,d-60);
                 ellipse(x,y,d-70,d-70);
                  ellipse(x,y,d-80,d-80);
                     ellipse(x,y,d-90,d-90);
            ellipse(x,y,d-100,d-100);
             ellipse(x,y,d-110,d-110);
               ellipse(x,y,d-120,d-120);
                 ellipse(x,y,d-130,d-130);
                   ellipse(x,y,d-140,d-140);
                     ellipse(x,y,d-150,d-150);
                       ellipse(x,y,d-160,d-160);
                       ellipse(x,y,d-100,d-100);
             ellipse(x,y,d-170,d-170);
               ellipse(x,y,d-180,d-180);
                 ellipse(x,y,d-190,d-190);
                   ellipse(x,y,d-200,d-200);
                           ellipse(x,y,d-210,d-210);
               ellipse(x,y,d-220,d-220);
                 ellipse(x,y,d-230,d-230);
                   ellipse(x,y,d-240,d-240);
                 ellipse(x,y,d-250,d-250);
                 ellipse(x,y,d-260,d-260);
                 ellipse(x,y,d-270,d-270);
                   ellipse(x,y,d-280,d-280); 
    smooth();
    
    int e = x-100;
    stroke(255,255,255);
    
         ellipse(e,y,d,d);
           ellipse(e,y,d-10,d-10);
            ellipse(e,y,d-20,d-20);
             ellipse(e,y,d-30,d-30);
              ellipse(e,y,d-40,d-40);
               ellipse(e,y,d-50,d-50);
                ellipse(e,y,d-60,d-60);
                 ellipse(e,y,d-70,d-70);
                  ellipse(e,y,d-80,d-80);
                     ellipse(e,y,d-90,d-90);
            ellipse(e,y,d-100,d-100);
             ellipse(e,y,d-110,d-110);
               ellipse(e,y,d-120,d-120);
                 ellipse(e,y,d-130,d-130);
                   ellipse(e,y,d-140,d-140);
                     ellipse(e,y,d-150,d-150);
                       ellipse(e,y,d-160,d-160);
                       ellipse(e,y,d-100,d-100);
             ellipse(e,y,d-170,d-170);
               ellipse(e,y,d-180,d-180);
                 ellipse(e,y,d-190,d-190);
                   ellipse(e,y,d-200,d-200);
                           ellipse(e,y,d-210,d-210);
               ellipse(e,y,d-220,d-220);
                 ellipse(e,y,d-230,d-230);
                   ellipse(e,y,d-240,d-240);
                 ellipse(e,y,d-250,d-250);
                 ellipse(e,y,d-260,d-260);
                 ellipse(e,y,d-270,d-270);
                   ellipse(e,y,d-280,d-280); 
                   
                    int f = x+100;
    stroke(255,255,255);
    
         ellipse(f,y,d,d);
           ellipse(f,y,d-10,d-10);
            ellipse(f,y,d-20,d-20);
             ellipse(f,y,d-30,d-30);
              ellipse(f,y,d-40,d-40);
               ellipse(f,y,d-50,d-50);
                ellipse(f,y,d-60,d-60);
                 ellipse(f,y,d-70,d-70);
                  ellipse(f,y,d-80,d-80);
                     ellipse(f,y,d-90,d-90);
            ellipse(f,y,d-100,d-100);
             ellipse(f,y,d-110,d-110);
               ellipse(f,y,d-120,d-120);
                 ellipse(f,y,d-130,d-130);
                   ellipse(f,y,d-140,d-140);
                     ellipse(f,y,d-150,d-150);
                       ellipse(f,y,d-160,d-160);
                       ellipse(f,y,d-100,d-100);
             ellipse(f,y,d-170,d-170);
               ellipse(f,y,d-180,d-180);
                 ellipse(f,y,d-190,d-190);
                   ellipse(f,y,d-200,d-200);
                           ellipse(f,y,d-210,d-210);
               ellipse(f,y,d-220,d-220);
                 ellipse(f,y,d-230,d-230);
                   ellipse(f,y,d-240,d-240);
                 ellipse(f,y,d-250,d-250);
                 ellipse(f,y,d-260,d-260);
                 ellipse(f,y,d-270,d-270);
                   ellipse(f,y,d-280,d-280); 
              
int y1 = y+100;
    
         ellipse(x,y1,d,d);
           ellipse(x,y1,d-10,d-10);
            ellipse(x,y1,d-20,d-20);
             ellipse(x,y1,d-30,d-30);
              ellipse(x,y1,d-40,d-40);
               ellipse(x,y1,d-50,d-50);
                ellipse(x,y1,d-60,d-60);
                 ellipse(x,y1,d-70,d-70);
                  ellipse(x,y1,d-80,d-80);
                     ellipse(x,y1,d-90,d-90);
            ellipse(x,y1,d-100,d-100);
             ellipse(x,y1,d-110,d-110);
               ellipse(x,y1,d-120,d-120);
                 ellipse(x,y1,d-130,d-130);
                   ellipse(x,y1,d-140,d-140);
                     ellipse(x,y1,d-150,d-150);
                       ellipse(x,y1,d-160,d-160);
                       ellipse(x,y1,d-100,d-100);
             ellipse(x,y1,d-170,d-170);
               ellipse(x,y1,d-180,d-180);
                 ellipse(x,y1,d-190,d-190);
                   ellipse(x,y1,d-200,d-200);
                           ellipse(x,y1,d-210,d-210);
               ellipse(x,y1,d-220,d-220);
                 ellipse(x,y1,d-230,d-230);
                   ellipse(x,y1,d-240,d-240);
                 ellipse(x,y1,d-250,d-250);
                 ellipse(x,y1,d-260,d-260);
                 ellipse(x,y1,d-270,d-270);
                   ellipse(x,y1,d-280,d-280); 
                   
                   int y2 = y-100;
    
         ellipse(x,y2,d,d);
           ellipse(x,y2,d-10,d-10);
            ellipse(x,y2,d-20,d-20);
             ellipse(x,y2,d-30,d-30);
              ellipse(x,y2,d-40,d-40);
               ellipse(x,y2,d-50,d-50);
                ellipse(x,y2,d-60,d-60);
                 ellipse(x,y2,d-70,d-70);
                  ellipse(x,y2,d-80,d-80);
                     ellipse(x,y2,d-90,d-90);
            ellipse(x,y2,d-100,d-100);
             ellipse(x,y2,d-110,d-110);
               ellipse(x,y2,d-120,d-120);
                 ellipse(x,y2,d-130,d-130);
                   ellipse(x,y2,d-140,d-140);
                     ellipse(x,y2,d-150,d-150);
                       ellipse(x,y2,d-160,d-160);
                       ellipse(x,y2,d-100,d-100);
             ellipse(x,y2,d-170,d-170);
               ellipse(x,y2,d-180,d-180);
                 ellipse(x,y2,d-190,d-190);
                   ellipse(x,y2,d-200,d-200);
                           ellipse(x,y2,d-210,d-210);
               ellipse(x,y2,d-220,d-220);
                 ellipse(x,y2,d-230,d-230);
                   ellipse(x,y2,d-240,d-240);
                 ellipse(x,y2,d-250,d-250);
                 ellipse(x,y2,d-260,d-260);
                 ellipse(x,y2,d-270,d-270);
                   ellipse(x,y2,d-280,d-280); 
    
    //Colour Ellipses
    noStroke();
    fill(169,236,180,50);
    ellipse(250,200,200,200);
    
    noStroke();
    fill(0,40,100,10);
    ellipse(250,200,290,290);
    
    noStroke();
    fill(0,40,250,10);
    ellipse(250,200,300,300);
    
    noStroke();
    fill(244,234,126,10);
    ellipse(250,200,400,400);

  }
}

//Colour Burst (Signifying blooming)
void keyPressed() {
  //stroke(0);
  //strokeWeight(1);
  for(int y =10; y<=height-10; y+=10){
    for(int x=10; x<=width-10; x+=10){
line(x,y, 250,200);
  stroke(161,35,76,40);
  strokeWeight(1);
  
    boolean Circle = true;
    boolean Square= false;
  if (Circle==true){
  ellipse(x,y,5,5);
  fill(161,35,76,30);
  
  }

}
}
}

  



