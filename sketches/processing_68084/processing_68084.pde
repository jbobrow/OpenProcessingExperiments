

// Unit Cirlce
// Rob Papp

float radius = 150;           // radius of cirlce
float xcenter;        // center of cirlce
float ycenter;        // center of circle 
float leng;                   // used for making line to cirle         
float sfactor;                // scale factor
float xdist;                    // distance from center to mouseX
float ydist;                  // distance from center to mouseY
float xpoint;              // xpoint on cirlce
float ypoint;              // ypoint on cirlce
float theta; 
float rads;
float frequency2 = 1;      //for static sine curve
float px2, py2;            // for graphing static wave
float angle2;              // for graphing static wave

PFont myFont;
PFont myFont2;

ADbutton button1;
boolean pressed=false;
 

void setup(){
 
  size (1000,800); //make an 800x800 size screen
  background(255); //create a white background
  xcenter =  185;//width/2;        // center of cirlce
  ycenter =  200;//height/2;        // center of circle
  
  myFont = loadFont("Arial-Black-20.vlw");
  myFont2 = loadFont("ArialMT-12.vlw");
  
  button1 = new ADbutton(50, 530, 150, 30, 7, "Degrees");
  
}

void buttonRun()
 {
   if (pressed)
     button1.setLabel("Degrees");
   else
     button1.setLabel("Radians");
     
   pressed=!pressed;  
   
 }


