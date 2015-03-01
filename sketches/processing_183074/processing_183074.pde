
/* Get two integer values from the user and make a Math Board, where you write out various math 
values based on the two numbers: x^y, x*y, x/y, x!, log base x of y, x^2, x^3, x^(1/2), x^(1/3),
etc. The various values are located at specific places on the canvas. Make it clear, presentable, 
and colorful. Mouse button left sets x=0, right sets y=0, wheel toward user increases x/y value, 
away decreases it. Type X and wheel affects x value, type Y and wheel affects y value.
*/
char var = 'x';
int x = 1;
int y = 1;
float i = 0;
int thug = 1;
float angle = i;

void setup() {
  size(650,700,P3D);
  f = createFont("Tw Cen MT",16,true); // STEP 3 Create Font
}

void draw() {
  background(100,230,250);
  textFont(f,20);                         // STEP 4 Specify font to use
  fill(10,110,50);                        // STEP 5 Specify font color
  pushMatrix();
  popMatrix();
  translate(250,20,-50);    
  rotateY(-PI + mouseX/100.0);
 // rotateY(angle);
  //rotateX(PI/12);
 // directionalLight(230,240,250,1,1,-1);
  //lights();
  text("x: "+x,50,20);  // STEP 6 Display Text
  text("y: " + y,210,20);  // STEP 6 Display Text
  float width = 45;
  float init = 30;
  for (int j = 1; j < 12; j++){
    float height =  (float)j*30 + init;
    line(width*3,(float)(j-1)*30 + 25, width*3,(float)(j)*30 + init+10);
    fill(130,130,200);
    pushMatrix();
    beginShape();
    vertex(0,(float)(j-1)*30 + 30,0);
    vertex(300,(float)(j-1)*30 + 30,0);
    vertex(300+20,(float)(j-1)*30 + 30,-20);
    vertex(0,(float)(j-1)*30 + 30,-20);
    endShape();
    fill(200,255,230);
    beginShape();
    vertex(0,(float)(j-1)*30 +30,-2);
    vertex(300,(float)(j-1)*30 +30,0);
    vertex(300,(float)(j-1)*30 + init+40,0);
    vertex(0,(float)(j-1)*30 + init+40,-2);
    endShape();
    popMatrix();
    
    pushMatrix();
    translate(0,(float)(j)*30 + init+10,0);
    noFill();
    stroke(255);
    sphereDetail(7);
    sphere(10);
    popMatrix();
    pushMatrix();
    translate(300,(float)(j)*30 + init+10,0);
    sphere(10);
    popMatrix();

    fill(0);
    switch (j){
      case 1:
        text("x+y", width,height);
        text(x+y, (float)width*3,height);
        break;
        
      case 2:
        text("x-y", width,height);
        text(x-y, (float)width*3,height);
        break;
        
      case 3:
        text("x*y", width,height);
        text(x*y, (float)width*3,height);
        break;
        
      case 4:
        text("x/y", width,height);
        text(x/(y+pow(10,-50)), (float)width*3,height);
        break;
        
      case 5:
        text("x^y", width,height);
        text(pow(x,y), (float)width*3,height);
        break;

      case 6:
        text("x^2", width,height);
        text(pow(x,2), (float)width*3,height);
        break;
        
      case 7:
        text("x^3", width,height);
        text(pow(x,3), (float)width*3,height);
        break;
       
      case 8:
        text("x^(1/2)", width,height);
        text(pow(x,1/2), (float)width*3,height);
        break;

      case 9:
        text("x^(1/3)", width,height);
        text(pow(x,1.0/3), (float)width*3,height);
        break;
        
      case 10:
        text("x!", width,height);
        int rep = 1;
        for (int fact = 1; fact <= x; fact++)
          rep *= fact;
        text(rep, (float)width*3,height);
        break;

      case 11:
        text("logy of x", width,height);
        text(log(x)/log(y), (float)width*3,height);
        break;

    }
    line(0,height + 10, 300,height + 10);
      translate(-17,17,25);
      rotateY(PI/40);

  }
  delay(10);
  if (abs(angle) >= PI/8.0){
    thug *= -1;
  }
  i += thug*2/(12*i+1);
  angle += thug/(200.0*abs(angle) + 120.0101);
}

void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}

void mouseClicked(){
  if (mouseButton == LEFT){
    x = 0;
  }
  else if (mouseButton == RIGHT){
    y = 0;
  }
  redraw();
}

void mouseWheel(MouseEvent event){
  if (var == 'x'){
    x += -1*event.getCount();
  }
  else if (var == 'y'){
    y += -1*event.getCount();
  }
  redraw();
}

void keyPressed(){
  var = key;
  redraw();
}
