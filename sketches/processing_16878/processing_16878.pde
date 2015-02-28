
// 3D line plot of "There Was A Father (1941)" images.
// This Processing script/applet is designed to analyze the grayscale histograms of the film.


int cols = 128; // the dimension of the 3D plot
int rows = 360;
float[][]myArray = new float[rows][cols]; // Actual data of grayscales
String[] p;
String[][] pp;

// Camera position
float posx = 0;
float posy = 350;
float posz = 250;

// Mouse movement
int mouseDragX, mouseDragY;
int mouseSpeedX, mouseSpeedY;

// Coordinate Translation
float rotx = -PI/3; 
float rotz = 2*PI;
// Zoom
int zoom = 1;
// Ratio of the x-axis / y-axis
int plotratio = 1;

//Image URL
String url;
String caption1, caption2;

// Image for the display
PImage img;

// Image display width and height
int img_w, img_h, img_displayw, img_displayh;

// Image scene number, minute and second.
int scene_no, hour_val, minute_val, second_val;
String scene_no_str, hour_str, minute_str, second_str;

// Image scene number, minimum and maximum.
int scene_no_min,scene_no_max;
String snminstr, snmaxstr, min_hour, min_minute, min_second, max_hour, max_minute, max_second;

// scene number function outputs
int hv, mv, sv, sn, h_val, m_val, s_val;
String sn_str, h_str, m_str, s_str;



// Display font
PFont fontA;


///// SETUP


void setup()
{
  size (500,500,P3D);
  
  // Load the font
  fontA=loadFont("FuturaBT-Light-14.vlw");
  textFont(fontA);

  // Load the table 
  String lines[]=loadStrings("https://spreadsheets.google.com/pub?key=0AovDPxTmQGH7dC1nYlptTFlpR3BEYkZheWJDbENPQ3c&hl=en&output=txt");
  scene_no_min =10000; // setting up for the minimum and maximum scene number detection;
  scene_no_max =0;
  
  // Read the data
  for (int i=0; i<rows; i++) 
      {
        p= split(lines[i],'\t');
        scene_no = int(p[0]);
        if (scene_no<scene_no_min){
          scene_no_min = scene_no;
        }
        if (scene_no>scene_no_max){
          scene_no_max = scene_no;
        }
        println(scene_no);
      println(scene_no_min);  
        for (int j=0; j<cols; j++) 
        {
          myArray[scene_no-scene_no_min][j]=float(p[j+1]);
          println(myArray[i][j]);
        }
      }
      
      
  plotratio = int(rows/cols);// Plot has to be close to 1:1
  if (plotratio == 0){
   plotratio =1;
  } 

  // Create the string values for the start scene;
  scene_no_conversion(scene_no_min); 
 
  snminstr = sn_str;
  min_hour = h_str;
  min_minute = m_str;
  min_second = s_str;

  // Create the string value for the end scene;
  scene_no_conversion(scene_no_max);  
  
  snmaxstr = sn_str;
  max_hour = h_str;
  max_minute = m_str;
  max_second = s_str;
 
  // Create the captions
  caption1 = "THERE WAS A FATHER (1941) Directed by Yasujiro Ozu";
  caption2 = "Grayscale Analysis, " + min_hour + ":" + min_minute + ":" + min_second + "-" + max_hour + ":" + max_minute + ":" + max_second;

  // Plot the default scene
  scene_no = scene_no_min+1;
  
  scene_no_conversion(scene_no);
  scene_no_str = sn_str;
  hour_str = h_str;
  minute_str = m_str;
  second_str = s_str; 

  // Show the Thumbnail for the default scene  
  image_display();
  img_w = img.width;
  img_h = img.height;
  img_displayw = 120;
  img_displayh = int((float(img_h)/float(img_w))*img_displayw);
  image_display();
  
  // Display the captions; 
  if ((mouseDragX==0) && (mouseDragY==0)){
    camera();
    image(img,20,30,img_displayw,img_displayh);
    textMode(SCREEN);
    text (caption1, 40+img_displayw, 30, 1000, 40);
    text (caption2, 40+img_displayw, 50, 1000, 40);
    text ("Scene : " + scene_no_str, 40+img_displayw, 70, 1000, 40);
    text ("Image at", 40+img_displayw, 90, 400, 40);
    text (hour_str + "hr", 40+img_displayw, 110,100,20);
    text (minute_str + "min.", 110+img_displayw, 110, 100, 20);
    text (second_str + "sec.", 180+img_displayw, 110, 100, 20);
 }
}


