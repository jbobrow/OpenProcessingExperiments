
color c = color(0); //color black
color c1= color(255,0,0); //color red
color c2= color(0,255,0); //color green
color c3= color(0,0,255); //color blue
color c4= color(255,255,0); //color yellow
color c5= color(167,39,153); //color purple
color c6= color(0,255,255); //color sky blue
color c7= color(255,128,0); //color orange
color c8= color(255,3,192); //color pink
color c9= color(0); //color black

void setup(){
   size(450,400); //size of window
   background(245,220,220); //background color pinkish
   strokeWeight(5); //set stroke to 5
   fill(0); //fill text color black
   text("Press C to Clear. Draw by holding mouse.", 0, 40); //display text at postion 0,40
}


void draw(){
  pallet(0,0); //calling pallet function
  pic(); //calling the pic funtion that draws line
  if (keyPressed){ //if key is pressed...
    if (key == 'c') //if c is pressed...
      background(245,220,220); //background color light pinkish
      pallet(0,0); //calls pallet function
    }
  }


void pallet(int x, int y){ //define pallet function(color boxes on top)
 noStroke(); //gets rid of line around box  
 fill(255,0,0); //red
 rect(x,y,50,30); //red box
 
 fill(0,255,0); //green
 rect(x+50,y,50,30);  //green box
 
 fill(0,0,255); //blue
 rect(x+100,y,50,30); //blue box
 
 fill(255,255,0); //yellow
 rect(x+150,y,50,30); //yellow box
 
 fill(167,39,153); //purple
 rect(x+200,y,50,30); //purple box
 
 fill(0,255,255); //sky blue 
 rect(x+250,y,50,30); //sky blue box
 
 fill(255,128,0); //orange
 rect(x+300,y,50,30); //orange box
 
 fill(255,3,192); //pink
 rect(x+350,y,50,30); //pink box
 
 fill(0); //black
 rect(x+400, y, 50,30); //black box
}

void pickcolor(){ //choosing color of line
  int a = mouseX; //set a to mouse 
  int b= mouseY; //set b to mouse
  stroke(c); //set stroke to c (black)
  if (a>0 && a<50 && b>0 && b<30){  //if a is between 0-50 and b between 0-30 than...
    c = c1; //set c to c1
    stroke(c1); //change stroke to c1 (red)
  }
  if (a>51 && a<100 && b>0 && b<30){ //if a is between 51-100 and b is between 0-30 than...
    c = c2;  //set c to c2
    stroke(c2);  //change stroke to c2 (green)
  }
  if (a>101 && a<150 && b>0 && b<30){  //if a is between 101-150 and b between 0-30 than...
    c = c3; //set c to c3
    stroke(c3); //change stroke to c3 (blue)
  }
  if (a>151 && a<200 && b>0 && b<30){ //if a is between 151-200 and b is between 0-30 than...
    c = c4;  //set c to c4
    stroke(c4);  //change stroke to c4 (yellow)
  }
  if (a>201 && a<250 && b>0 && b<30){  //if a is between 201-250 and b between 0-30 than...
    c = c5; //set c to c5
    stroke(c5); //change stroke to c5 (purple)
  }
  if (a>251 && a<300 && b>0 && b<30){ //if a is between 251-300 and b is between 0-30 than...
    c = c6;  //set c to c6
    stroke(c6);  //change stroke to c6 (sky blue)
  }
  if (a>301 && a<350 && b>0 && b<30){ //if a is between 301-350 and b is between 0-30 than...
    c = c7;  //set c to c7
    stroke(c7);  //change stroke to c7 (orange)
  }
  if (a>351 && a<400 && b>0 && b<30){  //if a is between 351-400 and b between 0-30 than...
    c = c8; //set c to c8
    stroke(c8); //change stroke to c8 (pink)
  }
  if (a>401 && a<450 && b>0 && b<30){ //if a is between 401-450 and b is between 0-30 than...
    c = c9;  //set c to c9
    stroke(c9);  //change stroke to c9 (black)
  }
 
}

void pic(){ //drawing lines function
 pickcolor(); //calling funtion to pick color for lines
 if (mousePressed == true){ //if the mouse is pressed than...
   line(mouseX,mouseY,pmouseX,pmouseY); //start drawing line where mouse is. pmousex and y uses the last mousex and y postion to drawing the end point
 } 
}


  