void draw() {
  background(255);
  stroke(0);
  strokeWeight(3);
  textFont(myFont);
  
 
  
  // calculate point on circle to draw line to 
      xdist = mouseX - (xcenter);
      ydist = mouseY - (ycenter);
      leng = sqrt(xdist*xdist + ydist*ydist);
      sfactor = radius/leng;
      xpoint = (xcenter)+xdist*sfactor;
      ypoint = (ycenter)+ydist*sfactor;
  
  // draw static sin curve - y = sin(x)
      angle2 = 0;
      for (int i = 0; angle2 >= -360; i++){
        px2 =  xcenter + radius + sin(radians(angle2))*(radius/2);
        py2 = ycenter + sin(radians(angle2))*(radius);
        point(xcenter+radius+radius/2+i, py2);
        angle2 -= frequency2;
      }
  
      line(xcenter + radius*1.5, ycenter + radius, xcenter + radius*1.5 , ycenter - radius); //yaxis
      line(xcenter + radius*1.5, ycenter, xcenter + radius + radius/2 + 360 , ycenter); //xaxis
      
      //darw a grid on graphs
      stroke(150);
      strokeWeight(1);
      line(xcenter + radius*1.5 + 90, ycenter + radius, xcenter + radius*1.5 + 90 , ycenter - radius); //vertical
      line(xcenter + radius*1.5 + 180, ycenter + radius, xcenter + radius*1.5 + 180 , ycenter - radius); //vertical
      line(xcenter + radius*1.5 + 270, ycenter + radius, xcenter + radius*1.5 + 270 , ycenter - radius); //vertical
      line(xcenter + radius*1.5 + 360, ycenter + radius, xcenter + radius*1.5 + 360 , ycenter - radius); //vertical
      line(xcenter + radius*1.5, ycenter + radius, xcenter + radius + radius/2 + 360 , ycenter + radius);  //horizontal 
      line(xcenter + radius*1.5, ycenter - radius, xcenter + radius + radius/2 + 360 , ycenter - radius);  // horizontal
      
      line(xcenter + radius*1.5 + 90, ycenter + radius + radius*2.5, xcenter + radius*1.5 + 90 , ycenter - radius + radius*2.5); //vertical
      line(xcenter + radius*1.5 + 180, ycenter + radius + radius*2.5, xcenter + radius*1.5 + 180 , ycenter - radius + radius*2.5); //vertical
      line(xcenter + radius*1.5 + 270, ycenter + radius+ radius*2.5, xcenter + radius*1.5 + 270 , ycenter - radius+ radius*2.5); //vertical
      line(xcenter + radius*1.5 + 360, ycenter + radius+ radius*2.5, xcenter + radius*1.5 + 360 , ycenter - radius+ radius*2.5); //vertical
      line(xcenter + radius*1.5, ycenter + radius+ radius*2.5, xcenter + radius + radius/2 + 360 , ycenter + radius+ radius*2.5);  //horizontal 
      line(xcenter + radius*1.5, ycenter - radius+ radius*2.5, xcenter + radius + radius/2 + 360 , ycenter - radius+ radius*2.5);  // horizontal
      strokeWeight(3);
      stroke(0);
      
  
  // draw static cosine curve - y = cos(x)
      angle2 = 0;
      for (int i = 0; angle2 >= -360; i++){
        px2 =  xcenter + radius + cos(radians(angle2))*(radius/2);
        py2 = ycenter + radius*2.5 - cos(radians(angle2))*(radius);
        point(xcenter+radius+radius/2+i, py2);
        angle2 -= frequency2;
      }
  
      line(xcenter + radius*1.5, ycenter + radius*3.5, xcenter + radius*1.5 , ycenter + radius*1.5); //yaxis
      line(xcenter + radius*1.5, ycenter + radius*2.5, xcenter + radius + radius/2 + 360 , ycenter + radius*2.5); //xaxis

  // Calculate the angle
      theta = degrees(asin((ypoint-ycenter)/radius));
      
      if (ypoint-ycenter < 0 && xpoint-xcenter >= 0) // Quad I
        theta *= -1;
      if (ypoint-ycenter < 0 && xpoint-xcenter < 0) // Quad II
        theta = 180 + theta;
      if (ypoint-ycenter > 0 && xpoint-xcenter < 0) // Quad III
        theta = 180 + theta;
      if (ypoint-ycenter > 0 && xpoint-xcenter >= 0) // Quad IV
        theta = 360 - theta;
      if (ypoint-ycenter == 0 && xpoint-xcenter < 0) // 180 degrees
        theta = 180;
      
      rads = radians(theta);
      // output some calculations
          fill(0); textFont(myFont); textAlign(LEFT);
          text(char(920)+ "(degrees): " + nf(theta,3,-1), 50, 410);
          text(char(920) + "(radians): " + nf(radians(theta),1,2), 50, 440);
         // textAlign(RIGHT);
          fill(255,0,0);
          text("sin(" + nf(radians(theta),1,2) + ") = " + nf(sin(rads),1,3) , 50, 470);
          text("sin",xcenter + 1.5*radius + 380 ,ycenter);
          fill(0,0,255);
          text("cos(" + nf(radians(theta),1,2) + ") = " + nf(cos(rads),1,3) , 50, 500);
          text("cos",xcenter + 1.5*radius + 380 ,ycenter + radius*2.5);          
          fill(255);
   
  
  //draw ellipe and center point
      ellipseMode(RADIUS);
      ellipse(xcenter,ycenter,radius,radius);
      point(xcenter,ycenter);
     
      
      strokeWeight(3);
      line(xcenter,ycenter, xpoint, ypoint); // radius of circle
      ellipse(xpoint,ypoint,5,5); //point on end of radius
      
  
        

  // Draw the arc
      //fill(150);
      stroke(150);
      arc(xcenter, ycenter, radius/4, radius/4, radians(360-theta), TWO_PI);
      
  // draw axis and key points
      stroke(0);
      line(xcenter - radius, ycenter, xcenter + radius, ycenter); // xaxis
      line(xcenter , ycenter - radius, xcenter , ycenter + radius); // yaxis
      strokeWeight(1);
      stroke(150);
      
      
      //quad I
      line(xcenter , ycenter, xcenter + sqrt(3)*radius/2, ycenter - radius/2); // pi/6
      line(xcenter , ycenter, xcenter + radius/sqrt(2), ycenter - radius/sqrt(2)); // pi/4
      line(xcenter , ycenter, xcenter + radius/2, ycenter - sqrt(3)*radius/2); // pi/3
      
      //quad II
      line(xcenter , ycenter, xcenter - sqrt(3)*radius/2, ycenter - radius/2); // pi/6
      line(xcenter , ycenter, xcenter - radius/sqrt(2), ycenter - radius/sqrt(2)); // pi/4
      line(xcenter , ycenter, xcenter - radius/2, ycenter - sqrt(3)*radius/2); // pi/3
      
      //quad III
      line(xcenter , ycenter, xcenter - sqrt(3)*radius/2, ycenter + radius/2); // pi/6
      line(xcenter , ycenter, xcenter - radius/sqrt(2), ycenter + radius/sqrt(2)); // pi/4
      line(xcenter , ycenter, xcenter - radius/2, ycenter + sqrt(3)*radius/2); // pi/3
      
      //quad IV
      line(xcenter , ycenter, xcenter + sqrt(3)*radius/2, ycenter + radius/2); // pi/6
      line(xcenter , ycenter, xcenter + radius/sqrt(2), ycenter + radius/sqrt(2)); // pi/4
      line(xcenter , ycenter, xcenter + radius/2, ycenter + sqrt(3)*radius/2); // pi/3
      
      //text values for unit circle
      fill(0);
      textFont(myFont2); textAlign(LEFT);
      text(0, xcenter + radius + 10, ycenter); // 0
      
      if (!pressed)
      {
          //quad I
          text(char(960) + "/6", xcenter + sqrt(3)*radius/2 + 10, ycenter - radius/2); // pi/6
          text(char(960) + "/4", xcenter + radius/sqrt(2), ycenter - radius/sqrt(2) - 10); // pi/4
          text(char(960) + "/3", xcenter + radius/2, ycenter - sqrt(3)*radius/2 - 10); // pi/3
          
          //quad II
          textAlign(RIGHT);
          text("5" + char(960) + "/6", xcenter - sqrt(3)*radius/2 - 10, ycenter - radius/2); // pi/6
          text("3" + char(960) + "/4", xcenter - radius/sqrt(2), ycenter - radius/sqrt(2)-10); // pi/4
          text("2" + char(960) + "/3", xcenter - radius/2, ycenter - sqrt(3)*radius/2-10); // pi/3
          
          //quad III
          text("7"+char(960) + "/6", xcenter - sqrt(3)*radius/2-10, ycenter + radius/2); // pi/6
          text("5"+char(960) + "/4",xcenter - radius/sqrt(2), ycenter + radius/sqrt(2)+17); // pi/4
          text("4"+char(960) + "/3", xcenter - radius/2, ycenter + sqrt(3)*radius/2+17); // pi/3
          
          //quad IV
          textAlign(LEFT);
          text("11"+char(960) + "/6", xcenter + sqrt(3)*radius/2 +10, ycenter + radius/2); // pi/6
          text("7" +char(960) + "/4", xcenter + radius/sqrt(2), ycenter + radius/sqrt(2)+17); // pi/4
          text("5" +char(960) + "/3",xcenter + radius/2, ycenter + sqrt(3)*radius/2+17); // pi/3
          
          text(char(960) + "/2", xcenter - 10, ycenter - radius - 10); // pi/2
          text("3"+char(960) + "/2", xcenter - 10, ycenter + radius + 20); // 3pi/2
          text(char(960) , xcenter - radius - 20, ycenter); // pi
          
          strokeWeight(2);
          stroke(0);
          textAlign(CENTER);
          
          line(xcenter + radius*1.5 + 30, ycenter + 5, xcenter + radius*1.5 + 30 , ycenter); //vertical
          text(char(960) + "/6", xcenter + radius*1.5 + 30, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 45, ycenter - 5, xcenter + radius*1.5 + 45 , ycenter); //vertical
          text(char(960) + "/4", xcenter + radius*1.5 + 45, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 60, ycenter + 5, xcenter + radius*1.5 + 60 , ycenter); //vertical
          text(char(960) + "/3", xcenter + radius*1.5 + 60, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 150, ycenter + 5, xcenter + radius*1.5 + 150 , ycenter); //vertical
          text("5" +char(960) + "/6", xcenter + radius*1.5 + 150, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 135, ycenter - 5, xcenter + radius*1.5 + 135 , ycenter); //vertical
          text("3"+char(960) + "/4", xcenter + radius*1.5 + 135, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 120, ycenter + 5, xcenter + radius*1.5 + 120 , ycenter); //vertical
          text("2"+char(960) + "/3", xcenter + radius*1.5 + 120, ycenter + 20); //sine label
       
          line(xcenter + radius*1.5 + 210, ycenter + 5, xcenter + radius*1.5 + 210 , ycenter); //vertical
          text("7" +char(960) + "/6", xcenter + radius*1.5 + 210, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 225, ycenter - 5, xcenter + radius*1.5 + 225 , ycenter); //vertical
          text("5"+char(960) + "/4", xcenter + radius*1.5 + 225, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 240, ycenter + 5, xcenter + radius*1.5 + 240 , ycenter); //vertical
          text("4"+char(960) + "/3", xcenter + radius*1.5 + 240, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 330, ycenter + 5, xcenter + radius*1.5 + 330 , ycenter); //vertical
          text("11" +char(960) + "/6", xcenter + radius*1.5 + 330, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 315, ycenter - 5, xcenter + radius*1.5 + 315 , ycenter); //vertical
          text("7"+char(960) + "/4", xcenter + radius*1.5 + 315, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 300, ycenter + 5, xcenter + radius*1.5 + 300 , ycenter); //vertical
          text("5"+char(960) + "/3", xcenter + radius*1.5 + 300, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 90, ycenter - 5, xcenter + radius*1.5 + 90 , ycenter); //vertical
          text(char(960) + "/2", xcenter + radius*1.5 + 90, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 180, ycenter - 5, xcenter + radius*1.5 + 180 , ycenter); //vertical
          text(char(960), xcenter + radius*1.5 + 180, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 270, ycenter - 5, xcenter + radius*1.5 + 270 , ycenter); //vertical
          text("3"+char(960) + "/2", xcenter + radius*1.5 + 270, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 360, ycenter - 5, xcenter + radius*1.5 + 360 , ycenter); //vertical
          text("2"+char(960), xcenter + radius*1.5 + 360, ycenter - 10); //sine label
          
          //now for the cosine
          ycenter += radius*2.5;
          line(xcenter + radius*1.5 + 30, ycenter + 5, xcenter + radius*1.5 + 30 , ycenter); //vertical
          text(char(960) + "/6", xcenter + radius*1.5 + 30, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 45, ycenter - 5, xcenter + radius*1.5 + 45 , ycenter); //vertical
          text(char(960) + "/4", xcenter + radius*1.5 + 45, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 60, ycenter + 5, xcenter + radius*1.5 + 60 , ycenter); //vertical
          text(char(960) + "/3", xcenter + radius*1.5 + 60, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 150, ycenter + 5, xcenter + radius*1.5 + 150 , ycenter); //vertical
          text("5" +char(960) + "/6", xcenter + radius*1.5 + 150, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 135, ycenter - 5, xcenter + radius*1.5 + 135 , ycenter); //vertical
          text("3"+char(960) + "/4", xcenter + radius*1.5 + 135, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 120, ycenter + 5, xcenter + radius*1.5 + 120 , ycenter); //vertical
          text("2"+char(960) + "/3", xcenter + radius*1.5 + 120, ycenter + 20); //sine label
       
          line(xcenter + radius*1.5 + 210, ycenter + 5, xcenter + radius*1.5 + 210 , ycenter); //vertical
          text("7" +char(960) + "/6", xcenter + radius*1.5 + 210, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 225, ycenter - 5, xcenter + radius*1.5 + 225 , ycenter); //vertical
          text("5"+char(960) + "/4", xcenter + radius*1.5 + 225, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 240, ycenter + 5, xcenter + radius*1.5 + 240 , ycenter); //vertical
          text("4"+char(960) + "/3", xcenter + radius*1.5 + 240, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 330, ycenter + 5, xcenter + radius*1.5 + 330 , ycenter); //vertical
          text("11" +char(960) + "/6", xcenter + radius*1.5 + 330, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 315, ycenter - 5, xcenter + radius*1.5 + 315 , ycenter); //vertical
          text("7"+char(960) + "/4", xcenter + radius*1.5 + 315, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 300, ycenter + 5, xcenter + radius*1.5 + 300 , ycenter); //vertical
          text("5"+char(960) + "/3", xcenter + radius*1.5 + 300, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 90, ycenter - 5, xcenter + radius*1.5 + 90 , ycenter); //vertical
          text(char(960) + "/2", xcenter + radius*1.5 + 90, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 180, ycenter - 5, xcenter + radius*1.5 + 180 , ycenter); //vertical
          text(char(960), xcenter + radius*1.5 + 180, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 270, ycenter - 5, xcenter + radius*1.5 + 270 , ycenter); //vertical
          text("3"+char(960) + "/2", xcenter + radius*1.5 + 270, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 360, ycenter - 5, xcenter + radius*1.5 + 360 , ycenter); //vertical
          text("2"+char(960), xcenter + radius*1.5 + 360, ycenter - 10); //sine label
          
          ycenter -= radius*2.5;
      }
      else 
      {
          //quad I
          text(30, xcenter + sqrt(3)*radius/2 + 10, ycenter - radius/2); // pi/6
          text(45, xcenter + radius/sqrt(2), ycenter - radius/sqrt(2) - 10); // pi/4
          text(60, xcenter + radius/2, ycenter - sqrt(3)*radius/2 - 10); // pi/3
          
          //quad II
          textAlign(RIGHT);
          text(150, xcenter - sqrt(3)*radius/2 - 10, ycenter - radius/2); // pi/6
          text(135, xcenter - radius/sqrt(2), ycenter - radius/sqrt(2)-10); // pi/4
          text(120, xcenter - radius/2, ycenter - sqrt(3)*radius/2-10); // pi/3
          
          //quad III
          text(210, xcenter - sqrt(3)*radius/2-10, ycenter + radius/2); // pi/6
          text(225,xcenter - radius/sqrt(2), ycenter + radius/sqrt(2)+17); // pi/4
          text(240, xcenter - radius/2, ycenter + sqrt(3)*radius/2+17); // pi/3
          
          //quad IV
          textAlign(LEFT);
          text(330, xcenter + sqrt(3)*radius/2 +10, ycenter + radius/2); // pi/6
          text(315, xcenter + radius/sqrt(2), ycenter + radius/sqrt(2)+17); // pi/4
          text(300,xcenter + radius/2, ycenter + sqrt(3)*radius/2+17); // pi/3
          
          text(90, xcenter - 10, ycenter - radius - 10); // pi/2
          text(270, xcenter - 10, ycenter + radius + 20); // 3pi/2
          text(180 , xcenter - radius - 30, ycenter); // pi 
          
           strokeWeight(2);
          stroke(0);
          textAlign(CENTER);
          
          line(xcenter + radius*1.5 + 30, ycenter + 5, xcenter + radius*1.5 + 30 , ycenter); //vertical
          text(30, xcenter + radius*1.5 + 30, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 45, ycenter - 5, xcenter + radius*1.5 + 45 , ycenter); //vertical
          text(45, xcenter + radius*1.5 + 45, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 60, ycenter + 5, xcenter + radius*1.5 + 60 , ycenter); //vertical
          text(60, xcenter + radius*1.5 + 60, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 150, ycenter + 5, xcenter + radius*1.5 + 150 , ycenter); //vertical
          text(150, xcenter + radius*1.5 + 150, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 135, ycenter - 5, xcenter + radius*1.5 + 135 , ycenter); //vertical
          text(135, xcenter + radius*1.5 + 135, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 120, ycenter + 5, xcenter + radius*1.5 + 120 , ycenter); //vertical
          text(120, xcenter + radius*1.5 + 120, ycenter + 20); //sine label
       
          line(xcenter + radius*1.5 + 210, ycenter + 5, xcenter + radius*1.5 + 210 , ycenter); //vertical
          text(210, xcenter + radius*1.5 + 210, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 225, ycenter - 5, xcenter + radius*1.5 + 225 , ycenter); //vertical
          text(225, xcenter + radius*1.5 + 225, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 240, ycenter + 5, xcenter + radius*1.5 + 240 , ycenter); //vertical
          text(240, xcenter + radius*1.5 + 240, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 330, ycenter + 5, xcenter + radius*1.5 + 330 , ycenter); //vertical
          text(330, xcenter + radius*1.5 + 330, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 315, ycenter - 5, xcenter + radius*1.5 + 315 , ycenter); //vertical
          text(315, xcenter + radius*1.5 + 315, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 300, ycenter + 5, xcenter + radius*1.5 + 300 , ycenter); //vertical
          text(300, xcenter + radius*1.5 + 300, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 90, ycenter - 5, xcenter + radius*1.5 + 90 , ycenter); //vertical
          text(90, xcenter + radius*1.5 + 90, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 180, ycenter - 5, xcenter + radius*1.5 + 180 , ycenter); //vertical
          text(180, xcenter + radius*1.5 + 180, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 270, ycenter - 5, xcenter + radius*1.5 + 270 , ycenter); //vertical
          text(270, xcenter + radius*1.5 + 270, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 360, ycenter - 5, xcenter + radius*1.5 + 360 , ycenter); //vertical
          text(360, xcenter + radius*1.5 + 360, ycenter - 10); //sine label
          
          //now for the cosine
          ycenter += radius*2.5;
         line(xcenter + radius*1.5 + 30, ycenter + 5, xcenter + radius*1.5 + 30 , ycenter); //vertical
          text(30, xcenter + radius*1.5 + 30, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 45, ycenter - 5, xcenter + radius*1.5 + 45 , ycenter); //vertical
          text(45, xcenter + radius*1.5 + 45, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 60, ycenter + 5, xcenter + radius*1.5 + 60 , ycenter); //vertical
          text(60, xcenter + radius*1.5 + 60, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 150, ycenter + 5, xcenter + radius*1.5 + 150 , ycenter); //vertical
          text(150, xcenter + radius*1.5 + 150, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 135, ycenter - 5, xcenter + radius*1.5 + 135 , ycenter); //vertical
          text(135, xcenter + radius*1.5 + 135, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 120, ycenter + 5, xcenter + radius*1.5 + 120 , ycenter); //vertical
          text(120, xcenter + radius*1.5 + 120, ycenter + 20); //sine label
       
          line(xcenter + radius*1.5 + 210, ycenter + 5, xcenter + radius*1.5 + 210 , ycenter); //vertical
          text(210, xcenter + radius*1.5 + 210, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 225, ycenter - 5, xcenter + radius*1.5 + 225 , ycenter); //vertical
          text(225, xcenter + radius*1.5 + 225, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 240, ycenter + 5, xcenter + radius*1.5 + 240 , ycenter); //vertical
          text(240, xcenter + radius*1.5 + 240, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 330, ycenter + 5, xcenter + radius*1.5 + 330 , ycenter); //vertical
          text(330, xcenter + radius*1.5 + 330, ycenter + 20); //sine label
          line(xcenter + radius*1.5 + 315, ycenter - 5, xcenter + radius*1.5 + 315 , ycenter); //vertical
          text(315, xcenter + radius*1.5 + 315, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 300, ycenter + 5, xcenter + radius*1.5 + 300 , ycenter); //vertical
          text(300, xcenter + radius*1.5 + 300, ycenter + 20); //sine label
          
          line(xcenter + radius*1.5 + 90, ycenter - 5, xcenter + radius*1.5 + 90 , ycenter); //vertical
          text(90, xcenter + radius*1.5 + 90, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 180, ycenter - 5, xcenter + radius*1.5 + 180 , ycenter); //vertical
          text(180, xcenter + radius*1.5 + 180, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 270, ycenter - 5, xcenter + radius*1.5 + 270 , ycenter); //vertical
          text(270, xcenter + radius*1.5 + 270, ycenter - 10); //sine label
          line(xcenter + radius*1.5 + 360, ycenter - 5, xcenter + radius*1.5 + 360 , ycenter); //vertical
          text(360, xcenter + radius*1.5 + 360, ycenter - 10); //sine label
          
          ycenter -= radius*2.5;
      }
      textFont(myFont);
      strokeWeight(3);
      stroke(0);
  // Draw sine line on circle
      stroke(255,0,0); //make it red
      line(xpoint, ypoint, xpoint, ycenter); //sine
  
  // Draw cosine line
      stroke(0,0,255); //make it blue
      line(xcenter,ycenter, xpoint, ycenter); //cosine
  
  // Draw sine line on graph
      fill(255);
      stroke(255,0,0); //make it red
      px2 = xcenter + radius*1.5 + theta;
      py2 = ycenter - sin(radians(theta))*(radius);
      stroke(0);
      ellipse(px2 ,py2,5,5); //point on end of radius
      stroke(255,0,0); //make it red 
      line(px2, py2, px2, ycenter); //sine
      
      fill(255,0,0);
      textAlign(LEFT);
      text(nf(sin(rads),1,3) , px2 + 10, py2);
      fill(255);
      
      //stroke(0);
      //strokeWeight(1);
      //line (xpoint, ypoint, px2, py2);
      
  // Draw cosine line on graph
      stroke(0,0,255); //make it blue
      px2 = xcenter + radius*1.5 + theta;
      py2 = ycenter + radius*2.5 - cos(radians(theta))*(radius);
      stroke(0);
      ellipse(px2 ,py2,5,5); //point on end of radius
      strokeWeight(3);
      stroke(0,0,255); //make it red 
      line(px2, py2, px2, ycenter + radius*2.5); //sine
      
      fill(0,0,255);
      textAlign(LEFT);
      text(nf(cos(rads),1,3) , px2 + 10, py2);
      fill(255);
      
      stroke(0);
      strokeWeight(1);
  
      if (button1.update())
        buttonRun();
  
}

