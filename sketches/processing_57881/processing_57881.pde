
Word [] words ;
float speedx = .5;
float angle=0;
float x = 100;
float y = 200;
int mode = 0, stime;



void setup(){
size (800, 800);
smooth();
noStroke ();
stime=millis();



words = new Word [70];
  for (int i= 0; i< words.length; i++){
  words[i] =new Word (random (width), random (height), random(10,60));
 
  
  }

}
  void keyPressed () { 
   if (key==' '){  
   mode=1;
      
   }
   
  }
void draw(){
background (0);  
  
  float x1,y1;
  
  x1 = cos (radians (angle))*300+ width/2;
  y1 = sin(radians(angle*2)) *100 + height/2;
  fill (255,255,77);
  ellipse (x1,y1,700,700);
  angle +=.25;
 
  


  if (mode ==0){
    startscreen();
    
  }else if (mode==1){
  for (int i = 0; i < words.length; i++){
  words [i].display();
  words[i].move();
  
  
}
fill (255,255,255); 

textSize (50);
String s1 = "Year "; //timer
String sc1 = s1 + years(); 
text (sc1,width/2-100, height/2, 500,500);  
}
  
  
}


class Word
{ 
  float x,y,fontsize;
  Word (float xpos, float ypos, float _fontsize){
    x= xpos;
    y= ypos;
    fontsize = _fontsize;
  
    if (fontsize<=10){
      fontsize=10;
    }
  }

  void move (){
    x+= speedx*.05*fontsize;//help from the other Keith Peters.
 
    if (x> width){
      x=width;
      x = -100;
    }
  
    if (years()>=2012){
      speedx=0;
    }
  }

  void display (){

    textSize (fontsize);
    fill (age()*20-10,100,age()*5);
    String s = "Lorem Ipsum";
    text(s, x, y, 200, 200);
  }

  
}


void startscreen(){
  background (0); 

  
  String r = "press SPACE BAR";
  text(r, height/2, width/2-80, 100, 100);
  

}

int age(){
    int age =(millis()-stime)/5000;
    return age;
}


int years (){
int years= 1974 + age();
  
  if (years >=2012){
  years = 2012;
  }
  
  return years;
  
}




