
//a font that is in the sketch
PFont t;

//variables that will only appear once at the start
void setup(){
  //size of canvas(width, height)
  size(500,500, P3D);
  //rect(x,y) coordinates are now the center of the rect, not the top left corner
  rectMode(CENTER);
  //type of font in the sketch(typeface,font size,true)
  t = createFont("Garamond",16,true);
}

//Variables tha will loop
void draw(){
//conditional statement that will play if 'q' is pressed
  if(key=='q'){
  //customized varible, its instructions are under void colors
 colors();
 //conditional statement that will play if 'w' is pressed
}else if(key=='w'){
//customized varible, its instructions are under void peripheral
  peripheral();
  //conditional statement that will play if 'e' is pressed
}else if(key=='e'){
//customized varible, its instructions are under void read
read();
//conditional statement that will play if 'r' is pressed
}else if(key=='r'){
  //customized varible, its instructions are under void read1
  read1();
  //conditional statement that will play if 'o' is pressed
  }else if(key=='o'){
    //customized varible, its instructions are under void read2
    read2();
//what happens when none of the buttons above are pressed
}else{
}
}
//customized variable that can be used under void draw as a short cut to these instructions
void colors(){
 //background color(red,green,blue)
  background(255);
  //Customized variable(x,y,size,number of levels of gradient)
  grayscale(width*0.5,height*0.5,mouseX,mouseY+1);
}
//Customized variable(x,y,size,number of levels)
void grayscale( float xloc, float yloc, int size, int num){
  //variable x is 255 over what ever the number is
  float x =255/num;
  //variable steps is the size over number
  float steps = size/num;
  //used to make repetitions(int i is the starting point, it's less than the number)
  for (int i = 0; i<num;i++){
    //rect(x,y) coordinates are now the center of the rect, not the top left corner
    rectMode(CENTER);
    //color of outline(r,g,b)
    stroke(0,i*x,0);
    //color of rect()none
    noFill();
    //Rectangle shape(x,y,width,height)
    rect(xloc, yloc, size-i*steps, size-i*steps);
  }
}
  
  //customized variable that can be used under void draw as a short cut to these instructions
void peripheral(){
//background color(r,g,b)
  background(0);
  //(typeface,font size)
  textFont(t,16);
  //text color(r,g,b)
  fill(255);
  //actual text appearing,x,y coordinates of top left corner of text
  text("Click Mouse",5,484);
  //Conditional statement for if the mouse is pressed
  if(mousePressed){
    //color of object(r,g,b)
    fill(0,205,255);
     //color of outline(r,g,b)
    stroke(0,205,255);
    //ellipse shape(x,y, width,height)
    ellipse(mouseY,mouseX,20,20);
    //action for if mouse is not pressed
  }else{
     //color of object(r,g,b)
     fill(217,222,92);
      //color of outline(r,g,b)
    stroke(217,222,92);
     //ellipse shape(x,y, width,height)
    ellipse(mouseX+1,mouseY+1,20,20);
  }
}

//customized variable that can be used under void draw as a short cut to these instructions
void read(){
//color of background(red,green,blue)
  background(255);
     //(typeface,fontsize)
  textFont(t,16);
  //color of text fill(r,g,b)
  fill(0);
  //to align the text in the center
  textAlign(CENTER,CENTER);
    //Actual text appearing,x,y coordinates for center
  text("Type in 'r'.",250,250);
}
//customized variable that can be used under void draw as a short cut to these instructions
 void read1(){
  //color of background(red,green,blue)
  background(255);
  //(typeface,fontsize)
 textFont(t,16);
 //color of text fill(r,g,b)
  fill(0);
  //to align the text in the center
  textAlign(CENTER,CENTER);
  //Actual text appearing,x,y coordinates for center
  text("Congratulations! You can read!",250,250);
    //Actual text appearing,x,y coordinates for center
  text("Type in 'o'.",250,265);
 }
   
 //customized variable that can be used under void draw as a short cut to these instructions
   void read2(){
    //color of background(red,green,blue)
    background(255);
      //(typeface,fontsize)
    textFont(t,16);
    //color of text fill(r,g,b)
  fill(0);
  //to align the text in the center
  textAlign(CENTER,CENTER);
    //Actual text appearing,x,y coordinates for center
  text("Or you can't read",250,250);
    //Actual text appearing,x,y coordinates for center
  text("and you're just pressing all the buttons.",250,265);
  //action for if 'o' is not pressed
  }

