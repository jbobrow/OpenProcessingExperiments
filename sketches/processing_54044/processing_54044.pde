
//TEXT!!!

float a = 38; //text size. should be bigger in the front and get smaller
int d = 44; //color gradient. should be darker and grow lighter in the background
float xtext = 4; //to change the size of the font gradually as the word gets pushed back


//word Slices
int b = 300; //positioning of the word on x axis. should be far apart and get closer together
int c = 400; // " " " " " y axis. 
int Xaxis =30;
int Yaxis = 60;

//Word Eat
int e = 100;    //postion of word 2 on x axis. 
int f = 414;    //position of word 2 on y axis.
int Xaxis2 = 25;
int Yaxis2 = 60;

PFont fonticulus; 


void setup(){
    size(450,450);
    background(#DCF3F5);
    noStroke();
   fill(67,62,62,50);
   rect(0,0,450,100);
   fonticulus = loadFont ("BookmanOldStyle-Bold-90.vlw");
    
    
}


void draw(){
 
  
 
  textFont(fonticulus);
  //word slices
 smooth();
 noStroke();
 fill(0,0,d);
 textSize(a);
 text("SLICES",b,c);
 
 //word 2 : EAT 
 //Need to move the position to the left. All else is same (hopefully)....damnit. NOT THE SAME! Hence the extra variables. 
  smooth();
 noStroke();
 fill(0,0,d);
 
 textSize(a);
 text("EAT",e,f);
 

}

void mousePressed (){

    
 
  a = a - xtext;
    xtext = xtext + 0.5;
    d = d + 20;
    
    b = b - Xaxis;
    c = c - Yaxis;
    Xaxis = Xaxis - 10;
    Yaxis = Yaxis - 5;
  
  
    e = e - Xaxis2;
    f = f - Yaxis2;
    Xaxis2 = Xaxis2 - 10;
    Yaxis2 = Yaxis2 - 5;
 
 


}
//God that is complicated. Is there another, easier way of doing this? Mental Note!


