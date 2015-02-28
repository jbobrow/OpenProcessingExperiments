
PFont font;
PFont font2;
int page = 1; 
int score = 0;

float i = 2;
float i2 =0;

  float fivex=240;
  float fivey=160;
  float fiver=0;
  float o=0;


float x, y;
float node_length = 1.5;
float node_size = node_length-1;
int n_nodes = 350;
float[] nodes_x;
float[] nodes_y;
float delay = 15;
color col_head = color(255);
color col_body = color(255);
color tail = color(179,230,34);
float xx;
float yy;

float metaangle = 0;

//KITE controls

float radius = 100;
float sx = 1;
float sy = 0.5;

float radius2 = 300;
float sx2 = 1;
float sy2 = 3;
float speed = 0.02;

//CIRCLE

float beginx ;
float beginy;
float endx; 
float endy; 
float distx;
float disty;
float step;
float pct =0.0;

float cX1 =0; 
float cY1 =0;
float cR1 =30;

float cX2 =0; 
float cY2 =0;
float cR2 =30;

//////////////////////////////////
void setup(){
  size(480, 320);
  smooth();
  noStroke();

  font=loadFont("QuicksandBold-Regular-13.vlw");
  font2 = loadFont("QuicksandBold-Regular-52.vlw");
  

  x = width/2;
  y = height/2;

  int r1 = 10;
  int r2 = 100;
  int dr = r2-r1;
  float D = 0;

  nodes_x = new float[n_nodes];
  nodes_y = new float[n_nodes];

  for (int i=0; i<n_nodes; i++) {
    float r = sqrt(r1 * r1 + 2.0 * dr * D);
    float d = (r - r1) / dr;

    nodes_x[i] = x - sin(d) * r;
    nodes_y[i] = y + cos(d) * r;

    D += node_length;
  }
}

//////////////////////////////////  
void draw() {

  background(16,115,197);


  //////////////////////////////////
  if (page == 1) {
    pageOne();
  } 
  else if (page == 2) {
    pageTwo(); 
  } 
  else if (page == 3) {
    pageThree(); 
  }
  else if (page == 4) {
    pageFour(); 
  }
  else if (page == 5) {
    pageFive(); 
  } 
  else if (page == 6) {
    pageSix(); 
  } 
  else if (page == 7) {
    pageSeven(); 
  }

  //////////////////////////////////  
  /*if(mousePressed == true){
    // Set the position of the head
    setTarget(mouseX, mouseY);
    metaangle += 0.03; 
    setTarget(mouseX, mouseY);
    rules();
  }
*/
  if((keyPressed == true)&&(key ==' ')){

    float sinval = sin(metaangle);
    float cosval = cos(metaangle);
    float XVar = 240 + (cosval*radius);
    float YVar = 160 + (sinval*radius);
    xx = XVar + cos(metaangle*sx) *radius;
    yy = YVar+ sin(metaangle*sy) * radius;
    metaangle += 0.05; 
    setTarget(xx, yy);
    rules();  
  }
  
   else if((keyPressed == true)&&(key =='z')){

    float sinval = sin(metaangle);
    float cosval = cos(metaangle);
    float XVar = 240 + (cosval*radius);
    float YVar = 160 + (sinval*radius);
    xx = XVar + cos(metaangle*sx2) *radius2;
    yy = YVar+ sin(metaangle*sy2) * radius2;
    metaangle += speed; 
    setTarget(xx, yy);
    rules();  
  }

  else{
    xx = width/2 + cos(metaangle) * 150.0;
    yy = height/2 + sin(metaangle) * 150.0;
    metaangle += 0.03; 
    setTarget(xx, yy);
    rules();
  }

  ////////////////////////////////// 
  // Draw the head
  fill(col_head);
  noStroke();
  ellipse(nodes_x[0], nodes_y[0], 2, 2);

  // Draw the body
  fill(col_body);
  for (int i=1; i < n_nodes; i++) {

    stroke(col_body,min(255,i-1));
    strokeWeight(2);
    //ellipse(nodes_x[i], nodes_y[i], node_size - i/20.0, node_size - i/20.0);
    line(nodes_x[i], nodes_y[i], nodes_x[i-1], nodes_y[i-1]);
  }

  println(score);
}
//////////////////////////////////

