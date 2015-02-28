
boolean ONCE=true;
PFont font;
int width=560;
int height=420;

boolean[] state_array = new boolean[25];

int[] array_xpos = new int[24];
int[] array_ypos = new int[24];

int[] framerates = {15, 80, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,20};

int true_statenumber;

int xpos, ypos;

int framerate_value=15;

boolean sqeeze=false;


ArrayList<Window>  windows;
 ArrayList<State_5> stripes;



Window myState;


void setup() {
 
  size(560, 420);

  windows = new ArrayList<Window>();
  stripes = new ArrayList<State_5>(); 

  windows.add(new State_0());//calender
   windows.add(new State_5(new PVector(560/2+random(-15, 15), 420/2+random(-15, 15)), 50));//pusteblume
  windows.add(new State_1());//pingpong
 windows.add(new State_2());//sunset
 
 
   windows.add(new State_6(width/2, height/2+50)); //only snowman
    windows.add(new State_7(width/2, height/2+70));//snowwoman disco
    windows.add(new State_8());//rocketsanta
    windows.add(new State_9());//funnypainting
     windows.add(new State_nothingyet());
      windows.add(new State_nothingyet());
       windows.add(new State_nothingyet());
        windows.add(new State_nothingyet());
         windows.add(new State_nothingyet());
          windows.add(new State_nothingyet());
           windows.add(new State_nothingyet());
            windows.add(new State_nothingyet());
             windows.add(new State_nothingyet());
               windows.add(new State_nothingyet());
         windows.add(new State_nothingyet());
          windows.add(new State_nothingyet());
           windows.add(new State_nothingyet());
            windows.add(new State_nothingyet());
             windows.add(new State_nothingyet());
               windows.add(new State_nothingyet());
         windows.add(new State_nothingyet());
          windows.add(new State_nothingyet());
           windows.add(new State_nothingyet());
           windows.add(new State_nothingyet());
           // windows.add(new State_nothingyet());
      

  font = loadFont("AdobeMyungjoStd-Medium-48.vlw");
  textFont(font, 24);



  for (int x=1; x<7; x++) {
    for (int y =1; y<5; y++) {

      xpos = x*70 +25;
      ypos = y*70 +45;
      array_xpos[(x+(y-1)*6)-1] = xpos;
      array_ypos[(x+(y-1)*6)-1] = ypos;
    }
  }






  for (int i =0; i<state_array.length; i++) {
    if (i == 0) {
      state_array[i]=  true;
    }
    else {
      state_array[i]=  false;
    }
  }
}


void draw() {


  for (int i=0; i<state_array.length; i++) {
//println("state " + i + " " + state_array[i]);

    if (state_array[i]==true) {
      true_statenumber=i;
      frameRate(framerates[i]);
    }
  }
  
  
  if(state_array[1]==true){
    background(255);
    for (int i=0; i<10; i++) {
    stripes.add(new State_5(new PVector(560/2+random(-15, 15), 420/2+random(-15, 15)), 50)    );
    fill(0);
    
 
    
  }
    Iterator<State_5> it =stripes.iterator();

    while (it.hasNext ()) {
      State_5 s = it.next();
      s.run();

      if (s.isDead()) {
        it.remove();
      }
    }
  }
  
  



  // display the calender window

  Window w= windows.get(true_statenumber);
  
    //first image white background;
  if (ONCE && state_array[0] == false) {
    //("here!");
    background(255);
    ONCE=false;
  }
  
  
  w.run();

  //end the display
  if (w.isStopped()) {
    ONCE=true;
    print("what?");
     state_array[true_statenumber]=false;
    state_array[0]=true;
   
  }
}



void mousePressed() {
  if(state_array[0]){
  rect(mouseX-5, mouseY-5, 10, 10);

  for (int i=0; i<array_xpos.length; i++) {
    //   for (int n=0; n<array_ypos.length; n++) {
    if (mouseX < array_xpos[i]+25 && mouseX > array_xpos[i]-25 && mouseY < array_ypos[i]+25 && mouseY > array_ypos[i]-25) {
      stroke(255);
      rect(mouseX-5, mouseY-5, 10, 10);
      state_array[i+1]=true;
      state_array[0]=false;

      //   }
    }
  }
}
}



class Window {

  Window() {
  }

  void run() {
  }
  boolean isStopped() {
    return false;
  }
}



 

class State_1 extends Window{


  PVector location;
  PVector speed;
  color fillcolor;
  /* @pjs preload="christmastree.png"; */
  PImage img;
  //PImage img2;
  int i;
  color [][] color_array = new color[560][420];
  float noisez;
  randomPolygon myPolygon; 
float z=0.2;



