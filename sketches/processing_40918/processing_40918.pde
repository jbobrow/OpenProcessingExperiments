
int data[] = {600,500,200,300};




//PFont myfont;
PImage myimage;


void setup(){
  background(0);
  size(800,800);
  smooth();
 // myfont= loadFont("CenturyGothic-48.vlw");
 // textFont(myfont, 48);
 myimage =loadImage("booger_revenge_nerds2.jpg");
}

void draw(){
  background(0);
  for(int i = 0; i <data.length; i++){
    float X = map(data [i],100,700,0,200);
    //if (dist(mouseX,mouseY,i*150+100,100) < X/2){
      //fill(0);
   // } else {
     // fill(255);
      
     image( myimage,i*150+100,100,X,X);
    //ellipse(i*150+100,100,X,X);
      text(data[i],i*150+100,300,X);
  }
  
    //image(myimage,mouseX,mouseY);
 // text("SteveJobzzzz SON!!!",mouseX, mouseY);
  }
 // }



