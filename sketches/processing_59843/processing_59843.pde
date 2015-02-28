
PFont f;
float noiseS=0.02;




Word [] words ;
float speedx = .5;
float angle=0;
float x = 100;
float y = 200;
int mode = 0, stime;
float inc = 0;
float r = 200;



void setup(){
size (800, 800);
smooth();
noStroke ();
stime=millis();
f = loadFont ("Times-Roman-48.vlw");



String[]data =loadStrings("celebs-top100.txt");
words = new Word [data.length];
  for (int i=0; i < data.length; i++){   //very important line o code!!!
    String[] pieces = split (data[i], TAB);
    String title = pieces[1];
    float nameOccur = parseFloat (pieces [2]);
    float nameYear = parseFloat (pieces[0]);
    words[i] =new Word (random(width), random(height)*1.2, nameOccur, title, nameYear);
 
  
  }

}
  void keyPressed () { 
   if (key==' '){  
   mode=1;
      
   }
   
   //if (mode ==2){
     //mode = 0;
      
   //}
  }
  
void draw(){
background (0);  
  float x1,y1, x2, y2;
  x1 = cos (radians (angle))*300+ width/2;
  y1 = sin(radians(angle*2)) *100 + height/2;
  fill (255);
  ellipse (x1,y1,r, r);
  angle +=.25;
  inc +=.1;
  r++ ;
  if (r > width) {
    r = width; 
  }

 if (mode ==0){
    startscreen();
    
  }else if (mode==1){
  for (int i = 0; i < words.length; i++){
  words [i].display();
  words[i].move();
  }
  
fill (0); 
textSize (50);
String s1 = "Year "; //timer
String sc1 = s1 + years(); 
text (sc1,width/2-100, height/2, 800,800);
 
  
  }else if (mode ==2){
    endscreen();
    
  
  
  }
  
  
}


class Word{ 
 
  float x,y, fontsize, nameYear, nameOccur;
  String title;
  
  Word (float xpos, float ypos, float _nameOccur, String _title, float _nameYear){
    x= xpos;
    y= ypos;
    title = _title;
    nameYear = _nameYear;
    nameOccur = _nameOccur;
   fontsize = nameOccur;
  
  textFont (f, fontsize);
  
    if (fontsize<=10){
      fontsize=10;
    }
  }

  void move (){
    x+= speedx*.07*fontsize;//help from the other Keith Peters.
 
    if (x> width){
      x=width;
      x = -50;
    }
  
    if (years()>=2012){
      speedx=0;
      mode =2;
 
    }
  }

  void display (){

   float noiseVal = noise((mouseX+x)*noiseS,mouseY*noiseS); //from prossessing noise example
    
    if (years()== nameYear){
    textSize (fontsize);
    fill (noiseVal*255,noiseVal*255,255);
    String s = title;
    text(s, x, y, 600, 600);
  }
 }
}  



void startscreen(){
  background (0); 
  textSize (16);
  fill (139,10,255);
  String r = "press SPACE BAR";
  text(r, height/2, width/2-100, 200, 200);
  

}

void endscreen(){
  background (0);
  
  textSize (20);
  fill (139,10,255);
  String s = "text tags showing the number of times"; 
  String t = "a celebrity has been the main subject of a story"; 
  String u = "in People Magazine from 2000 to present";
  text (s, height/2-100, width/2, 800, 800);
  text (t, height/2-100, width/2+20, 800, 800);
  text (u, height/2-100, width/2+40, 800, 800);
  
  
 
}

int age(){
    int age =(millis()-stime)/3000;
    return age;
}


int years (){
int years= 2000 + age(); //info goes from 1979 but is small numbers until the aughts. 
  
  if (years >=2012){
  years = 2012;
  }
  
  return years;
  
}