  State_1() {
    
      
    fillcolor = color(random(35, 85), random(75, 105), 188, 150);
    location = new PVector(560/2, 420/2);
    speed = new PVector(-2.8, 3.4);
    speed.mult(1.48);
    img=loadImage("christmastree.png");
    //img2=loadImage("cookie.png");
    
    img.loadPixels();

    
  
    
    

    
    
    for (int x=0; x<img.width; x++){
      for(int y=0; y<img.height; y++){
        color_array[x][y]=img.pixels[x+img.width*y];
      }
    }
  }

  void Update() {
    //speed.mult(random(0.9, 1.1));
    location.add(speed);
    //stroke(0);}
  }

  void Display() {
     fill(lerpColor(fillcolor, color_array[int(location.x)][int(location.y)], 0.35), 125);
   noisez=noise(z);
   // ellipse(location.x, location.y, 12+10*noisez, 12+10*noisez);
    pushMatrix();
    translate(location.x, location.y);
    myPolygon = new randomPolygon(8+2*noise(z));
    popMatrix();
    z+=0.05;
  }

  void checkEdges() {

    if (location.x > width -10|| location.x < 10) {
      speed.x *= -1;
      fillcolor=color(random(165, 195), random(35, 50), 157, 150);
       
      fill(lerpColor(fillcolor, color_array[int(location.x)][int(location.y)], 0.35), 125);
    }
    if (location.y > height-10 || location.y < 10) {
      speed.y *=-1;
      fillcolor=color(random(35, 85), random(75, 105), 188, 150);
       
      fill(lerpColor(fillcolor, color_array[int(location.x)][int(location.y)], 0.35), 125);
    }
  }

  void run() {
    Update();
    Display();
    checkEdges();
  }
  
   boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}



class randomPolygon{
  
  float dimension;
  
  
  randomPolygon(float _dimension){
    
    dimension = _dimension;
    
    beginShape();
    vertex(dimension*sin(random(0, 2*PI/6)), dimension*cos(random(0, 2*PI/6)));
    vertex(dimension*sin(random(2*PI/6,4*PI/6)), dimension*cos(random(2*PI/6, 4*PI/6)));
    vertex(dimension*sin(random(4*PI/6,6*PI/6)), dimension*cos(random(4*PI/6, 6*PI/6)));
  vertex(dimension*sin(random(6*PI/6,8*PI/6)), dimension*cos(random(6*PI/6, 8*PI/6)));
  vertex(dimension*sin(random(8*PI/6,10*PI/6)), dimension*cos(random(8*PI/6, 10*PI/6)));

    endShape(CLOSE);
  
  
}
}



class State_2 extends Window {

  float [] yvalues = new float[560];
  float xincr;
  float x_old;
  float yvalue_old;
  float ypos;
  color fillcolor1;
  color fillcolor2;
  float noisestart;
  float dx;
  float dy;
  float easing = 0.0002;
  PVector[] vectors= new PVector[560];

  PImage img;
  PImage img2;



  State_2() {
    xincr= random(100);




    img=createImage(560, 420, RGB);

    for (int i = 0; i<560; i++) {

      xincr+=0.04;
      yvalues[i] = 13.3*sin(0.034*i)+14.4*cos(0.2*i)+3.4*40*noise(xincr)+420/2;

      if (x_old < i) {
        stroke(0);
        // line(x_old, yvalues[i-1], i, yvalues[i]);
      }

      x_old =i;
      //  }
    }
  }

  PImage fillColors(color fillcolor1, color fillcolor2) {

    img.loadPixels();
    for (int i=0; i<img.width; i++) {
      for (int n=0; n<img.height; n++) {
        if (n<yvalues[i]) {
          img.pixels[i+n*560]= color(fillcolor1);
        }

        else {
          img.pixels[i+n*560]= color(fillcolor2);
        }
      }
    }
    img.updatePixels();
    return img;
  }

  void drawLines() {
    //background(img);

    for (int i=0; i<img.width; i++) {
      if (i>0) {
        stroke(255, 80);

        float targetX = mouseX;
        float targetY= mouseY;
        dx+=(targetX-dx)*easing;
        dy+=(targetY-dy)*easing;


        line(dx, dy, i-1, yvalues[i-1]);

        fill(255, 80);
         
        ellipse(dx, dy, mouseY/height*70, mouseY/height*70);
        stroke(255);
        line(i, yvalues[i], i-1, yvalues[i-1]);

        vectors[i]=new PVector((i-1)-dx, yvalues[i-1]-dy);


        stroke(0);
        pushMatrix();
        translate(i-1, yvalues[i-1]);
        if (vectors[i].heading2D()  > 0 && vectors[i].heading2D() <2*PI ) {
          
          line(0, 0, vectors[i].x/5, (vectors[i].y)/5);
          
         
        }
        popMatrix();
      }
    }
  }