void draw() {
 frameRate(100);
 //directionalLight(-1020, -102, -1020, 0, 0, -1);
  ambientLight(255,255,255);
  background(40,0,10);
     
  move();
  display(); 
  
  scene_no_conversion(scene_no); 
  scene_no_str = sn_str;
  hour_str = h_str;
  minute_str = m_str;
  second_str = s_str; 
  camera();
    image(img,20,30,img_displayw,img_displayh);
    textMode(SCREEN);
    text (caption1, 40+img_displayw, 30, 1000, 40);
    text (caption2, 40+img_displayw, 50, 1000, 40);
    text ("Scene : " + scene_no_str, 40+img_displayw, 70, 1000, 40);
    text ("Image at", 40+img_displayw, 90, 400, 40);
    text (hour_str + "hr", 40+img_displayw, 110,100,20);
    text (minute_str + "min.", 110+img_displayw, 110, 100, 20);
    text (second_str + "sec.", 180+img_displayw, 110, 100, 20);
  }
 



void move() {
  camera( posx, posy-zoom, posz-zoom, // eyeX, eyeY, eyeZ
  0, 0, 0, // centerX, centerY, centerZ
  0, 0, -1.0); // upX, upY, upZ
}

void display() {
  pushMatrix();
  
  if (mousePressed==true) {
    rotx+=atan(mouseDragY/(posy-zoom));
    rotz+=atan(mouseDragX/(posy-zoom));
  }
  else {
    rotx+=0.2*atan(mouseDragY/(posy-zoom));
    rotz+=0.2*atan(mouseDragX/(posy-zoom));
  }

  rotateX(-0.2*rotx);
  rotateZ(-0.2*rotz);

  translate(-rows/2, -plotratio*cols/2+30,0);
  head();
  popMatrix();
}

void head() {
  strokeWeight(3);
    for (int j=1; j<cols-1; j++) {
      for (int i=-15; i<-5; i++){
      
      stroke(255*j/(cols-1),255*j/(cols-1),255*j/(cols-1));
 
      line(i,plotratio*(j-1),0,i,plotratio*j,0);
    }
    }
  strokeWeight(1);
  for (int i=0; i<rows; i++) {
    for (int j=1; j<cols-1; j++) {
      if (i == scene_no-scene_no_min){
        stroke(255,0,0);
      }else{
      stroke(255*j/(cols-1),255*j/(cols-1),200*j*(myArray[i][j])+50);
      }
      line(i,plotratio*(j-1),300*myArray[i][j-1],i,plotratio*j,300*myArray[i][j]);
    }
  }
}



void mousePressed(MouseEvent e) {
  if (e.getClickCount()==1) {
    mouseDragX = mouseDragY = 0;  // The drag starts here
  }
  if (e.getClickCount()==2) {
    rotx = -PI/3; 
    rotz = 2*PI;
    zoom=1;
  }
}

void mouseDragged() {
  mouseDragX += (mouseX - pmouseX);
  mouseDragY += (mouseY - pmouseY);
  mouseSpeedX = mouseX - pmouseX;
  mouseSpeedY = mouseY - pmouseY;
}

void mouseReleased() {
  mouseSpeedX = mouseX - pmouseX;
  mouseSpeedY = mouseY - pmouseY;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if(scene_no<scene_no_max){
        scene_no += 1;
      }
    } else if (keyCode == LEFT) {
      if (scene_no>scene_no_min){
        scene_no -= 1;
      }
    } else if (keyCode == UP) {
      zoom += 1;
    } else if (keyCode == DOWN) {
      zoom -= 1;
    }    
   }
}

void keyReleased(){
  image_display();
}


void image_display(){
  
  String url = "https://dl.dropbox.com/u/2614917/CCA2/CCA_"+ scene_no_str +".jpg";
  img = loadImage(url, "jpg");

}

void scene_no_conversion(int sn){
  if (sn > scene_no_max){
    sn = scene_no_max;
  }
  if (sn < scene_no_min){
    sn = scene_no_min;
  }
    if (sn<10){
      sn_str = "000" + sn;
    }
    if ((sn<100)&&(sn>=10)){
      sn_str = "00" + sn;
    }
    if ((sn<1000)&&(sn>=100)){
      sn_str = "0" + sn;
    }
    if (sn>=1000){
      sn_str = str(sn);
    }

      h_val = int((sn-1)/3600);
      m_val = int((sn-1)/60);
      s_val = int((sn-1)%60);
      
      h_str = "0" + h_val;
      
      if (m_val < 10){
        m_str = "0" + m_val;
      } else {
        m_str = str(m_val);
      }
      if (s_val < 10){
        s_str = "0" + s_val;
      } else {
        s_str = str(s_val);
      }
}

