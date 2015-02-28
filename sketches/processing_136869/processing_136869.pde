
//colourvariable
float color1=random(0, 255);
float color2=random(0, 255);
float color3=random(0, 255);
float opacity=random(100, 200);

//eraser1variable
int radius = 40;
float x = 110;
float speed = 2;
int direction = 1;

//eraser2variable
int radius2 = 20;
float r = 50;
float speed2 = 1;
int direction2 = 1;


void setup() {
  size(600, 600);
  background(255);
}

  void draw() {
    
    //reset canvas
  if(keyPressed == true) {
    fill(255); 
    rect(0, 0, 600, 600);}
    
    //instructions1
int start_time7 = 0;
if ( millis() > start_time7) {
fill(0);}
textSize(15);
text ("Welcome to the game!", 400, 100);


  //instructions2
   int start_time9 = 3000;
     if ( millis() > start_time9) {
fill(0);
textSize(15);
text ("Draw on the canvas!", 400, 150);}

 //instructions3
   int start_time10 = 6000;
     if ( millis() > start_time10) {
fill(0);
textSize(15);
text ("Press any key to try again!", 375, 200);}

//instructions4
   int start_time11 = 8000;
     if ( millis() > start_time11) {
fill(0);
textSize(15);
text ("Lets make some abstract art!", 375, 250);}


//circles
int start_time13 = 3000;
  if ( millis() > start_time13) {
if(mousePressed == true) {
int i = 0;
  while ( i <= mouseY) {
     int a = 10;
  while ( a <= 275) {
      int b = 100;
     noStroke();
     fill(a/4, i, 255, 10);
    ellipse(a, i/2, 50, 50);
    a = a + 50;
  }
        i = i + 50;}
  } else {
        ellipse(0, 0, 0,0);
  } }
  
  //paint
  int start_time16 = 3000;
  if ( millis() > start_time16) {
float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
   strokeWeight(weight/8);
   //stroke(#0020E8);
   stroke(color1, color2, color3);
   line(mouseX/2, mouseY, pmouseX/2, pmouseY);}
   

 //eraser1
 int start_time17 = 3000;
  if ( millis() > start_time17 && millis() < 15000 ) {
    noStroke();
 fill(255);
    x += speed * direction;
    if ((x> width/2-radius) ||(x < radius)) {
      direction = -direction;
    }
    if (direction == 1) {
      rect (x, 100, 50, 50);
    } else {
      rect (x, 100, 100, 100);}    } 
      
       //eraser2
 int start_time18 = 6000;
  if ( millis() > start_time18 && millis() < 18000 ) {
    noStroke();
 fill(color1/2, color2/2, color3/2, opacity);
    r += speed2 * direction2;
    if ((r> width/3-radius2) ||(r < radius2)) {
      direction2 = -direction2;
    }
    if (direction2 == 1) {
      rect (r, 300, 25, 25);
    } else {
      rect (r, 300, 50, 50);}    } 
      

//sideellipse
int start_time14 = 3000;
  if ( millis() > start_time14) {
if(mousePressed == true) {
  fill(255);
int x = 10;
  while (x <= 600) {
     int a = 10;
  noStroke();
  fill(color1/3, color2/3, color3/3, 5);
  ellipse(10, x, 500+sin(x)*100, 50);
  x = x + 50;}
  } else {
        ellipse(0, 0, 0,0);
  } }

//circlesatbottom
int start_time20 = 3000;
  if ( millis() > start_time20) {
if (mousePressed == true) {
 int g = 0;
  while ( g <= 300) {
     int h = 0;
  while ( h <= 300 ) {
     fill (h, 100, 100, 50);
    ellipse(h/2, 500+sin(g)*100, 50, 50);
    h = h + 50;
  }
        g = g + 50;
  }} 
  else { 
    ellipse (0, 0, 0,0);}
    
    //canvas
    stroke(#0E249B);
    strokeWeight(10);
    line(305, 0, 305, 600);
  }}