  color[] getColor() {

    color[] fillcolors=new color[2];

    fillcolors[0]=  color( 232,mouseX/float(width)*255*1.2, 100);
    fillcolors[1]=  color(32, mouseY/float(height)*255*0.7, 130);
   
    return fillcolors;
  }
  boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }


  void run() {
    color [] fillcolor = getColor();


    PImage img2 = fillColors(fillcolor[0], fillcolor[1]);


    image(img2, 0, 0);
    drawLines();




    if (mousePressed) {    
      for (int x = 0; x<width; x++) {

        xincr+=0.04;
        yvalues[x] = 13.3*sin(0.034*x)+14.4*cos(0.2*x)+3.4*40*noise(xincr)+height/2;
      }
    }
  }
}



class State_3 extends Window{

color fillcolor;

 

  State_3() {
    
  
  }

  void Update() {
    
    fillcolor=color(random(35, 85), random(75, 105), 188, 150);

  }

  void Display() {
    fill(fillcolor);
    rect(0,0, width, height);
  }

  

  void run() {
    Update();
    Display();
   
  }
  
   boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}



class State_4 extends Window{


color fillcolor;
 

  State_4() {
    
  
  }

  void Update() {
    
    fillcolor=color(random(35, 85), random(75, 105), 188, 150);

  }

  void Display() {
    fill(fillcolor);
    rect(0,0, width, height);
  }

  

  void run() {
    Update();
    Display();
   
  }
  
   boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}



class State_5 extends Window{
  
  PVector location;
  PVector acceleration;
  PVector velocity; 
  float diam;
  float lifespan;
  PVector accelerator=new PVector(0, 0);
  PVector aim1;
  PVector aim2;
  float alpha_rot;
  float c=0.0002;
   ArrayList<State_5> stripes;
   PFont myfont;
  // PFont myfont2;

  

  
 



 

  State_5(PVector l, float _diam) {
    

  
  
  
  diam=_diam;
    location=l.get();
    velocity=new PVector(0, 0 );
    //acceleration = new PVector(random(-0.01,0.01),random(-0.01,0.01) );
    if (mouseX < location.x+20 && mouseX > location.x -20 && mouseY < location.y+20 && mouseY > location.y -20 ) {
      accelerator = new PVector(location.x-mouseX, location.y-mouseY);
      accelerator.mult(-0.001);
      accelerator.limit(0.02);
    }

    lifespan=255;
    aim1=new PVector (0, random (4, 6));
    alpha_rot = random(-PI/6, PI/6);
    aim1=rotate2D(aim1, alpha_rot);
    //aim1.rotate(alpha_rot);
    aim2=new PVector (0, random (-4, -6));
    aim2=rotate2D(aim2, alpha_rot);
    
  
  }
  
  void applyForce(PVector force){
    accelerator.add(force);
  }

    void Update() {
     
    stroke(0,55-0.002*lifespan, 66, 0.2*lifespan);
       if(mousePressed){
      accelerator.mult(1.5);
    }
    
    float speed2= velocity.mag();
     float dragMagnitude= c*speed2*speed2;
     PVector drag = velocity.get();
     drag.mult(-1);
     drag.normalize();
     drag.mult(dragMagnitude);
    
     applyForce(drag);
    //  acceleration.add(accelerator);
    velocity.add(accelerator);
    location.add(velocity);
    lifespan -=0.6;
 
  }

  void Display() {
     
    float x1= location.x+aim1.x;
    float y1 =location.y+aim1.y;

    float x2 = location.x+aim2.x;
    float y2 = location.y+aim2.y;
 fill(255);
    rect(width, height, 0,0);
    line(x1, y1, x2, y2);
   
  }
    boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    }
    else {
      return false;
    }
  }

  

  void run() {
    
    fill(255);
    rect(width, height, 0,0);
    
    Update();
    Display();
    
   
   
  }
  
   boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}

PVector rotate2D(PVector v, float theta) {
  // What's the magnitude?
  float m = v.mag();
  // What's the angle?
  float a = v.heading2D();

  // Change the angle
  a += theta;

  // Polar to cartesian for the new xy components
  v.x = m * cos(a);
  v.y = m * sin(a);
  return new PVector(v.x, v.y);
}



class State_6 extends Window {

  boolean ONCE=true;
  color fillcolor;



  float z2;


  int xpos;
  int ypos;
  float alpha;
  float z;
  boolean squeeze;
  boolean feet;
  boolean belly;
  boolean head;
  boolean nose;
  boolean coloring;
  float  randomnumber;

  boolean strokes;
  





  State_6(int _xpos, int _ypos) {
    xpos = _xpos;
    ypos = _ypos;
    squeeze=false;
    feet=false;
    belly=false;
    head=false;
    nose=false;
    coloring=false;
    strokes=false;
  }

