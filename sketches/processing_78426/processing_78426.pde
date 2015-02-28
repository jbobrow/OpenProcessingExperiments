
PFont f;
String message = "Click Mouse!";
Letter[] letters;
float R;

void setup(){
  size (300,200);
  f=createFont("Impact",40,true);
  textFont(f);
  
  letters = new Letter[message.length()];
  int x = 50;
  for (int i=0; i<message.length();i++){
    letters[i]= new Letter (x,100,message.charAt(i));
    x+= textWidth (message.charAt(i));
  }
  
}



void draw(){
  background(255);
  
  
  for (int i =0; i<letters.length;i++){
    letters[i].display();
    if(mousePressed){
      letters[i].shake();
    }else{
      letters[i].home();
    }
  }
}


class Letter{
  char letter;
  float homex,homey;
  float x,y;
  Letter(float x_,float y_, char letter_){
    homex=x=x_;
    homey=y=y_;
    letter=letter_;
  }
  void display(){
    
   
    
    if (mousePressed){
      fill(random(255),random(255),random(255));
      //rotate (R);
      //R +=0.00001;  
    }else{
      fill(0);
    }
    textAlign(LEFT);
    text(letter,x,y);
    
  }
  
  void shake(){
    x+=random(-5,5);
    y+=random(-5,5);
  }
  
  void home(){
    x=homex;
    y=homey;
  }
  
}




