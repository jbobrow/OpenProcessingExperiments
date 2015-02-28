
String lines[] = loadStrings("layout.csv");
String lines2[] = loadStrings("lines.csv");
int l=lines.length;int l2=lines2.length;
PVector[] points = new PVector [l];
String names [] = new String [l];float traffic [] = new float[l];
float languageIndex [] =new float [l];String languageType [] = new String [l];
int r=600;
PFont font = createFont("黑体", 20, true); 
int xadd=700; int yadd=300;

void setup ()
{ 
  size(1000, 800);
  background(0);
  readData();
  drawpoints();
}

void drawlinks()
{   
    for (int i=0; i < l2; i++) {
    String [] temp = split(lines2[i], ',');
    float x1 = xadd + float(temp[1])*r; 
    float y1 = yadd + float(temp[2])*r;
    float x2 = xadd + float(temp[4])*r;
    float y2 = yadd + float(temp[5])*r;
    stroke(150,10);
    line(x1,y1,x2,y2);
  }  
}

void readData()
{   
    for (int i=0; i < l; i++) {
    String [] temp = split(lines[i], ',');
    points[i] = new PVector (xadd + float(temp[1]) * r , yadd + float(temp[2]) * r, 0);
    names[i] = temp[0];
    traffic[i] = int(temp[4]);
    languageIndex[i] = float(temp[6]);
    languageType[i] =temp[5];
  } 
}

void drawpoints () 
{ 
     for (int i = 0; i < l; i++) {
     stroke(100);
     float c =  languageIndex[i]+1;
     stroke(c * 3 *20 % 255,c * 5 *20 % 255,c * 7 *20 % 255);
     fill(c * 3 *20 % 255,c * 5 *20 % 255,c * 7 *20 % 255,150);
     ellipse(points[i].x, points[i].y,log(traffic[i])/5,log(traffic[i])/5);          
    } 
}

void draw()
{
background(0);
  label();
  show();
}
void show()
{  
   drawlinks();
  for (int i = 0; i < l; i++) {
  if ( dist(mouseX, mouseY, points[i].x, points[i].y ) < 3 ) {
     stroke(100);
     float c =  languageIndex[i]+1;
     stroke(c * 3 *20 % 255,c * 5 *20 % 255,c * 7 *20 % 255);
     fill(c * 3 *20 % 255,c * 5 *20 % 255,c * 7 *20 % 255,150);
     ellipse(points[i].x, points[i].y,20,20);
     fill(255);
     textFont(font); 
     textSize(20);
     text("网站："+ names[i],50,50); text("语言："+ languageType[i],350,50); text("流量："+ traffic[i],550,50); 
}
else {   
     stroke(100);
     float c =  languageIndex[i]+1;
     stroke(c * 3 *20 % 255,c * 5 *20 % 255,c * 7 *20 % 255);
     fill(c * 3 *20 % 255,c * 5 *20 % 255,c * 7 *20 % 255,150);
     ellipse(points[i].x, points[i].y,log(traffic[i])/5,log(traffic[i])/5);
  }
}
}



String ls [] = {"english" , "chinese" ,   "japanese",   "russian"  ,  "portuguese", "german" ,    "spanish",   
 "french" ,    "polish"  ,   "italian"  ,  "korean"  ,   "czech"  ,    "arabic" ,    "vietnamese",
 "dutch"  ,    "turkish"  ,  "thai"};

void label() 
{
  for (int k=0; k<ls.length; k=k+1){
  int i=k+1;
  stroke(i * 3 *20 % 255,i * 5 *20 % 255,i * 7 *20 % 255);
  fill(i * 3 *20 % 255,i * 5 *20 % 255,i * 7 *20 % 255,150);
  ellipse(25, 40 + 65 + 30*i,10,10);
  textSize(15);
  textFont(font); 
  text(ls[k],45, 40 + 70 + 30 *i);
  }
}


void keyPressed() {  if (key == 's')  save ("D:/year.png");}  


