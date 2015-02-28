
public float cst = 180.0;
int counter = 0;
float init1 = 1;
float tX = 0;
float tY = 0;
float[] numbers;

void setup() 

{
  size(600, 600);
  smooth();
  background(255);
}


void draw() {
  counter = 0;
  background(255);
  numbers = new float[206];
  fill(255);
  stroke(#FF0000);
  strokeWeight(1);

  ellipse(300, 300, 200, 200);
  stroke(128);

  float angle = atan2(mouseY - width/2, mouseX - height/2);

  float x2 = 300 + cos(angle + TWO_PI/360 )*100;
  float y2 = 300 + sin(angle + TWO_PI/360 )*100;
  ellipse(x2, y2, 10, 10);


  stroke(#0260D8);

  line(width/2 - 20, height/2, width/2 + 20, height/2);
  line(width/2, height/2 - 20, width/2, height/2 + 20);

  fill(0);
  int txt_adjust = int(degrees(angle) + 180);
  String tmpString = "" + txt_adjust;
  text(tmpString, 310, 290);
  noFill();
  strokeWeight(0.25);


  stroke(#56564B);


  float init_angle = degrees(angle);
  
 
  fill(255);
  //float init_angle = atan2(mouseY - width, mouseX - height);

  for (float i = 0.01; i<180; i = i*1.1)
  {

    float x = width/2 +  cos((init_angle + i)*TWO_PI/360 )*200;
    float y = height/2 + sin((init_angle + i)*TWO_PI/360 )*200;
    ellipse(x, y, 1*i, 1*i);
    float tmp1 = 180 + init_angle + i;
    if(tmp1 < 360) { numbers[counter] = tmp1; } else { numbers[counter] = tmp1 - 360; } 
    //numbers[counter] = tmp1;
    counter++;
    
  }

  float int2 = 1;  
  for (float i = 0.01; i < 180; i = i*1.1) {

    float x = width/2 + cos( (init_angle + 360 -i)*TWO_PI/360 )*200;
    float y = height/2 + sin( (init_angle + 360 - i)*TWO_PI/360 )*200;
    ellipse(x, y, 1*i, 1*i);
    float tmp2 = (init_angle + 360 - i) - 180;
    if(tmp2 >= 0) { numbers[counter] = tmp2; } else { numbers[counter] = 180 - tmp2; } 
    //numbers[counter] = tmp2;
    counter++;
    tX = x;
    tY = y;
  }
  fill(0);
  float tmpFloat = numbers[int(random(numbers.length))];
  String tmpString2 = "NULL";
  if(tmpFloat >=0 && tmpFloat < 30) { tmpString2 = "W2"; }
  if(tmpFloat >=30 && tmpFloat < 90) { tmpString2 = "NW"; }
  if(tmpFloat >=90 && tmpFloat < 150) { tmpString2 = "NE"; }
  if(tmpFloat >=150 && tmpFloat < 180) { tmpString2 = "E1"; }
  if(tmpFloat >=180 && tmpFloat < 210) { tmpString2 = "E2"; }
  if(tmpFloat >=210 && tmpFloat < 270) { tmpString2 = "SE"; }
  if(tmpFloat >=270 && tmpFloat < 330) { tmpString2 = "SW"; }
  if(tmpFloat >=330 && tmpFloat < 360) { tmpString2 = "W1"; }
  //tmpFloat = int(1000*tmpFloat);
  text(nf(tmpFloat,3,2) + " " + tmpString2, tX - 32, tY + 5);
  println("seq1: " + numbers[0] + "|" + numbers[102] + " seq2: " + numbers[104] + "|" + numbers[205]);
  
  noLoop();
}

void mouseMoved() {
  redraw();
}




