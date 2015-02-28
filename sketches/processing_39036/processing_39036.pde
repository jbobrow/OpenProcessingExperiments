
void setup () {
  size (500, 200);
  smooth();
  value3=0;
  value4=255;
  value6=255;
  value8=255;
  value10=255;
}


int value1, value2, value3, value4, value5, value6, value7, value8, value9, value10;
float d, d2, d3, d4, d5, d6, d7, d8, d9, d10;
float diam=100;

void draw() {
  background (127);
  noStroke ();





  //mouse pressed
  //upper

  d=dist(50, 50, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
    value1 = 255;
  } 
  else {
    value1 = 0;
  }

  fill (value1);
  ellipse (50, 50, diam, diam);
    arrow3 (50, 50, 255);



  //lower
  d2=dist(50, 150, mouseX, mouseY);
  if ((d2<=diam/2)&(mousePressed)) {
    value2 = 0;
  } 
  else {
    value2 =255;
  }

  fill (value2);
  ellipse (50, 150, diam, diam);
         arrow3 (50, 150, 0);



  //mouse clicked
  //upper



  fill (value3);
  ellipse (150, 50, diam, diam);
 arrow2 (145, 50, 255);
  arrow2 (155, 50, 255);


  //lower


  fill (value4);
  ellipse (150, 150, diam, diam);

arrow2 (145, 150, 0);
  arrow2 (155, 150, 0);




  //mouse released
  fill (value5);
  ellipse (250, 50, diam, diam);
    arrow1 (245, 50, 255);
  arrow1 (255, 50, 255);



  fill (value6);
  ellipse (250, 150, diam, diam);
  arrow1 (245, 150, 0);
  arrow1 (255, 150, 0);


  //mouse clicked done
  fill (value7);
  ellipse (350, 50, diam, diam);
arrow2 (350, 50, 255);
  
  fill (value8);
  ellipse (350, 150, diam, diam);
arrow2 (350, 150, 0);



  //mouse released done
  fill (value9);
  ellipse (450, 50, diam, diam);
  arrow1 (450, 50, 255);
  
  fill (value10);
  ellipse (450, 150, diam, diam);
    arrow1 (450, 150, 0);
}




void mousePressed() {
  d3=dist(150, 50, mouseX, mouseY);
  d4=dist(150, 150, mouseX, mouseY);
  d7=dist(350, 50, mouseX, mouseY);
  d8=dist(350, 150, mouseX, mouseY);


  if ((value3 == 255)&&(d3<=diam/2)) {
    value3 = 0;
  } 
  else if ((value3 == 0)&&(d3<=diam/2)) {
    value3 = 255;
  }



  if ((value4== 0)&&(d4<=diam/2)) {
    value4 = 255;
  } 
  else if ((value4 == 255)&&(d4<=diam/2)) {
    value4 = 0;
  }



  if ((value7== 0)&&(d7<=diam/2)) {
    value7= 255;
  } 
  else if ((value7 == 255)&&(d7<=diam/2)) {
    value7 = 255;
  }


  if ((value8== 255)&&(d8<=diam/2)) {
    value8= 0;
  } 
  else if ((value8 == 0)&&(d8<=diam/2)) {
    value8 = 0;
  }
}

void mouseReleased() {
  d5=dist(250, 50, mouseX, mouseY);
  d6=dist(250, 150, mouseX, mouseY);
  d9=dist(450, 50, mouseX, mouseY);
  d10=dist(450, 150, mouseX, mouseY);

  if ((value5 == 255)&&(d5<=diam/2)) {
    value5= 0;
  } 
  else if ((value5 == 0)&&(d5<=diam/2)) {
    value5 = 255;
  }



  if ((value6== 0)&&(d6<=diam/2)) {
    value6= 255;
  } 
  else if ((value6 == 255)&&(d6<=diam/2)) {
    value6 = 0;
  }



  if ((value9 ==0)&&(d9<=diam/2)) {
    value9= 255;
  } 
  else if ((value9 == 255)&&(d9<=diam/2)) {
    value9 = 255;
  }


  if ((value10== 255)&&(d10<=diam/2)) {
    value10= 0;
  } 
  else if ((value10 == 0)&&(d10<=diam/2)) {
    value10 = 0;
  }
}


void arrow1 (int x, int y, int fil) {
  noStroke ();
  fill(fil);
  rect  (x-2, y-3, 4, 10);
  triangle  (x, y-5, x-5, y, x+5, y);
}

void arrow2 (int x, int y, int fil) {
  noStroke ();
  fill(fil);
  rect  (x-2, y-6, 4, 10);
  triangle  (x, y+8, x-5, y+3, x+5, y+3);
}

void arrow3 (int x, int y, int fil) {
  noStroke ();
  fill(fil);
  rect  (x-2, y-6, 4, 10);
  triangle  (x, y-8, x-5, y-3, x+5, y-3);
  triangle  (x, y+8, x-5, y+3, x+5, y+3);
}
                
                
