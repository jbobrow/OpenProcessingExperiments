
//Lee Jin Qing 2013-09-15


void setup() {
  size(600,600); //Define display window size
  smooth(); //Draw all geometry with smooth
}

int x= -300;//set initial x postion of line
int y = 0;//set initial y position of line
int bg = 255;//set initial background color


void draw (){
  strokeWeight(10);
  color c1 = 0;
  background(bg);
  line(mouseX,mouseY,pmouseX,pmouseY); 
  stroke(c1);
  
  
  
  strokeWeight(50);//set thickness of following lines to be 50
  line(x,y,x,y+600); //draw thick balck stripes and set it moving from the left towards the right
  line(x+100,y,x+100,y+600);
  line(x+200,y,x+200,y+600);
  line(x+300,y,x+300,y+600);
  line(x+400,y,x+400,y+600);
  line(x+500,y,x+500,y+600);
  line(x+600,y,x+600,y+600);
  line(x+700,y,x+700,y+600);
  line(x+800,y,x+800,y+600);
  line(x+900,y,x+900,y+600);
  line(x+1000,y,x+1000,y+600);
  
  x = x+1;
  if (x>50){
    x = -250;
  }
  
strokeWeight(1);
fill(0);
ellipse(450, 450, 100, 100);
ellipse(500, 500, 100, 100);
ellipse(420, 500, 80, 80);
ellipse(380, 450, 70, 70);
ellipse(550, 470, 50, 50);
ellipse(500, 470, 50, 50);
ellipse(25, 25, 50, 50);
ellipse(25, 25, 50, 50);
ellipse(25, 25, 50, 50);
ellipse(25, 25, 50, 50);
ellipse(25, 25, 50, 50);


}

void mouseClicked() {
  color c2 = #FDD7E4;//set 7 different background colors
  color c3 = #F9966B;
  color c4 = #FFE5B4;
  color c5 = #C3FDB8;
  color c6 = #99C68E;
  color c7 = #8EEBEC;
  color c8 = #E3E4FA;
  
  if(bg == 255){ //set the color of white stripes changes when mouse button is clicked
    bg = c2;
  }else if(bg == c2){
    bg=c3;
  }else if(bg == c3){
    bg=c4;
    }else if(bg == c4){
    bg=c5;
    }else if(bg == c5){
    bg=c6;
    }else if(bg == c6){
    bg=c7;
    }else if(bg == c7){
    bg=c8;
    }else if(bg == c8){
    bg=255;
    }
 

   
 }
