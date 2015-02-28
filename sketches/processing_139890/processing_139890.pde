
int x = 0;
int look = 0;   //look = 0 is left
                //look = 1 is center
                //look = 2 is right
    color c1= color(204, 204, 255);
    color c2= color(255, 204, 204);    
  //Set up colors of Pacmonster
void setup() {    
size(400, 400); //create the screen
noStroke();     //no outlines
smooth();       //make smooth geometry lines
}

void draw() { x = x + (look - 1);
background(0);           // background set to black

   if (mousePressed==true){
   fill(c2);            //   change to pastel peach
}
   else{
     fill(c1);           //     back to pastel purple
}
   
//BODY
  //Bar 1
rect(60 + x, 40, 10, 230);   //Bar 2
rect(70 + x, 30, 10, 240);   //Bar 3
rect(80 + x, 20, 10, 240);   //Bar 4
rect(90 + x, 20, 10, 230);   //Bar 5
rect(100 + x, 10, 10, 250);  //Bar 6
rect(110 + x, 10, 10, 260);  //Bar 7
rect(120 + x, 10, 10, 260);  //Bar 8
rect(130 + x, 10, 10, 250);  //Bar 8
rect(140 + x, 20, 10, 230);  //Bar 9
rect(150 + x, 20, 10, 240);  //Bar 10
rect(160 + x, 30, 10, 240);  //Bar 11
rect(170 + x, 40, 10, 230);  //Bar 12

//When Monster stops eyes go crazy
//EYES
fill(255);               //fill white for the eyes
rect(60 + look * 10 + x, 50, 10, 30);    //Bar 1
rect(70 + look * 10 + x, 40, 10, 50);    //Bar 2
rect(80 + look * 10 + x, 40, 10, 50);    //Bar 3
rect(90 + look * 10 + x, 50, 10, 30);    //Bar 4
rect(120 + look * 10 + x, 50, 10, 30);   //Bar 5
rect(130 + look * 10 + x, 40, 10, 50);   //Bar 6
rect(140 + look * 10 + x, 40, 10, 50);   //Bar 7
rect(150 + look * 10 + x, 50, 10, 30);   //Bar 8

//PUPILS
fill(25, 65, 250);       //fill blue for pupils
rect(60 + look * 20 + x, 60, 10, 20);    //Bar 1
rect(70 + look * 20 + x, 60, 10, 20);    //Bar 2
rect(120 + look * 20 + x, 60, 10, 20);   //Bar 3
rect(130 + look * 20 + x, 60, 10, 20);   //Bar 4

//I messed up here on the eyes
//Code is to follow the Monster
if(mouseX < 120 + x){
    look=0;
  }
  else if(mouseX > 120 + x){
    look = 2;
  } else {
    look = 1;
  }
   //To allow Monster to move. 
  if (mouseX < 120 + x){
    x=x-1;
  }
  if (mouseX >= 120+x) {
    x=x+1;
  }
}


