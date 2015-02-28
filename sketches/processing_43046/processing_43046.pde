
int data[] = {57910, 108200, 149600, 227940, 778330, 1426940, 2870990, 4497070, 5913520};




//PFont myfont;
PImage myimage;


void setup(){
  background(0);
  size(800,600);
  smooth();
 // myfont= loadFont("CenturyGothic-48.vlw");
 // textFont(myfont, 48);
 myimage =loadImage("sunsurf.jpg");
}

void draw(){
  background(0);
  for(int i = 0; i <data.length; i++){
    float X = map(data [i],57000,5000500,0,200);
    //if (dist(mouseX,mouseY,i*90+5,200) < X){
     // fill(0);
    //} else {
      //fill(255);
     
     image( myimage,i*90+5,100,X,X);
    //ellipse(i*150+100,100,X,X);
      text(data[i],i*90+5,300,X);
  //}
 
    //image(myimage,mouseX,mouseY);
 text("Distance between the Sun and Pluto",mouseX, mouseY);
  }
}

