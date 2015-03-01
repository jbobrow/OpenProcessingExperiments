
PFont font;
PImage b;
PImage c;
//Pshape (illustrator shape).svg -save to Data folder
PShape s;







void setup(){
  
 
font = loadFont("Garamond-48.vlw");




//how do i get this to not show up at first?
b = loadImage("john_yoko.jpg");
c = loadImage("Gustav_Klimt.jpg");


size(500,500);
rect(100,100,10,10);


s = loadShape("crazy.svg");


}







void draw(){
  
  
  
  
//setting up my own commands

//#1
  if(key == 'q'){
banana();

  }
  
//#2
  if(key == 'w'){
apple();
}


//#3
if(key == 'e'){
avocado();
}
}







//#1
void banana(){
  background(252,237,238);
    textFont(font);
    
    text("naked", 250,250);
    
   
    text("rum", 20,290);
    text("oyster", 75,100);
    text("lamb", 300,455);
    text("stone", 100,400);
    text("water", 400,90);
    text("salt", 165,30);

    
    
}





//#2
void apple(){
  background(252,247,230);
  image(b, 120, 80, 249, 339);
  
  
}





//#3
void avocado(){
  background(255);
  
  
  //Pshape (illustrator).svg -Save to data folder
  
   shape(s, 0, 0, 500, 500);
  
}