  void draw() {
    if (squeeze) {
      z+=0.91;
    }
    else {
      z+=0.31;
    }
    fill(255);
    background(0);
    pushMatrix();//beginning of snowman


    translate(xpos, ypos); //snowman center


    fill(255);
    stroke(255);


    pushMatrix();






    stroke(255);
    fill(255);
    translate(0, 30+noise(z)); //bottom
    if (feet == false) {
      if (coloring==false) {
        noFill();
      }
      else {
        fill(fillcolor);
      }
    }
    else {
      fill(255);
    }
    if(feet == true && coloring == true){
      fill(fillcolor);
      feet=false;
      //coloring=false;
      
    }
    beginShape();
    for (alpha=0;alpha<(2*PI); alpha+=0.4) {

      vertex(30 * sin(alpha), 27 * cos(alpha));
      // vertex(30 * sin(-alpha), 30 * cos(-alpha));
    }
    endShape(CLOSE);

    popMatrix();



    pushMatrix();//middle
    translate(-1+noise(4*z), 0);

    if (belly == false) {
      if (coloring==false) {
        noFill();
      }
      else {
        fill(fillcolor);
      }
    }
    else {
      fill(255);
    }
    if(belly == true && coloring == true){
      fill(255);
      belly=false;
      //coloring =false;
      
    }
    beginShape();
    for (alpha=0;alpha<(2*PI); alpha+=0.5) {

      vertex(25 * sin(alpha), 23 * cos(alpha));
      // vertex(30 * sin(-alpha), 30 * cos(-alpha));
    }
    endShape(CLOSE);
    fill(0);
    ellipse(3, -5, 5, 5);
    ellipse(5, 10, 5, 5);
    fill(255);
    popMatrix();




    pushMatrix();//head
    translate(sin(z), -30);
    if (head == false) {
      if (coloring==false) {
        noFill();
      }
      else {
        fill(fillcolor);
      }
    }
    else {
      fill(255);
    }
    if(head == true && coloring == true){
      fill(fillcolor);
      head=false;
      //coloring =false;
      
    }
    beginShape();
    for (alpha=0;alpha<(2*PI); alpha+=0.5) {

      vertex(15 * sin(alpha), 15 * cos(alpha));
      // vertex(30 * sin(-alpha), 30 * cos(-alpha));
    }
    endShape(CLOSE);



    fill(0);
    if (squeeze ==false) {
      noStroke();
      ellipse(7, -5, 6, 6);
      ellipse(-4, -4, 6, 6);
    }
    else {
      stroke(0);
      strokeWeight(2);
      line(3, -4, 10, -6);
      line(-7, -4, -3, -6);
      noStroke();
    }


    if (nose == true) {
      drawCarrot(1, 0);
    }

    popMatrix();


    popMatrix(); //end of snowman
  }



  void keyPressed() {

    if (key =='f' || key == 'F') {
      feet = true;
      
    }

    if (key == 'b' || key == 'B') {
      belly = true;
    }

    if (key =='h' || key == 'H') {
      head = true;
    }

    if (key == 'n' || key == 'N') {
      nose = true;
    }


    if (key == 'c' || key == 'C') {
      coloring = true;
    }
  }


  void chooseColor() {


    randomnumber=random(1);
    if (randomnumber <0.33) {
      fillcolor = color(232, 12, 151);
    }
    else if (randomnumber <0.66) {
      fillcolor = color(232, 93, 12);
    }
    else {
      fillcolor = color(12, 182, 232);
    }
    stroke(255);
  }





  void run() {

    pushMatrix();
    if (mouseX < width/2 + 10 && mouseX > width/2 -10 && mouseY< height/2+20 && mouseY> height/2) {

      squeeze=true;
    }
    else {
      squeeze=false;
    }
    chooseColor();
    draw();
    keyPressed();
    popMatrix();
    noFill();
    stroke(0);
  }



  void drawCarrot(float _xpos, float _ypos) {
    pushMatrix();
    translate(_xpos, _ypos);
    fill(#E37520);
    //stroke(0);
    beginShape();
    vertex(0, -6);
    vertex(-6, 6);
    vertex(22, 10);
    endShape();
    popMatrix();
  }






  boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}



class State_7 extends Window {

 
  color fillcolor;



  float z2;


  int xpos;
  int ypos;
  float alpha;
  float zx;
  float zy;
  float ey, ey_old,  ey_old2;
  float ex, ex_old, ex_old2;
  boolean squeeze;
  boolean feet;
  boolean belly;
  boolean head;
  boolean nose;
  boolean coloring;
  
  boolean one;
  boolean two;
  boolean three;
  boolean four;
  
  float  randomnumber;
  float fac_zx, fac_zy;

  boolean strokes;
  boolean ONCE;
  boolean one_time;





