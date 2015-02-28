
color bg = 255; //background color

color col[] = new color [100001]; 

color colors[][] = new color [801][801]; 

float x[] = new float [100001]; 

float y[] = new float [100001]; 

PImage logo; //image
  float rc ;
  float bc ;
int sum = 1; //how many points
load new_load = new load();
boolean first_time = true; //is it first time or not? 

float deigmatolipsia;
float r;
float hair_transparency;
float line_transparency;
float ellipse_transparency;
int cases;
PFont v100;
PFont v24;
int lesson;

float or;

String names[][] = new String [102][122]; 

String ects[] = new String [122];
int ects_int[] = new int [122];
int i;
void setup(){
  size(800,800);
  frameRate(30000);
  new_load.read_from_txt();
  v100 = loadFont("verdana_100.vlw");
  v24 = loadFont("verdana_24.vlw");
  
}

void draw(){
  if (first_time){
  zero();
  show_picture();
  point_finder();

  sshow();
  i = 4;
  background(255);
  }
  i = i + 1;
  first_time = false;
  
  sshow();
  interaction(); 
 
 if (i>sum){i=1;}
   what_to_show();
}

void zero(){
  noStroke();
  fill(255);
  rect(-1,-1,800+2,800+2);
  deigmatolipsia = random(0.80,0.90);    //0.8;
  r = random(10,20); //140;
  hair_transparency = random(50,100); //10;
  
  line_transparency = random(1,20); //10;
  
  ellipse_transparency = random(63,90); //10;
  
  
  cases = int(random(-2,3));
  
    if (cases == -1){
    deigmatolipsia = random(0.8,0.9);
    r = random(10,40);
  }
  
  if (cases == 0){
    deigmatolipsia = random(0.80,0.99);
    r = random(10,40);
  }
  
  if (cases == 1){
    deigmatolipsia = random(0.40,0.80);
    r = random(10,40);
  }
  
    if (cases == 2){
r = random(21,40);
  deigmatolipsia = random(0.95,0.99);
  }
  
  
}

void show_picture(){
  or = random(0,5);
  
  if (or<1){
  
  imageMode(CENTER);
  logo = loadImage("logo.png");
  image(logo, 800/2, 800/2);
  
  } else {
  
  lesson = int(random(2,118));
  while ((names[4][lesson].equals("Υ") == false ) && (names[4][lesson].equals("Ε") == false ))   {
    lesson = int(random(2,118));
   
    
  }
  
  textAlign(CENTER,CENTER);
  fill(0);
  textFont(v100,100);
  String textis = names[5][lesson] + " " + ects[lesson] + " δ.μ.";
  text(textis,50,10,700,800);
  }
}

void point_finder(){
  sum = 0;
  if (or>=1){
  rc = 0;
  bc = 55;  
  if(names[4][lesson].equals("Ε") == true){
  rc = 55;
  bc = 0;
  }
  }
   for(int j=1; j<=800-1;j++){
  for(int i=1; i<=800-1;i++){
   
      colors[i][j] = get(i,j);
      if (blue(colors[i][j]) < 255 && (random(0,1) > deigmatolipsia)) { 
        x[sum] = i; y[sum] = j;
        col[sum] = colors[i][j];
        sum++;
      }  
     
     
      
    }
  } 
  
   if (or>=1){
  
    for(int i=1; i<=sum;i++){
col[i] = color(rc,random(0,55),bc);

  
}
   }
}

void what_to_show(){
  
  
  
}

void sshow(){
  
 //i=int(random(4,sum));

//  fill(bg);
//  rect(-1,-1,800+2,800+2);


    if (cases == -1){

      noFill();
      stroke(col[i],100);
      bezier(x[i],y[i],400,400,800,800,-1000,1000);
  textAlign(CENTER,CENTER);
  fill(255);
  textFont(v100,100);
  String textis = names[5][lesson] + " " + ects[lesson] + " δ.μ.";
  text(textis,50,10,700,800);
  }


    if (cases == 0){
 

  
      
      stroke(col[i],40);
      noFill();
      int c = int(random(1,sum));
      int v = int(random(1,sum));
      int b = int(random(1,sum));
      int n = int(random(1,sum));
bezier(x[i],y[i],x[c],y[c],x[v],y[v],x[n],y[n]);

for(int ii=i; ii<=sum;ii++){
      if (dist(x[i],y[i],x[ii],y[ii])<random(10,25)){
        noFill();  
        stroke(255,255); 
               line(x[i],y[i],x[ii],y[ii]);
        
      }
   
    }

    
  }
  
  if (cases == 1){
    
     
      noFill();
      stroke(col[i],10);
      point(x[i],y[i]);
      stroke(col[i],hair_transparency);
      pushMatrix();
      translate(x[i],y[i]);
      bezier(0, 0,  random(-r,r),random(-r,r),random(-r,r),random(-r,r),random(-r,r),random(-r,r));
      popMatrix();
     

  }
  
  if (cases == 2){

      stroke(col[i],10);
      point(x[i],y[i]);
    for(int ii=i; ii<=sum;ii++){
      if (dist(x[i],y[i],x[ii],y[ii])<r){
        noFill();  
        stroke((red(col[i])+red(col[ii]))/2,(green(col[i])+green(col[ii]))/2,(blue(col[i])+blue(col[ii]))/2,line_transparency); 
               line(x[i],y[i],x[ii],y[ii]);
        
      }
   
    
  }
  
  }
     if (i>=sum){i=1;}
      
      noStroke();
  fill(180);
  textAlign(RIGHT);
  textFont(v24,14);
    text("left_click!",800 - 130,800-70);
    text("case: "+cases,800 - 130,800-50);
    text("points: "+sum,800 - 130,800-30);
  
}
  

void interaction(){

}

void mousePressed() {
    if (mousePressed && (mouseButton == LEFT)) { 
    first_time = true;
  } 
}
  


