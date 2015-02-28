
Wheel wheels[] = new Wheel[1];
int timer;
int counter;
PImage imgMac;
float tall;

void setup() {
  frameRate(29);
  size(1300, 813);
  imgMac = loadImage("Screen4.jpg");
  wheels[0] = new Wheel(50, height/2, 10.1, 14, 14.1, 10.2, 6.05, 7, 10.05, 18, 10.15, 6.1, 3, 2, 1.00, 1.05, 1.1, 2.1, 6.15, 15, 18.05, 18.10, 18.15, 18.20, 18.25, 14.5);
  timer = 0;
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {
  background(0);
  image(imgMac,0,0);
  textAlign(CENTER);
         fill(255);
         textSize(50);
         text("INTERNET SPEED VS TIME OF DAY", width/2,150 );
         println("#5");
  timer++;
  if (timer % 100 == 0) {
    for (int i=0;i<wheels.length;i++) {
      wheels[i].changeAmount();
      println("in here");
    }
  }
  for (int j=0;j<wheels.length;j++) {
    wheels[j].display();
  }
  
    
  
}

class Wheel {
  int x;
  int y;
  float amount[] = new float[24];
  int currentIndex = 0;

  // x, y, ---and hard coded data.  You will have many more..
  Wheel(int _x, int _y, float _0, float _1, float _2, float _3, float _4,float _5, float _6, 
     float _7, float _8, float _9, float _10, float _11, 
     float _12, float _13, float _14, float _15, float _16, 
     float _17, float _18, float _19, float _20, float _21,
     float _22, float _23) {
    x = _x;
    y = _y;
    amount[0] = _0; //8am 80
    amount[1] = _1; //9am 90
    amount[2] = _2; //10am 90
    amount[3] = _3; //11am 80
    amount[4] = _4; //12am 60
    amount[5] = _5; //1pm 70
    amount[6] = _6; //2pm 80
    amount[7] = _7; //3pm 100
    amount[8] = _8; //4pm 80
    amount[9] = _9; //5pm 60
    amount[10] = _10; //6pm 30
    amount[11] = _11; //7pm 20
    amount[12] = _12; //8pm 20
    amount[13] = _13; //9pm 10
    amount[14] = _14; //10pm 10
    amount[15] = _15; //11pm 10
    amount[16] = _16; //12pm 20
    amount[17] = _17; //1am 60
    amount[18] = _18; //2am 100 
    amount[19] = _19; //3am 100
    amount[20] = _20; //4am 100
    amount[21] = _21; //5am 100
    amount[22] = _22; //6am 100
    amount[23] = _23; //7am 90 then start up top again

  }
  void changeAmount() {
    currentIndex++;
    if (currentIndex >= amount.length) { // we've gone through all the index.  Start back at beginning
      currentIndex = 0;
    }
  }
  void display() {
    float sphere = int(amount[currentIndex]* 20); // access the array.  What is the current value to present?  Also multiply it, to make it bigger
    //color fillColor = color(30,30,255); // if it is positive, make it blue...
    //ellipse(x-15, y-tall, 30, tall);
    
       if(sphere == 202) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("8:00am", 1220, 15);
         println("#1");
       }
     else if(sphere == 280) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("9:00am", 1220, 15);
          println("#2");
     }
     
     else if(sphere == 282) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("10:00am", 1220, 15);
         println("#3");
     } 
       else if(sphere == 204) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("11:00am", 1220, 15);
         println("#4");
     }    
     else if(sphere == 121) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("12:00pm", 1220, 15);
         println("#5");
     }    
     else if(sphere ==  140) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("1:00pm", 1220, 15);
         println("#6");
     }    
     else if(sphere == 201) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("2:00pm", 1220, 15);
         println("#7");
     }    
     else if(sphere == 360) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("3:00pm", 1220, 15);
         println("#8");
     }    
     else if(sphere == 203) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("4:00pm", 1220, 15);
         println("#9");
     }    
     else if(sphere == 122) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("5:00pm", 1220, 15);
         println("#10");
     }    
     else if(sphere == 60) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("6:00pm", 1220, 15);
         println("#11");
     }    
     else if(sphere == 40) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("7:00pm", 1220, 15);
         println("#12");
     }    
     else if(sphere == 20) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("8:00pm", 1220, 15);
         println("#13");
     }    
         else if(sphere == 21) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("9:00pm", 1220, 15);
         println("#14");
     }    
     else if(sphere == 22) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("10:00pm", 1220, 15);
         println("#15");
     }    
     else if(sphere == 42) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("11:00pm", 1220, 15);
         println("#16");
     }   
    else if(sphere == 123 ) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("12:00am", 1220, 15);
         println("#17");
     }    
    else if(sphere == 300) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("1:00am", 1220, 15);
         println("#18");
     }
 else if(sphere == 361) {   
   color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("2:00am", 1220, 15);
         println("#19");
     }    
     
  else if(sphere == 362) {   
   color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("2:00am", 1220, 15);
         println("#19.5");
  }
      else if(sphere == 363) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("3:00am", 1220, 15);
         println("#20");
     }
   else if(sphere == 364) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("4:00am", 1220, 15);
         println("#21");
     }
 else if(sphere == 365) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("5:00am", 1220, 15);
         println("#22");
     }
 else if(sphere == 290) {   
        color headColor = color(229,189,162);
        textAlign(CENTER);
         fill(0);
         textSize(19);
         text("6:00am", 1220, 15);
         println("#23");
     }   

    
  counter++;
  stroke(0);
  fill(random(255),150,255,150);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter)+ sphere, 80*sin(counter)+sphere);
  }
  
  }
}