  State_7(int _xpos, int _ypos) {
    xpos = _xpos;
    ypos = _ypos;
    fac_zx= 1.0;
    fac_zy = 1.0;
    squeeze=false;
    feet=false;
    belly=false;
    head=false;
    nose=false;
    coloring=false;
    strokes=false;
    one_time=true;
    boolean one=false;
    boolean two =false;
    boolean three = false;
    boolean four = false;
  }

  void draw() {
    if (squeeze) {
      zx+=0.91;
      zy+=0.91;
      one_time=true;
    }
    else {
      zx+=0.31;
      zy+=0.31;
      one_time=true;
    }
    fill(255);
    background(0);
    pushMatrix();//beginning of snowman


    translate(xpos, ypos); //snowman center


    fill(255);
    stroke(255);


    pushMatrix();






    stroke(255);
    fill(255);
    translate(0, 30+fac_zy*noise(zy)); //bottom
  
      fill(255);
 
    
      //coloring=false;
      
    
    beginShape();
    for (alpha=0;alpha<(2*PI); alpha+=0.4) {

      vertex(30 * sin(alpha), 27 * cos(alpha));
      // vertex(30 * sin(-alpha), 30 * cos(-alpha));
    }
    endShape(CLOSE);

    popMatrix();



    pushMatrix();//middle
    translate(fac_zx*sin(noise(4*zx)), fac_zy*cos(noise(zy)));

    
    
      fill(255);

    beginShape();
    for (alpha=0;alpha<(2*PI); alpha+=0.5) {

      vertex(25 * sin(alpha), 23 * cos(alpha));
      // vertex(30 * sin(-alpha), 30 * cos(-alpha));
    }
    endShape(CLOSE);
    fill(0);
    ellipse(-2, -1, 3, 3);
    ellipse(14, 0, 3, 3);
    fill(255);
    popMatrix();




    pushMatrix();//head
    translate(fac_zx*sin(zx), -30);
   
      fill(255);
    
    if(head == true && coloring == true){
      fill(fillcolor);
      head=false;
      //coloring =false;
      
    }
    beginShape();
    for (alpha=0;alpha<(2*PI); alpha+=0.5) {

      vertex(15 * sin(alpha), 15 * cos(alpha));
      // vertex(30 * sin(-alpha), 30 * cos(-alpha));
    }
    endShape(CLOSE);



    fill(0);
    if (squeeze ==false) {
      noStroke();
      ellipse(7, -5, 6, 6);
      ellipse(-4, -4, 6, 6);
      stroke(#EA55B9);
      //right wimpern
      line(5,  -8, 1, -12);
      line(8,  -9, 8, -11);
      line(11,  -8, 14, -11);
      //left wimpern
      line(5-15,  -8, 1-15, -12);
      line(8-15,  -9, 8-15, -11);
      line(11-15,  -8, 14-15, -11);
      
       
    }
    else {
      stroke(0);
      strokeWeight(2);
      line(3, -4, 10, -6);
      line(-7, -4, -3, -6);
      noStroke();
    }


    
      drawCarrot(1, 0);
    

    popMatrix();


    popMatrix(); //end of 
  }



  void keyPressed() {
    
    if(key == '1'){
      one=true;
    }
    
        if(key == '2'){
      two=true;
    }
    
        if(key == '3'){
      three=true;
    }
    
        if(key == '4'){
      four=true;
    }

    
    if(key==CODED){

    if (keyCode ==UP && one_time) {
      fac_zy *=1.1;;
      one_time=false;
      
    }

    if (keyCode == DOWN && one_time) {
      fac_zy *=0.9;;
      one_time=false;
    }

    if (keyCode ==LEFT && one_time) {
      fac_zx *=0.9;
      one_time=false;
    }

    if (keyCode == RIGHT && one_time) {
      fac_zx *=1.1;
      one_time=false;
    }


   
  }
  }


  void chooseColor() {


    randomnumber=random(1);
    if (randomnumber <0.33) {
      fillcolor = color(232, 12, 151);
    }
    else if (randomnumber <0.66) {
      fillcolor = color(232, 93, 12);
    }
    else {
      fillcolor = color(12, 182, 232);
    }
    stroke(255);
  }





  void run() {

    pushMatrix();
    if (mouseX < width/2 + 10 && mouseX > width/2 -10 && mouseY< height/2+20 && mouseY> height/2) {

      squeeze=true;
    }
    else {
      squeeze=false;
    }
    chooseColor();
    //drawCarrot((width/2), (heigth/2+20));
   if(keyPressed){
    keyPressed();
    }
    
    draw();
    drawCurve();
    
    popMatrix();
    noFill();
    stroke(0);
  }
  
  void drawCurve(){
    stroke(#244876);
    pushMatrix();
    translate(250, 250);
    for(float i=0; i<3; i+=0.01){
      ey= fac_zx* sin(noise(zx+0.8)*100*i)*80;
      //ey3= 1.21* sin(noise(zx+0.8)*100*i)*80;
      ex= fac_zy* sin(noise(zy+0.8)*100*i)*80;
      if (i>0){
        stroke(#42BBD8, 100);
        pushMatrix();
        translate(-10,0);
        if(one){
        line(50*i, ey , 50*(i-1), ey_old);
        }
        popMatrix();
     
        
        stroke(#D842A4, 100);
        pushMatrix();
        translate(30,0);
        if(two){
        line(ex ,i,  ex_old, 50*(i-1));
        }
        popMatrix();
        stroke(#85D842, 100);
        pushMatrix();
        translate(15,0);
        if(three){
        line(ex ,i,  ex_old2, 50*(i-1));
        }
        popMatrix();
        
        stroke(#EA8F55);
        pushMatrix();
        translate(-10,15);
        if(four){
        line(50*i, ey , 50*(i-1), ey_old2);
        }
        popMatrix();
        
        
        
        
      

        
      }
      
      ey_old=ey;
      ex_old=ey;
      ey_old2=ex;
      ex_old2=ex;
      //ex_old3=ey3;
  }
  popMatrix();
  }



  void drawCarrot(int _xpos, int _ypos) {
    pushMatrix();
    translate(_xpos, _ypos);
    fill(#E37520);
    //stroke(0);
    beginShape();
    vertex(0, -6);
    vertex(-6, 6);
    vertex(9, 12);
    endShape();
    popMatrix();
  }






  boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}

float xTemp;
float m, a;

class State_8 extends Window{
  
  SantaClaus mySanta;

giantMeatball myMeatball;



 

  State_8() {
    
      mySanta=new SantaClaus();
 myMeatball=new giantMeatball();
    
  
  }



  

  void run() {
    stroke(0);
     background(#A292D8);
 
  mySanta.run();
  myMeatball.run();
  
  PVector one = mySanta.loc;
PVector two = myMeatball.location;
  
 checkCrash(one, two);
   
  }
  
   boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}


class SantaClaus {
  PVector steering;
  PVector loc;
  PVector speed;
  PVector acceleration;
  PVector decceleration;
  PVector frict;



  SantaClaus() {
    steering =new PVector(1, 0);
    loc=new PVector (width/2, height/2);
    speed=new PVector(0, 0.1);
    acceleration = new PVector(0, -0.01);
    
  }

  void Update() {
    speed.limit(10);
    
   speed.add(acceleration);
   frict = speed.get();
   frict.mult(-0.01);
   speed.add(frict);
    
    loc.add(speed);
    if(keyPressed == false){
    acceleration.limit(0.01);
    }
  }

  void Draw() {
       
    
    
    pushMatrix();
    translate(loc.x, loc.y);
    fill(33,33,33);
    //rect(0,0, 30, 10);
rotate(steering.heading2D());


    
     if(keyPressed){
       if(key==CODED){
         if(keyCode == UP){
      
       fill(#FFBD39);
        beginShape();
    vertex(-8,18);
    vertex(-5,35);
    vertex(-2,18);
    
    
    endShape(CLOSE);
    
    
            beginShape();
    vertex(2,18);
    vertex(5,35);
    vertex(8,18);
    
    
    endShape(CLOSE);
       }
       }
      
    }
    
    
    
    
    fill(255,13,13);
        beginShape();
    vertex(-9,20);
    vertex(0,-10);
    vertex(9,20);
    
    
    endShape(CLOSE);
    
        fill(#F5C2A3);
    
    ellipse(0,-5, 10,10);
    
    fill(255);
    beginShape();
    vertex(-5,-5);
    vertex(0,5);
    vertex(5,-5);
    
    
    endShape(CLOSE);
    

    
    
     fill(255,55,13);
        beginShape();
    vertex(-4,-8);
    vertex(0,-20);
    vertex(4,-8);
    endShape();
    
  
    popMatrix();
  }

  void Steer() {
    if (keyPressed) {
      if (key==CODED) {

        if (keyCode == UP) {
        
         
          acceleration.mult(1.1);
          acceleration.limit(1);
          
        }

        if (keyCode == LEFT) {
          rotate2D(steering, -PI/20);

          rotate2D(acceleration, -PI/20);
        }
        if (keyCode == RIGHT) {
       
          rotate2D(steering, PI/20);
          rotate2D(acceleration, PI/20);
        }
      }
    }
  }
 // }
  
  void noWalls(){
    
    if(loc.x >width){
      loc.x=0;
  }
  if(loc.x < 0){
    loc.x = width;
  }
  
      if(loc.y >height){
      loc.y=0;
  }
  if(loc.y < 0){
    loc.y = height;
  }
  }
 
    


void rotate2D(PVector v, float theta) {
  // What's the magnitude?
   m = v.mag();
  // What's the angle?
   a = v.heading2D();
 
  // Change the angle
  a += theta;
 
  // Polar to cartesian for the new xy components
  v.x = m * cos(a);
  v.y = m * sin(a);
}


  void run() {
   Steer();
   Update();
    Draw();
    noWalls();
  }
}


class giantMeatball{
  
  PVector location;
  PVector acceleration;
  PVector steering;
  PVector speed;
  float x_loc;
  float y_loc;
  float xnoise;
  float ynoise;
  float rotz;
  
  
  
  giantMeatball(){
    x_loc = random(width);
    if(x_loc >width/2 -20 && x_loc < width/2 + 20){
      x_loc -=60;
    }
       y_loc = random(width);
    if(y_loc >height/2 -20 && y_loc < height/2 + 20){
      y_loc -=60;
    }
    
     location = new PVector(x_loc, y_loc);
     acceleration = new PVector(random(-0.02, 0.02), random(-0.02, 0.02));
    speed = new PVector(random(-2, 2), random(-2, 2));
    steering=new PVector (random(-1, 1), random(-1, 1));
    
  }
  
  void Update(){
    steering = new PVector (2*(noise(ynoise)-0.5), 2*(noise(xnoise)-0.5));
    
    rotate2D(speed, steering.heading2D());
    speed=new PVector((noise(ynoise)),noise(xnoise));
    
    
    //speed.add(acceleration);
    location.add(speed);
    
   xnoise+=0.01;
  ynoise+=0.01; 
  }
  
  void Draw(){
    pushMatrix();
    translate(location.x,location.y);
    rotate(rotz);
    fill(#CB8F52);
    ellipse(0,0,33,33);
    fill(#A292D8);
    ellipse(0,0, 12,12);
    
    fill(255);
    pushMatrix();
    translate(13*sin(PI/6), 13*cos(PI/6));
    ellipse(0,0,5,5);
    popMatrix();
    
    
        pushMatrix();
    translate(14*sin(PI/3.2), 14*cos(PI/3.2));
    ellipse(0,0,5,5);
    popMatrix();
    
    
        pushMatrix();
    translate(11*sin(1.6*PI), 11*cos(1.6*PI));
    ellipse(0,0,5,5);
    popMatrix();
    
    
        
        pushMatrix();
    translate(9*sin(0.5*PI), 9*cos(0.5*PI));
    ellipse(0,0,5,5);
    popMatrix();
    
    
    popMatrix();
rotz+=0.01;
    
  }
  
  
    void rotate2D(PVector v, float theta) {
    float xTemp = v.x;
    v.x = v.x*cos(theta) - v.y*sin(theta);
    v.y = xTemp*sin(theta) + v.y*cos(theta);
  }
  
  
  void noWalls(){
    
    if(location.x >width){
      location.x=0;
  }
  if(location.x < 0){
    location.x = width;
  }
  
      if(location.y >height){
      location.y=0;
  }
  if(location.y < 0){
    location.y = height;
  }
  }
  
 
  
  void run(){
    Update();
    Draw();
    noWalls();
  }
  
  
}


void checkCrash(PVector one, PVector two){
  if (one.x > two.x -20 && one.x < two.x +20 && one.y > two.y -20 && one.y < two.y +20){
   
   background(random(255),random(255),random(255));
   text("YOU EARNED A COOOOOKIE!!!", width/2, height/2);

  }
  
}

float randomnumber;
color fillcolor;
int alpha2=125;

boolean state1=true;
boolean state2=false;
boolean state3=false;
int currentkey=1;
float s;

class State_9 extends Window{



 

  State_9() {
    
    background(200);
  fill(55, alpha2);

  size(560, 420);
  smooth();
    
  
  }

  
  

  void run() {
  if (state1) {
    fillcolor=55;

    fill(fillcolor, alpha2);
  }


  if (state2) {
    randomnumber=random(1);
    if (randomnumber <0.33) {
      fillcolor = color(232, 12, 151, alpha2);
    }
    else if (randomnumber <0.66) {
      fillcolor = color(232, 93, 12, alpha2);
    }
    else {
      fillcolor = color(12, 182, 232, alpha2);
    }
    stroke(255);

    fill(fillcolor);
  }

  if (state3) {

    currentkey=3;



    randomnumber=random(1);
    if (randomnumber <0.33) {
      fillcolor = color(#31FFA7, alpha2);
    }
    else if (randomnumber <0.66) {
      fillcolor = color(#B6FF31, alpha2);
    }
    else {
      fillcolor = color(#CE8AD8, alpha2);
    }
    stroke(255);

    fill(fillcolor);
  }

  keyPressed();

  s = dist(mouseX, mouseY, pmouseX, pmouseY) + 1;
  noStroke();

  ellipse(mouseX, mouseY, s, s);
  stroke(255);
  point(mouseX, mouseY);
   
  }
  
   boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}



void keyPressed() {
  if (key==CODED) {



    if (keyCode == UP && keyPressed) {
      alpha2+=2;
      fill(fillcolor, alpha2);
    }
    if (keyCode==DOWN && keyPressed) {
      alpha2-=2;
      fill(fillcolor, alpha2);
    }
  }

  if (key ==' ' && keyPressed) {



    background(200);
  }



  if (key == '1' && keyPressed) {

    state1 = true; 
    state2 = false; 
    state3 = false;
  }

  if (key == '2' && keyPressed) {

    state2 = true; 
    state1 = false; 
    state3 = false;
  }


  if (key == '3' && keyPressed) {

    state3 = true; 
    state1 = false; 
    state2 = false;
  }
}




class State_nothingyet extends Window{



 color fillcolor;
 float z2;
 float y2;
 float newY;
   float easing=0.12;
   
   float [] yvalues = new float [width];
   boolean ONCE = true;

  State_nothingyet() {
  
    
  
  }

  void Update() {
    
    fillcolor=color(100*sin(noise(y2)), 125+60*sin(noise(z2)), 120+random(10)+60*cos(noise(z2)), 150);
   


  }

  void Display() {
    fill(fillcolor);
    
    
   rect(-1,-1, width+1, height+1);
    fill(255);
    stroke(255, 125);
   // text("nothingyet", width/2 +random(-2,2), height/2 +random(-2,2));
    text("n o    h i n    e t ", width/2 +random(-2,2), height/2);
    text("n o t          y e t ", width/2, height/2+random(-2,2));
    text("         i n g y e t ", width/2+random(-2,2), height/2);
    text("n o t h  i n         ", width/2, height/2+random(-2,2));
    
    float shift = random(4);
    
    
    float targetY = mouseY;
  
    newY+=(targetY-newY)*easing;
    
    if(newY < height/2+25 && newY > height/2-15){
      
      if(ONCE){
        z2=2;
        ONCE=false;
      }
      
      for(int i=0; i<380; i++){
        yvalues[i]= newY/100*5*sin(0.08*i*z2)+ 8*cos(0.33 * i);
        if (i>0){
          
          line(i, newY+yvalues[i], i-1, newY+yvalues[i-1]);
          ellipse(379, newY+yvalues[379],4,4);
        }
      }
    }else{
      ONCE=true;
    //z2+0;
    line(-10,newY+shift, 380, newY + shift);
    ellipse(380, newY + shift,4,4);
    }
    
    
//       float targetX = mouseX;
//        float targetY= mouseY;
//        dx+=(targetX-dx)*easing;
//        dy+=(targetY-dy)*easing;
  }

  

  void run() {
    Update();
    Display();
        z2+=0.024;
    y2+=0.07;
   
  }
  
   boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}

class State_0 extends Window {



  float increment=0.01;
  float zoff =0.02;
  float zincrement = 0.02; 

  int[] array_xpos = new int[24];
  int[] array_ypos = new int[24];


  int[] numbers_array = new int[24];






  State_0() {

    //super();
  }


  void Display() {


    loadPixels();

    float xoff = 0.0; // Start xoff at 0

      // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
    for (int k = 0; k < width; k++) {
      xoff += increment;   // Increment xoff 
      float yoff = 0.0;   // For every xoff, start yoff at 0
      for (int l = 0; l < height; l++) {
        yoff += increment; // Increment yoff

        // Calculate noise and scale by 255
        float bright = noise( int(k/70), int(l/70), zoff)*255;

        // Set each pixel onscreen to a grayscale value
        pixels[k+l*width] = color(bright, random(15, 50), 23); //the random(x) makes the snowflake effect
      }
    }
    updatePixels();

    zoff += zincrement; // Increment zoff
  }


  void DrawNumbers() {

    for (int i =1; i<25; i++) {
      numbers_array[i-1]= i;
    }

    for (int x=1; x<7; x++) {
      for (int y =1; y<5; y++) {

        xpos = x*70 +35;
        ypos = y*70 +40;
        array_xpos[(x+(y-1)*6)-1] = xpos;
        array_ypos[(x+(y-1)*6)-1] = ypos;

        fill(255, 120);
        textAlign(CENTER);
        text(numbers_array[(x+(y-1)*6)-1], xpos, ypos);
        noFill();
      }
    }
  }

  boolean isStopped() {
    if (keyPressed) {
      if (key == 'r') {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  


  void run() {
    Display();
    DrawNumbers();

  }
}



