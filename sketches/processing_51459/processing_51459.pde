
boolean doSth = true;
boolean doSth2 = true;
int x=450;
int y=115;
int counter=0;


void setup() {
 size(850, 600);
 x=800;//these two were put back to set traits for 
 y=115;//void setup below, which restarts the animation
  background(255);
  smooth();
}
void draw(){
  background(255);
  //noLoop();
  strokeWeight(2);
  fill(#ffffff);
  ellipse(x, y-10, 125, 125);
  
  strokeWeight(2);//Inner circle
  fill(#ffffff);
  ellipse(x, y, 100, 100);

  fill(#000000, 100);//ear left
  rect(x-73, y-25, 10, 30);

  fill(#000000, 100);//ear right
  rect(x+63, y-25, 10, 30);


  //antenna
  line(x+75, y-15, x+80, y-15);//right
  line(x+80, y-75, x+80, y-15);//right
  strokeWeight(2);//circle
  ellipse(x+80, y-80, 10, 10);

  line(x-73, y-15, x-80, y-15);//left
  line(x-80, y-75, x-80, y-15);//left
  strokeWeight(2);//circle
  ellipse(x-80, y-80, 10, 10);

  //Triangles eyes
  fill(#000000, 100);//left
  triangle(x-35, y-25, x-15, y-25, x-25, y-5);

  fill(#000000, 100);//right
  triangle(x+10, y-25, x+30, y-25, x+20, y-5);

  fill(#000000, 100);//mouth
  rect(x-35, y+10, 60, 20);

  //Teeth
  line(x-35, y+10, x-25, y+30);
  line(x-25, y+30, x-15, y+10);
  line(x-15, y+10, x-5, y+30);
  line(x-5, y+30, x+5, y+10);
  line(x+5, y+10, x+15, y+30);
  line(x+15, y+30, x+25, y+10);

  //Next, draw a rectangle, body attributes
  //noStroke();
  strokeWeight(2);
  fill(255, 0, 0, 50);// torso
  rect(x-100, y+35, 200, 130);

  fill(200, 0, 230, 50);//Lower Body
  rect(x-100, y+185, 200, 60);

  fill(155, 230, 30);//mid Axel
  rect(x-20, y+164, 30, 22);

  fill(#ffffff, 0, 0, 100);//Legs
  rect(x-100, y+245, 25, 75);

  fill(#ffffff, 0, 0, 100);//Legs
  rect(x-30, y+245, 25, 75);

  fill(#ffffff, 0, 0, 100);//Legs
  rect(x+10, y+245, 25, 75);

  fill(#ffffff, 0, 0, 100);//Legs
  rect(x+75, y+245, 25, 75);

  fill(#ffffff, 0, 0, 100);//right triangle axel
  triangle(x+55, y+245, x+20, y+285, x+90, y+285);

  fill(#ffffff, 0, 0, 100);//left triangle axel
  triangle(x-55, y+245, x-90, y+285, x-15, y+285);

  //Arms
  strokeWeight(2);//Left
  stroke(#000000);
  fill(#ffffff);
  ellipse(x-100, y+60, 70, 70);
  ellipse(x-120, y+60, 70, 70);
  ellipse(x-140, y+60, 70, 70);
  ellipse(x-160, y+60, 70, 70);
  ellipse(x-180, y+60, 70, 70);
  ellipse(x-200, y+60, 70, 70);

  fill(#000000, 100);//left triangle hand
  triangle(x-205, y+25, x-205, y+100, x-260, y+65);


  stroke(#000000);//right
  fill(#ffffff);
  ellipse(x+100, y+60, 70, 70);
  ellipse(x+80, y+60, 70, 70);
  ellipse(x+60, y+60, 70, 70);
  ellipse(x+40, y+60, 70, 70);
  ellipse(x+20, y+60, 70, 70);
  ellipse(x, y+60, 70, 70);

  fill(#000000, 0, 0, 100);//right triangle hand
  triangle(x-5, y+25, x-5, y+100, x-60, y+65);


// STOP GO  
 if(doSth){x+=5; //-> if doSth == true
   println(x);
    }
 else println("Why was I programmed to do this...") ;
//} should be end of file

  if(doSth2){x-=5; //-> not sure what im doing with the second variable yet
  
    }
 else println("Why was I programmed to do this...") ;
}
void mouseClicked(){
setup();
}

void keyPressed(){
  if(key=='1') doSth = false;
  else doSth = true;
}