void setTarget(float tx, float ty){
  // Motion interpolation for the head
  x += (tx - x) / delay;
  y += (ty - y) / delay;
  nodes_x[0] = x;
  nodes_y[0] = y;

  // Constrained motion for the other nodes
  for (int i=1; i < n_nodes; i++)
  {
    float dx = nodes_x[i - 1] - nodes_x[i];
    float dy = nodes_y[i - 1] - nodes_y[i];
    float len = sqrt(sq(dx) + sq(dy));
    nodes_x[i] = nodes_x[i - 1] - (dx/len * node_length);
    nodes_y[i] = nodes_y[i - 1] - (dy/len * node_length);
  }
}



boolean overKey(int X, int Y, int R) { 
  if (dist(nodes_x[0],nodes_y[0],X,Y)<R/2) { 
    return true;  
  }  
  else { 
    return false;  
  } 
} 

boolean z = false;
boolean overhoop=false;
boolean overhoop2=false;
boolean overhoop3=false;
boolean overhoop4=false;
boolean overhoop5=false;

//////////////////////////////////  

void pageOne() {
  textFont(font2);
  fill(255,220);
 ;
  
  if((keyPressed == true)&&(key ==' ')){
    z = true;

  } if (z){
     textFont(font);
     text("HOLD",310,110);
        
          textFont(font2);
        text("Z",310,160);
  }
  else{
        textFont(font);
     text("TO CHANGE YOUR PATH, HOLD",245,110);
        
          textFont(font2);
     text("SPACE",240,160);
  }


  if (dist(nodes_x[0],nodes_y[0],480,320)<20) { 
    overhoop =true;

  }
 
 


 

 
}
//////////////////////////////////  
void pageTwo() {
  //stroke(
  stroke(0,35,100,i/2);
  strokeWeight(i);
  line(280,-20,200,340);
  i+=3;
  
  mkey(width/2,140);
}
//////////////////////////////////  
void pageThree() {
  background(0,35,100);
  
 mkey(100,100);

}
//////////////////////////////////  
void pageFour() {
    background(0,35,100);
  
 mkey(420,210);
}
//////////////////////////////////  
void pageFive() {
 
  background(0,35,100);
  
  fill(16,115,197,i2/2);
 noStroke();
  ellipse(390,210,i2,i2);
  
  i2+=3;
  
  

  fill(#ecffcf,o);
  ellipse(fivex,fivey,fiver,fiver);
  
 o=+2;
  
  
  
 
}

//////////////////////////////////  
void pageSix() {
  fill(255,220);
    textFont(font);
    text("COLLECT ALL OF THE MAGICAL KEYS",125,160);
    mkey(240,180);
}

//////////////////////////////////  
void pageSeven() {
    background(0,35,100);
  
  fill(16,115,197,i2/2);
 noStroke();
  ellipse(390,210,i2,i2);
  
  i2+=3;
      fill(255,220);
      text("YOU ARE AMAZING",180,160);
}

void rules() {
  if (page == 1) {
    if (overKey(480,320,20)==true) {
      //score ++;
        page = 6; 
      }
    }
  
  else if (page == 2) {
    if (overKey(240,140,20)==true) {
      page = 3; 
    } 
  }
  else if (page == 3) {
    if (overKey(100,100,20)==true) {
      page = 4; 
    } 
  }
  else if (page == 4) {
    if (overKey(430,210,20)==true) {
      page = 7; 
    }  
  }
  else if (page == 5) {
    if (overKey(X,Y,R)==true) {
      page = 6; 
    }
  } 
  else if (page == 6) {
    if (overKey(240,180,10)==true) {
      page = 2; 
    } 
}
  }

void mkey(float x,float y){
 
strokeWeight(3);
stroke(255,220,79);
line(x,y,x,y+5);

strokeWeight(10);
stroke(255,220,79,50);
line(x,y,x,y+5);

strokeWeight(18);
stroke(255,220,79,30);
line(x,y,x,y+5);
}

void circle(float x,float y,float r, float bx,float by, float ex,float ey,float s){



beginx =bx;
beginy =by;
endx = ex;
endy =ey;
step = s;


distx =endx-beginx;
disty = endy-beginy;

pct+=step;
  if (pct <1.0){
    x = beginx +(pct*distx);
    y = beginy +(pct*disty);
   
  }
  
  if (pct>=1){
    pct=0;
  }
  
    
  
    ellipse(x,y,r,r);

  }





