
PImage Startbutton;
int currentPage = 0; //0 represents the start of page
PImage Startpage;//startpage
PImage winniethepoohbackground;//background name
PImage honeypot;//honeypot
color c;//color of background

void setup() {
   size(2500,932);//background size
  // background(0);//color
   Startpage = loadImage("Startpage.png");//StartPage
   Startbutton = loadImage("Startbutton.jpg");//load image 
   winniethepoohbackground=loadImage("winniethepoohbackground.jpg");//name of file 
     if(mouseX==0&&mouseY==4){
    honeypot=loadImage("honeypot.png");//name of file
   
   
   
    
}
}

void draw(){
 if(currentPage == 0){ //current level for the game
     image(Startpage,0,0);
     drawstartbutton(); //draw start button
     
      
}
  else if(currentPage == 1){ //first level
      
     drawLevelOne(); //calling/making level one
     image(honeypot,0,0);
     
  }
 

}



void drawstartbutton(){
    image(Startbutton, 500, 500);//positon of the start button
}



void drawLevelOne(){
    image(winniethepoohbackground,0,0);//position of the image
   
}
void drawLevelTwo(){
    image(honeypot,0,0);
}

void mousePressed(){
  if(currentPage == 0 && mouseX > 500 && mouseX < 725 && mouseY > 500 && mouseY < 725){
      currentPage = 1;//nousePressed
  }

}



    












